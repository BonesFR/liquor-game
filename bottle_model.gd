extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if owner.get_meta("Open") && $Sketchfab_model.visible:
		$Sketchfab_model.visible = false
		$open_bottle.visible = true
