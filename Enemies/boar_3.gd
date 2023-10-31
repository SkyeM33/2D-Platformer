extends CharacterBody2D

var Player = get_node_or_null("/root/Game/Player")
@onready var SM = $StateMachine

func ready():
	$Boar.animation = "Idle"


func _on_above_body_entered(body):
	SM.set_state("Dying")
	$Boar.animation = "Dying"


func _on_body_body_entered(body):
	if body.name != "Boar 3":
		body.die()
		$Boar.animation = "Attacking"
		SM.set_state("Attack")
		

		
		

		


func _on_boar_animation_finished():
	if SM.state_name == "Attack":
		$Boar.animation = "Idle"
		SM.set_state("Move")
	if SM.state_name == "Move":
		$Boar.animation = "Idle"
	if SM.state_name == "Dying":
		queue_free()
	
