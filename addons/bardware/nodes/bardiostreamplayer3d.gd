# @tool
# @icon("icon.png")

class_name BardioStreamPlayer3D
extends AudioStreamPlayer3D

## Check to override bardware patching logic.
## This does not take effect at runtime
@export var do_not_patch: bool = false

func _enter_tree() -> void:
	if do_not_patch:
		return
	
	var new_path = stream.resource_path.replacen("res://sound/", "user://patchbard/")
	if stream is AudioStreamWAV:
		stream = AudioStreamWAV.load_from_file(new_path)
	elif stream is AudioStreamMP3:
		stream = AudioStreamMP3.load_from_file(new_path)
	elif stream is AudioStreamOggVorbis:
		stream = AudioStreamOggVorbis.load_from_file(new_path)
	else:
		push_error("This stream type is not supported by Bardware")
	
	if autoplay:
		play()
