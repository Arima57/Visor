@tool
extends Control
class_name Presentation

@export var slides:Array[Slide]
var current_slide_index:int = 0
var current_slide:Slide


func _ready() -> void:
	print(slides)
	for child in get_children():
		if child is Slide and child not in slides:
			print(child)
			slides.append(child)

	current_slide = slides[current_slide_index]
	current_slide.enter()


func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("Next") and !event.is_echo():
		if current_slide.no_more_tasks():
			current_slide.exit()
			current_slide_index += 1
			print(current_slide_index)
			print(current_slide)
			current_slide = slides[current_slide_index]
			current_slide.enter()
	
	if event.is_action_pressed("ui_left") and !event.is_echo():
		if current_slide.no_more_tasks():
			current_slide.exit(true)
			current_slide_index -= 1
			print(current_slide_index)
			print(current_slide)
			current_slide = slides[current_slide_index]
			current_slide.enter(true)
