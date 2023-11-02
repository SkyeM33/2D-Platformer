extends Control




func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Levels/level_2.tscn")
	#reset points when you figure out why it won't acknowledge them
	



func _on_leave_pressed():
	get_tree().quit()
	



func _on_bees_pressed():
	get_tree().change_scene_to_file("res://Levels/level_4.tscn")
