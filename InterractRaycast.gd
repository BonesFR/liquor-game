extends RayCast3D

var held_obj = null
var last = Vector3.ZERO
var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0
signal OpenComputer

func _ready():
	add_exception(owner)

func _process(delta):
	if is_colliding() && (get_collider().is_in_group("Bottle") || get_collider().is_in_group("Glass")):
		$"../DrinkName".text = get_collider().get_meta("Type")
	else:
		$"../DrinkName".text = ""
	if is_colliding() && get_collider().is_in_group("Computer") && Input.is_action_pressed("Use"):
		OpenComputer.emit()
	if Input.is_action_pressed("interact"):
		var collider = get_collider()
		if collider != null:
			if collider.is_in_group("Holdable"):
				held_obj = collider
		if held_obj != null:
			last = held_obj.global_position
			held_obj.position = $"../Hold".global_position
			if held_obj.is_class("RigidBody3D"):
				held_obj.linear_velocity = Vector3.ZERO
	else:
		if held_obj != null:
			if held_obj.is_class("RigidBody3D"):
				var velocity = held_obj.position - last
				held_obj.linear_velocity = velocity * 15
		held_obj = null
	if held_obj != null && Input.is_action_pressed("rotate") && held_obj.is_class("RigidBody3D"):
		held_obj.rotate_y(twist_input)
		held_obj.rotate_x(pitch_input)
	if held_obj != null && Input.is_action_pressed("Use") && held_obj.is_in_group("Bottle") && !held_obj.get_meta("Open"):
		held_obj.set_meta("Open", true)
		held_obj.get_node("AudioStreamPlayer3D").play()

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = -event.relative.x * mouse_sensitivity
			pitch_input = -event.relative.y * mouse_sensitivity
