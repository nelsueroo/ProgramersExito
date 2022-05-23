extends KinematicBody2D


var velocitat_base = 300
var velocitat = Vector2.ZERO
var cap_a_la_dreta = false

func _physics_process(delta):

	if cap_a_la_dreta == false:
		velocitat = Vector2.LEFT * velocitat_base
	elif cap_a_la_dreta == true:
		velocitat = Vector2.RIGHT * velocitat_base
	
	if position.x <= 5:
		cap_a_la_dreta = true
	if position.x >= 500:
		cap_a_la_dreta = false

	velocitat = move_and_slide(velocitat, Vector2.UP)

	anima(velocitat)

func anima(velocitat:Vector2):
	var animacio = $AnimatedSprite
	if velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')
	elif velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('camina')




