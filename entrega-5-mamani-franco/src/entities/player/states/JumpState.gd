extends PlayerState

func enter() -> void:
	character.velocity.y -= character.jump_speed
	character._play_animation("jump")

func exit() -> void:
	pass

func handle_input(event: InputEvent) -> void:
	pass

func update(delta: float) -> void:
	character._handle_weapon_actions()
	character._handle_move_input(delta)
	if character.h_movement_direction == 0:
		character._handle_deacceleration(delta)
	character._apply_movement(delta)
	if character.is_on_floor_raycasted():
		if character.h_movement_direction == 0:
			emit_signal("finished", "idle")
		else:
			emit_signal("finished", "walk")
	else:
		if character.velocity.y > 0:
			character._play_animation("fall")
		else:
			character._play_animation("jump")
	

func _on_animation_finished(anim_name: StringName) -> void:
	pass

func handle_event(event: StringName, value = null) -> void:
	match event:
		"hit":
			character._handle_hit(value)
			if character.dead:
				finished.emit("dead")
