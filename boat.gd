extends Node3D

var rotz = 0 


func _ready():
	pass # Replace with function body.

func _process(delta):
	rotz = abs(.12 * sin($Timer.time_left)) - (.12/2)
	
	$pirate_ship_wo_masts_no_base.rotation = Vector3(0,0,rotz)
