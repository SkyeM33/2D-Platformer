extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		if name == "To_2":
			get_tree().change_scene_to_file("res://Levels/level_2.tscn")
		if name == "To_3":
			get_tree().change_scene_to_file("res://Levels/level_3.tscn")
		if name == "To_4":
			get_tree().change_scene_to_file("res://UI/end.tscn")
		if name == "To_5":
			get_tree().change_scene_to_file("res://UI/end_2.tscn")
