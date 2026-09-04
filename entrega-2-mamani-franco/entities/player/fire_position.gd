extends Marker2D

@onready var fire_position:Marker2D = $FirePosition

@export var projectile_scene: PackedScene

func fire():
	
	var projectile_instance:Projectile = projectile_scene.instance()
	fire_position.add_child(projectile_instance)
