extends CharacterBody2D

var Player = get_node_or_null("/root/Game/Player")
@onready var SM = $StateMachine
var positions = [Vector2(654,508), Vector2(550,508)]

func ready():
	#var tween = create_tween()
	#tween.tween_property(self, "position", Vector2(550,508), 1)
	$Boar.animation = "Moving"
	#move()
	
func _physics_process(delta):
	var tween = create_tween()
	if name == "L2Boar":
		if position.x == 654:
			tween.tween_property(self, "position", Vector2(550,508), 1)
			$Boar.flip_h = false
		if position.x == 550:
			tween.tween_property(self, "position", Vector2(654,508), 1)
			$Boar.flip_h = true
	if name == "L3Boar":
		if position.x == 880:
			tween.tween_property(self, "position", Vector2(780,585), 1)
			$Boar.flip_h = false
		if position.x == 780:
			tween.tween_property(self, "position", Vector2(880,585), 1)
			$Boar.flip_h = true
	


func _on_above_body_entered(body):
	if body.name == "Player":
	#SM.set_state("Dying")
	#$Boar.animation = "Dying"
		Global.add_points()
		queue_free()


func _on_body_body_entered(body):
	if body.name == "Player":
		body.die()
		$Boar.animation = "Attacking"
		SM.set_state("Attack")
		
func move():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(550,508), 1)
	
		
		

		


func _on_boar_animation_finished():
	if SM.state_name == "Attack":
		$Boar.animation = "Moving"
		SM.set_state("Move")
	if SM.state_name == "Move":
		$Boar.animation = "Moving"
	if SM.state_name == "Dying":
		queue_free()
	
