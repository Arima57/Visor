@tool
extends Node2D
class_name Slide

var tasks:Array[Callable]
var current_task:int = 0
var activated:bool = false
@export var transition_enter:StringName = Transitions.slide_left
@export var transition_exit:StringName = Transitions.slide_out_left
@export var animator:AnimationPlayer
@export var position_offset_x:float = 0
@export var position_offset_y:float = 0
@export var initial_position:Vector2 = self.position


func _ready():
	print(transition_enter)
	if transition_enter == "":
		transition_enter = Transitions.slide_left
	
func _process(delta):
	if activated:
		position = initial_position + Vector2(position_offset_x, position_offset_y)



func next_task() -> void:
	var todo:Callable = tasks[current_task]
	current_task += 1
	todo.call()

func prev_task() -> void:
	current_task -= 1
	var todo:Callable = tasks[current_task]
	todo.call()

func no_more_tasks() -> bool:
	if current_task == len(tasks):
		return true
	return false

func first_task() -> bool:
	if current_task == 0:
		return true
	return false

func enter(reverse:bool = false) -> void:
	activated = true
	if !reverse:
		animator.play(transition_enter)
	else:
		animator.play(transition_enter)

func exit(reverse:bool = false) -> void:
	if !reverse:
		animator.play(transition_exit)
	else:
		animator.play(transition_exit)
	print(animator.current_animation)
	await animator.animation_finished
	activated = false
