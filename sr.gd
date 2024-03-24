extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const WAIT_TIME = 5.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var marker_node = get_node("../target")
@onready var marker_position = marker_node.global_transform.origin
@onready var animation_player = $AnimationPlayer

var is_rotating = true
var is_waiting = false
var wait_timer = 0.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = (marker_position - global_transform.origin).normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	if global_transform.origin.distance_to(marker_position) < 0.5:
		if not is_waiting:
			wait_timer = WAIT_TIME
			is_waiting = true
		else:
			wait_timer -= delta
			if wait_timer <= 0.0:
				is_waiting = false
				if get_node("../target5") != null:
					marker_node = get_node("../target5")
					marker_position = marker_node.global_transform.origin
					wait_timer = 0.0
	else:
		is_waiting = false
		
	if is_rotating:
		rotation_degrees.y += -1
		if rotation_degrees.y < -80:
			is_rotating = false
			animation_player.play("hello")
	
	if not is_waiting:
		move_and_slide()
