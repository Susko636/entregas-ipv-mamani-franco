extends Sprite2D
class_name Projectile

signal delete_request(projectile)

@export var speed_projectile:float

var direction:Vector2

func _ready():
	set_physics_process(false)

func set_starting_values(starting_position:Vector2, dir:Vector2):
	global_position = starting_position
	self.direction = dir
	$Timer.start()
	set_physics_process(true)

func _physics_process(delta: float):
	position += direction*speed_projectile*delta

func _on_timer_timeout():
	delete_request.emit(self)
