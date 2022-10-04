extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()


func _physics_process(delta):
	
	motion.y += 20
	
	# if Input.is_key_pressed(KEY_T):
		# $Sprite.play("talk")
	# elif Input.is_key_pressed(KEY_K):
		# $Sprite.play("kick")	
	# elif Input.is_key_pressed(KEY_P):
		# $Sprite.play("think")
	# elif Input.is_key_pressed(KEY_C):
		# $Sprite.play("cheer")	
	if Input.is_key_pressed(KEY_A):
		$Sprite.play("atack")
	elif Input.is_action_pressed("ui_right"):
		if Input.is_key_pressed(KEY_S):
			motion.x = 200
			$Sprite.play("run")
			$Sprite.flip_h = false
		else:
			motion.x = 100
			$Sprite.play("walk")
			$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		if Input.is_key_pressed(KEY_S):
			motion.x = -400
			$Sprite.play("run")
			$Sprite.flip_h = true
		else:
			motion.x = -200
			$Sprite.play("walk")
			$Sprite.flip_h = true
	else:
		motion.x = 0	
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -1000
	else:
		$Sprite.play("jump")
	
	if motion.y >= 1500:
		get_tree().quit()
		
	motion = move_and_slide(motion, UP)


