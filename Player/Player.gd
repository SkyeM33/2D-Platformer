extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite.animation = "Fall"
	elif abs(velocity.x) > 0:
		$Sprite.play("Walk")
	else:
		$Sprite.animation = "Idle"

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		$Sprite.play("Jump")
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$Sprite.flip_h = true
		else:
	
			$Sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if position.y >= 650:
		position.y = -55
		position.x = 1
	
	if Input.is_action_just_pressed("Dash") and $Sprite.flip_h == false:
		var tween = create_tween()
		tween.tween_property(self, "position", Vector2(position.x + 100, position.y), 0.1)
		
		
		

	move_and_slide()
	
func die():
	position.y = -55
	position.x = 1
		


func _on_area_2d_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
