extends Node3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$FPSPlayer.position = $StartPosition.position
	
func _process(delta):
	if $startTimer.time_left == 0:
		var tween = get_tree().create_tween()
		tween.tween_property($boat, "position", Vector3(52.27,-5.809,0), 100)
	#tween.tween_property($StartPosition, "position", Vector3(53.331,9.488,3.536),20)

	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
