extends Area2D


func _on_Moneda_body_entered(body):
	queue_free()
