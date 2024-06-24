@tool
extends Node2D
class_name Slide

var tasks:Array[Callable]
var current_task:int

func _init():
	pass


func process(delta):
	position.x += delta * 50



func next_task() -> void:
	var todo:Callable = tasks[current_task]
	current_task += 1
	todo.call()

func prev_task() -> void:
	current_task -= 1
	var todo:Callable = tasks[current_task]
	todo.call()

func no_more_tasks() -> bool:
	if current_task == len(tasks) - 1:
		return true
	return false

func first_task() -> bool:
	if current_task == 0:
		return true
	return false
	
func enter() -> void:
	pass

func exit() -> void:
	pass
