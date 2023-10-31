extends Node

@onready var SM = get_parent()
@onready var enemy = get_node_or_null("../..")
var Player = get_node_or_null("/root/Game/Player")

func _ready():
	await enemy.ready

func start():
	#$Sprite.animation = "Moving"
	pass

func physics_process(_delta):
	#if $See.cast_to(Player) and $See.get_collider().name == "Player":
	#	SM.set_state("Attack")
	#else:
	#enemy.velocity.x = enemy.direction * enemy.walking
	#if enemy.position.x > enemy.path[1].x:
	#	enemy.velocity.x = -1*abs(enemy.walking)
	#if enemy.position.x < enemy.path[0].x:
	#	enemy.velocity.x = abs(enemy.velocity.x)
	pass
