extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") && visible:
		visible = false


func _on_interact_ray_open_computer():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	visible = true;
	print(Global.DrinkList)
	$Button.text = Global.DrinkList.keys()[0]
	$"Button/Label".text = str(Global.DrinkList[Global.DrinkList.keys()[0]] * 0.75)
	$Button2.text = Global.DrinkList.keys()[1]
	$"Button2/Label".text = str(Global.DrinkList[Global.DrinkList.keys()[1]] * 0.75)
	$Button3.text = Global.DrinkList.keys()[2]
	$"Button3/Label".text = str(Global.DrinkList[Global.DrinkList.keys()[2]] * 0.75)
	$Button4.text = Global.DrinkList.keys()[3]
	$"Button4/Label".text = str(Global.DrinkList[Global.DrinkList.keys()[3]] * 0.75)
	$Button5.text = Global.DrinkList.keys()[4]
	$"Button5/Label".text = str(Global.DrinkList[Global.DrinkList.keys()[4]] * 0.75)


func _on_button_pressed():
	if Global.Money - Global.DrinkList[Global.DrinkList.keys()[0]] * 0.75 >= 0.0:
		Global.Money = Global.Money - Global.DrinkList[Global.DrinkList.keys()[0]] * 0.75
		var bottle_scene = load("res://bottle.tscn")
		var bottle = bottle_scene.instantiate()
		add_child(bottle)
		bottle.set_meta("Type", Global.DrinkList.keys()[0])
		bottle.position.y =  owner.position.y + 1
		bottle.position.x =  owner.position.x + 1


func _on_button_2_pressed():
	if Global.Money - Global.DrinkList[Global.DrinkList.keys()[1]] * 0.75 >= 0.0:
		Global.Money = Global.Money - Global.DrinkList[Global.DrinkList.keys()[1]] * 0.75
		var bottle_scene = load("res://bottle.tscn")
		var bottle = bottle_scene.instantiate()
		add_child(bottle)
		bottle.set_meta("Type", Global.DrinkList.keys()[1])
		bottle.position.y =  owner.position.y + 1
		bottle.position.x =  owner.position.x + 1


func _on_button_3_pressed():
	if Global.Money - Global.DrinkList[Global.DrinkList.keys()[2]] * 0.75 >= 0.0:
		Global.Money = Global.Money - Global.DrinkList[Global.DrinkList.keys()[2]] * 0.75
		var bottle_scene = load("res://bottle.tscn")
		var bottle = bottle_scene.instantiate()
		add_child(bottle)
		bottle.set_meta("Type", Global.DrinkList.keys()[2])
		bottle.position.y =  owner.position.y + 1
		bottle.position.x =  owner.position.x + 1


func _on_button_4_pressed():
	if Global.Money - Global.DrinkList[Global.DrinkList.keys()[3]] * 0.75 >= 0.0:
		Global.Money = Global.Money - Global.DrinkList[Global.DrinkList.keys()[3]] * 0.75
		var bottle_scene = load("res://bottle.tscn")
		var bottle = bottle_scene.instantiate()
		add_child(bottle)
		bottle.set_meta("Type", Global.DrinkList.keys()[3])
		bottle.position.y =  owner.position.y + 1
		bottle.position.x =  owner.position.x + 1


func _on_button_5_pressed():
	if Global.Money - Global.DrinkList[Global.DrinkList.keys()[4]] * 0.75 >= 0.0:
		Global.Money = Global.Money - Global.DrinkList[Global.DrinkList.keys()[4]] * 0.75
		var bottle_scene = load("res://bottle.tscn")
		var bottle = bottle_scene.instantiate()
		add_child(bottle)
		bottle.set_meta("Type", Global.DrinkList.keys()[4])
		bottle.position.y =  owner.position.y + 1
		bottle.position.x =  owner.position.x + 1
