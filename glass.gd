extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_meta("Type", Global.DrinkList.keys()[randi() % 5])
	$AngryTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_meta("Quantity") >= 0.20:
		self.set_meta("Filling", false)
		$GPUParticles3D.emitting = true
		$glass.visible = false
		$Glug.playing = false
		$Caching.playing = true
		if $Timer.is_stopped():
			Global.Money = Global.Money + Global.DrinkList[self.get_meta("Type")]
			$Timer.start()
	if self.get_meta("Filling") && self.get_meta("Type") == self.get_meta("FillingType"):
		self.set_meta("Quantity", self.get_meta("Quantity") + 0.001)
		if !$Glug.playing:
			$Glug.playing = true
	else:
		$Glug.playing = false

func _on_timer_timeout():
	self.queue_free()


func _on_angry_timer_timeout():
	self.queue_free()
