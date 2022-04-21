extends Control



func _on_Jugar_pressed():
	get_tree().change_scene("res://1nivell.tscn")


func _on_Sortir_pressed():
	get_tree().quit()
