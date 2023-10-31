extends CharacterBody2D

var Player = get_node_or_null("/root/Game/Player")

func ready():
	$Boar.animation = "Idle"


func _on_above_body_entered(body):
	queue_free()


func _on_body_body_entered(body):
	if body.name != "Boar 3":
		body.die()
		$Boar.animation = "Attacking"
		
		
