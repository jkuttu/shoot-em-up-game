extends Node

const spawnerPowerUps = [ 
	preload("res://scenes/powerUp_armor.tscn"),
	preload("res://scenes/powerup_laser.tscn")
	]

func _ready():
	yield(waitForSeconds(rand_range(10,15)),"timeout")
	spawner()
	pass 

func spawner():
	while true:
		
		randomize()
		var powerBox = utils.choose(spawnerPowerUps).instance()
		var pos = Vector2()
		pos.x = rand_range(0+7,get_viewport().get_visible_rect().size.width-7)
		pos.y = 0-7
		powerBox.set_pos(pos)
		get_node("container").add_child(powerBox)
		yield(waitForSeconds(rand_range(10,15)),"timeout")
	pass
	

func waitForSeconds(time):
	var timer = Timer.new()
	timer.set_wait_time(time)
	timer.set_one_shot(true)
	timer.connect("timeout",timer,"queue_free")
	add_child(timer)
	timer.start()
	return timer
	pass
	
	