extends Node

var death_zone = 1000

var points = 0

func _ready():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func add_points():
	points += 1
	var Points = get_node_or_null("/root/Game/UI/HUD/Points")
	if Points != null:
		Points.text = "Points: " + str(points)
	
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
