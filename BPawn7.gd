extends Sprite2D

var drag_start = Vector2.ZERO
var start_pos = Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		drag_start = get_global_mouse_position()
		start_pos = position
		set_process_input(true)

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		set_process_input(false)

func _input_event(event):
	if event is InputEventMouseMotion:
		var drag_vector = get_global_mouse_position() - drag_start
		position = start_pos + drag_vector
