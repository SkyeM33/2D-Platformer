extends Control


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Levels/level_2.tscn")
	#take points away here too
	



func _on_end_pressed():
	get_tree().quit()
