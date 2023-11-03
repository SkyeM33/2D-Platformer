extends Control




func _on_start_pressed():
	get_tree().change_scene_to_file("res://Levels/level_2.tscn")
	



func _on_leave_pressed():
	get_tree().quit()
