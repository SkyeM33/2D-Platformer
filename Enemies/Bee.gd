extends CharacterBody2D

var player = null
@onready var ray = $See
@export var speed = 50
@export var looking_speed = 100
var nav_ready = false
var initial_position = Vector2.ZERO
@onready var SM = $StateMachine

var mode = ""


var points = []
const margin = 1.5

func _ready():
	$AnimatedSprite2D.play("Moving")
	call_deferred("nav_setup")
	initial_position = global_position

func nav_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	$NavigationAgent2D.target_position = global_position
	nav_ready = true
	
func _physics_process(_delta):
	player = get_node_or_null("/root/Game/Player")
	var s = looking_speed
	var points = initial_position
	if player != null and nav_ready:
		$NavigationAgent2D.target_position = player.global_position
		points = $NavigationAgent2D.get_next_path_position()
		$See.target_position = to_local(player.global_position)
		var c = $See.get_collider()
		if c == player:
			s = speed
	if points != Vector2.ZERO:
		var distance = points - global_position
		var direction = distance.normalized()
		$AnimatedSprite2D.flip_h = direction.x < 0
		if distance.length() > margin:
			velocity = direction*s
		else:
			velocity = Vector2.ZERO
		move_and_slide()


func _on_attack_body_entered(body):
	if body.name == "Player":
		body.die()
		$AnimatedSprite2D.play("Attacking")
		$AnimatedSprite2D.play("Idle")
		var bee_sound = get_node_or_null("/root/Game/BeeSound")
		bee_sound.play()


func _on_above_and_below_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "Dying"
		#$AnimatedSprite2D.velocity = Vector2.ZERO
		$Attack.collision_layer = 0
		$Attack.collision_mask = 0
		SM.set_state("Die")
		Global.add_points()
		

		
func set_animation(anim):
	if $AnimatedSprite2D.animation == anim: return
	if $AnimatedSprite2D.sprite_frames.has_animation(anim): $AnimatedSprite2D.play(anim)
	else: $AnimatedSprite2D.play()
	
func should_attack():
	#if $Attack.is_colliding() and $Attack.get_collider().name == "Player":
	#	return true
	#return false
	pass


func _on_animated_sprite_2d_animation_finished():
	if SM.state_name == "Die":
		queue_free()
