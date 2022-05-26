extends KinematicBody2D

var velocitat_base = 250
var direccio = Vector2.DOWN
var velocitat = Vector2.ZERO
var gravetat= Vector2.DOWN * 980
var velocitat_salt = -600
var escala = false
 
func _physics_process(delta):
	if not escala:
		velocitat += gravetat * delta
	else:
		velocitat.y = 0
	if Input.is_action_pressed("ui_up"):
		if escala:
			velocitat.y = -100
	if Input.is_action_pressed("ui_down"):
		if escala:
			velocitat.y = 100
	
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)

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
	escala = true


func _on_Area2D_body_exited(body):
	escala = false


func _on_Mort_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap3.tscn")


func _on_Portal34_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap4.tscn")


func _on_Mort4_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap4.tscn")


func _on_Portal44_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap4.1.tscn")



func _on_Portal23_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap3.tscn")




func _on_Portal45_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap6.tscn")


func _on_Spikes_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap6.tscn")



func _on_mort_body_entered(body):
	get_tree().change_scene("res://Escenes/Tilemap6.tscn")


func _on_PortalFinal_body_entered(body):
	get_tree().change_scene("res://Final.tscn")
	
