extends Node2D

var step = false

var figures = [get_node("Wrook"), get_node("Wknight"), get_node("Wbishop"), get_node("Wking"),
get_node("Wqueen"), get_node("Wbishop2"), get_node("Wknight"), get_node("Wrook2"),]

var pos = [
 ['Wrook1','Wknight1','Wbishop1','Wking','Wqueen','Wbishop2','Wknight2','Wrook2'],
 ['Wp1','Wp2','Wp3','Wp4','Wp5','Wp6','Wp7','Wp8'],
 ['','','','','','','',''], 
 ['','','','','','','',''],
 ['','','','','','','',''], 
 ['','','','','','','',''],
 ['Bp1','Bp2','Bp3','Bp4','Bp5','Bp6','Bp7','Bp8'], 
 ['Brook1','Bknight1','Bbishop1','Bking','Bqueen','Bbishop2','Bknight2','Brook2']]

var Wking
var queue = true # true - step white, false - black

func _ready():
	Wking = get_node('Wking')
	pos[Wking.pos_code.x][Wking.pos_code.y] = 'Wking'
	
	print(figures)
	pass 

func _process(delta):
	if Input.is_action_pressed("click"):
		step = true
	elif step:
		step = false
		
