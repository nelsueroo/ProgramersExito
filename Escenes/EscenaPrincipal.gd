extends Control



func _on_Jugar_pressed():
	get_tree().change_scene("res://Escenes/TileMap.tscn")
	

func _on_Sortir_pressed():
	get_tree().quit()


