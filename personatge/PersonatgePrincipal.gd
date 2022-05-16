extends KinematicBody2D

var velocitat_base = 100
var direccio = Vector2.DOWN
var velocitat = Vector2.ZERO
var gravetat= Vector2.DOWN * 980
var velocitat_salt = -400
var escaleras = false

 


func _physics_process(delta):
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocitat.y = velocitat_salt
	if Input.is_action_pressed("ui_up"):
		if escaleras:
			velocitat.y = -100
	if Input.is_action_pressed("ui_down"):
		if escaleras:
			velocitat.y = 100
			
	anima(velocitat)
	velocitat = move_and_slide(velocitat, Vector2.UP)

func anima(velocitat):
	if velocitat.x > 0:
		$AnimatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite.play("corre")
	elif velocitat.x < 0:
		$AnimatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite.play("corre")
		

	if abs(velocitat.x) < 0.1 and is_on_floor():
		$AnimatedSprite.play("quiet")

	if velocitat.y < 0:
		$AnimatedSprite.play("salta")
	



func _on_MortTerra_body_entered(body):
	get_tree().change_scene("res://Escenes/Nivell1.tscn")


func _on_Area2D_body_entered(body):
	escaleras = true


func _on_Area2D_body_exited(body):
	escaleras = false


func _on_CollisionShape2D2_tree_entered():
	get_tree().change_scene("res://Escenes/TileMap.tscn")
