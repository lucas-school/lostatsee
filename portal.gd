extends Area3D

@export var destination : PackedScene

var portal_scale_change 

func _process(delta):
	portal_scale_change = abs(.5 * sin($Timer.time_left)) + 1
	$OmniLight3D.light_energy = abs(45 * sin($Timer.time_left)) + 10
	$MeshInstance3D.scale = Vector3(portal_scale_change,portal_scale_change,portal_scale_change)

func _on_body_entered(body):
	if body.name == "FPSPlayer":
		print(destination)
		get_tree().change_scene_to_packed(destination)

