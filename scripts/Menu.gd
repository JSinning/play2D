extends Control




func _on_start_pressed():
	get_tree().call_deferred("change_scene","res://scene/level1.tscn")



func _on_Exit_pressed():
	get_tree().quit()
