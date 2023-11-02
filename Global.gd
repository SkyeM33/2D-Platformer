extends Node

var death_zone = 1000

var points = 0

func add_points():
	points += 1
	
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		var menu = get_node_or_null("/root/Game/UI/Menu")
		if menu == null:
			get_tree().quit()
		else:
			if menu.visible:
				menu.hide()
			else:
				menu.show()
