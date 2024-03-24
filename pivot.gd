extends Node3D

func _ready():
	pass

func _process(delta):
	var nodeHeight = transform.origin.y
	var targetPosition = transform.origin - Vector3(0, nodeHeight, 0)
	look_at(targetPosition, Vector3.UP)
