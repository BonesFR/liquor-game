extends RigidBody3D

var raycast

func _ready():
	self.set_meta("Type", Global.DrinkList.keys()[randi() % 5])
	self.set_meta("Open", false)
	$Bottle/Node3D/Area3D/Guide.visible = false
	$GPUParticles3D.emitting = false

func _process(delta):
	if self.get_meta("Open"):
		if self.rotation.x >= deg_to_rad(60) || self.rotation.x <= deg_to_rad(-60) || self.rotation.z >= deg_to_rad(60) || self.rotation.z <= deg_to_rad(-60):
			if (self.get_meta("quantity") > 0.0):
				self.set_meta("Spilling", true)
				self.set_meta("quantity", self.get_meta("quantity") - 0.001)
			else:
				self.set_meta("Spilling", false)
		else:
			self.set_meta("Spilling", false)
		if self.get_meta("Spilling") && $GPUParticles3D.emitting == false:
			$Bottle/Node3D/Area3D/Guide.visible = true
			$GPUParticles3D.emitting = true
		else: if !self.get_meta("Spilling") && $GPUParticles3D.emitting == true:
			$Bottle/Node3D/Area3D/Guide.visible = false
			$GPUParticles3D.emitting = false
