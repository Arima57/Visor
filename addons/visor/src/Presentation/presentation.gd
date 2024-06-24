@tool
extends Control
class_name Presentation

@export var slides:Array[Slide]
var current_slide_index:int = 0
var current_slide:Slide


func _ready():
	for child in get_children():
		if child is Slide and child not in slides:
			slides.append(child)

	current_slide = slides[current_slide_index]
	current_slide.enter()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	if event.is_action_pressed('ui_right'):
		if slides[current_slide].no_more_tasks():
			current_slide.exit()
			current_slide_index += 1
			current_slide = slides[current_slide_index]
			current_slide.enter()
	
func _process(delta):
	current_slide.process(delta)
