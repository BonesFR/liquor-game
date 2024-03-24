extends Area3D

var spilling = false
var glass = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if glass != null && $"../../..".get_meta("quantity") > 0.0 && $"../../..".get_meta("Spilling"):
		glass.set_meta("Filling", true)
		glass.set_meta("FillingType", $"../../..".get_meta("Type"))
	else: if glass != null:
		glass.set_meta("Filling", false)
		glass.set_meta("FillingType", "")

func _on_body_entered(body):
	if body.is_in_group("Glass"):
		glass = body

func _on_body_exited(body):
	if body.is_in_group("Glass"):
		body.set_meta("Filling", false)
		glass.set_meta("FillingType", "")
		glass = null
