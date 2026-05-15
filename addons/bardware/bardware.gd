@tool
extends EditorPlugin

# Replace this value with a PascalCase autoload name, as per the GDScript style guide.
const AUTOLOAD_NAME = "BardwareSoundSync"


func _enable_plugin():
	# Check and make a sound directory
	if DirAccess.open("res://sound") == null:
		DirAccess.open("res://").make_dir("sound")
	
	# The autoload can be a scene or script file.
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/bardware/sync.gd")


func _disable_plugin():
	remove_autoload_singleton(AUTOLOAD_NAME)
