@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("Transitions", "res://addons/visor/src/Slides/Transitions/Transitions.gd")


func _exit_tree():
	pass
