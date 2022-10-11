extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()


func _physics_process(delta):
	
	motion.y += 20

	if Input.is_key_pressed(KEY_J):
		$Sprite.play("atack1")
	# elif Input.is_key_pressed(KEY_K):
		# $Sprite.play("atack2")
	# elif Input.is_key_pressed(KEY_L):
		# $Sprite.play("atack3")
	elif Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		if Input.is_key_pressed(KEY_SHIFT):
			motion.x = 500
			$Sprite.play("run")
			$Sprite.flip_h = false
		else:
			motion.x = 250
			$Sprite.play("walk")
			$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		if Input.is_key_pressed(KEY_SHIFT):
			motion.x = -500
			$Sprite.play("run")
			$Sprite.flip_h = true
		else:
			motion.x = -250
			$Sprite.play("walk")
			$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle")
		
	if !is_on_floor():
		$Sprite.play("jump")
	else:
		if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_SPACE) or Input.is_key_pressed(KEY_W):
			motion.y = -600
	
	if motion.y >= 1500:
		get_tree().quit()
		
	motion = move_and_slide(motion, UP)
