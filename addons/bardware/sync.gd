extends Node

const SOUND_DIR = "patchbard"

var res_snd: DirAccess
var usr_snd: DirAccess

# TODO: Add dot.seperated.properties in filename
func _ready() -> void:
	res_snd = DirAccess.open("res://sound")
	if DirAccess.open("res://sound") == null:
		push_error("res://sound does not exist!")
		return
	
	if DirAccess.open("user://"+SOUND_DIR) == null:
		DirAccess.open("user://").make_dir(SOUND_DIR)
	usr_snd = DirAccess.open("user://"+SOUND_DIR)
	
	if FileAccess.open("user://"+SOUND_DIR+"/bardsync.txt", FileAccess.READ) == null:
		FileAccess.open("user://"+SOUND_DIR+"/bardsync.txt", FileAccess.WRITE).close()
	
	# Walk and sync directories
	var res_dirs = walkjustdir("res://sound")
	
	for res_dir in res_dirs:
		var usr_dir: String = res_dir \
			.replace("res://sound", "user://"+SOUND_DIR)
		
		if DirAccess.open(usr_dir) == null:
			DirAccess.make_dir_absolute(usr_dir)
	
	# Walk and sync files
	var res_files = walkdir("res://sound")
	
	for res_file: String in res_files:
		var usr_file = res_file \
			.replace("res://sound", "user://"+SOUND_DIR)
		
		if FileAccess.open(usr_file, FileAccess.READ) == null:
			DirAccess.copy_absolute(res_file, usr_file)

func walkjustdir(path):
	var dir = DirAccess.open(path)
	
	var contents = []
	for d in dir.get_directories():
		contents.append(path + "/" + d)
		contents.append_array(
			walkjustdir(path + "/" + d)
		)
	
	return contents


func walkdir(path):
	var dir = DirAccess.open(path)
	
	var contents = []
	for d in dir.get_directories():
		contents.append_array(
			walkdir(path + "/" + d)
		)
	for f in dir.get_files():
		if f == "bardsync.txt":
			continue
		contents.append(path + "/" + f)
	
	return contents
