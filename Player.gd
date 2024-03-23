extends RigidBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0
var speed := 1200.0
var interact_range := 1000.0

@onready var twist_pivot := $TwistPivot
@onready var pitch_pivot := $TwistPivot/PitchPivot

# La fonction est appelée une fois quand l'objet est initialisé
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func handle_movement(delta):
	var input := Vector3.ZERO # On initialize le vecteur de mouvement a 0

	input.x = Input.get_axis("move_left", "move_right") # On écoute quels actions sont pressées et on les mets sur un axe
	input.z = Input.get_axis("move_forward", "move_backwards")
	if Input.get_action_strength("move_sprint"):
		speed = 2000.0
	else:
		speed = 1200.0
	apply_central_force(twist_pivot.basis * input * speed * delta) # On applique le vecteur sur le RigidBody du joueur
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED else Input.MOUSE_MODE_CAPTURED)
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x, -1, 0.7)
	twist_input = 0.0
	pitch_input = 0.0

# La fonction est appelée toute les frames. Delta c'est le temps entre chaque frame
func _process(delta):
	handle_movement(delta)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = -event.relative.x * mouse_sensitivity
			pitch_input = -event.relative.y * mouse_sensitivity
