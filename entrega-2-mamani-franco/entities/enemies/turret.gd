extends Sprite2D

@export var projectile_scene: PackedScene
var projectile_containter:Node
var player
@onready var fire_position:Marker2D = $FirePosition

func set_values(player1, projectile_container):
	self.player = player1
	self.projectile_containter = projectile_container
	$Timer.start()

func _on_timer_timeout() -> void:
	fire()

func fire():
	var projectile:Projectile = projectile_scene.instantiate()
	projectile_containter.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	projectile.delete_request.connect(_on_projectile_delete_requested)

func _on_projectile_delete_requested(projectile):
	projectile_containter.remove_child(projectile)
	projectile.queue_free()
