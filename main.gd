extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_query_done():
	$Player/TwistPivot/PitchPivot/Camera3D/LoadingTexture.visible = false
	var glass_scene = load("res://glass.tscn")
	var glass = glass_scene.instantiate()
	add_child(glass)
	glass.position.y =  glass.position.y + 5
