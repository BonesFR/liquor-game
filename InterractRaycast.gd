extends RayCast3D

func _ready():
	add_exception(owner)

func _process(delta):
	if is_colliding():
		var detected = get_collider()
		print(detected.name)
		if detected is Interactable:
			print("int")
