extends CharacterBody3D

@export var speed = 2
@export var max_speed = 5
@export var jump_speed = 15
@export var mouse_sensitivity = 0.006
@export var acc_const = 0.94

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		#$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		#$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -1.2, 1.2)

func get_move_input():
	var input = Input.get_vector("left", "right", "forward", "back").normalized()
	var dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x += dir.x * speed 
	velocity.z += dir.z * speed
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.z = clamp(velocity.z, -max_speed, max_speed)
	velocity *= acc_const
	
func _physics_process(delta):
	velocity.y += -gravity * delta
	get_move_input()
	
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
