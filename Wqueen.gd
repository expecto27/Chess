extends CharacterBody2D

var center_position = Vector2(35, 40)

var cells_x = [10, 79, 148, 218, 287, 356, 425, 494]
var cells_y = [10, 78, 145, 213, 280, 347, 414, 481]

var step = false;

var pos_code
var pos_x
var pos_y

func _ready():
	centerCell()
	pos_code = ind_x_y()
	pos_x = position.x
	pos_y = position.y
	
func _process(delta):
	if Input.is_action_pressed("click") and onThis():
		self.position = get_global_mouse_position() - center_position		
		step = true
	elif step:
		centerCell()
		valid(ind_x_y())
	
func centerCell():
	var min_x = abs(position.x - cells_x[0])
	var t_x = cells_x[0]
	for i in cells_x:
		var t = abs(position.x - i)
		if t < min_x:
			min_x = t
			t_x = i
	position.x = t_x
	var min_y = abs(position.y - cells_y[0])
	var t_y = cells_y[0]
	for i in cells_y:
		var t = abs(position.y - i)
		if t < min_y:
			min_y = t
			t_y = i
	position.y = t_y
	step = false
	
func onThis():
	var mouse = get_global_mouse_position()
	var on_this_cell = mouse.x > position.x and mouse.y > position.y
	var on_this = mouse.x - position.x <= 75 and mouse.y - position.y <= 75 and on_this_cell
	return on_this and on_this_cell
		
func ind_x_y():
	var x
	var y
	for i in range(len(cells_x)):
		if position.x == cells_x[i]:
			x = i
	for i in range(len(cells_y)):
		if position.y == cells_y[i]:
			y = i
	return Vector2(x, y)

func valid(new_poss):
	var rook = (new_poss.x == pos_code.x) or new_poss.y == pos_code.y
	var bishop = abs(new_poss.x - pos_code.x) == abs(new_poss.y - pos_code.y)
	if  bishop or rook:
		position.x = cells_x[new_poss.x]
		position.y = cells_y[new_poss.y]
	else:
		position.x = cells_x[pos_code.x]
		position.y = cells_y[pos_code.y]
	pos_code = ind_x_y()
