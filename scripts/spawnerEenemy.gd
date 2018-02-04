extends Node

const enemies = [ 
	preload("res://scenes/enemyKamikaze.tscn"),
	preload("res://scenes/enemy_cleaver.tscn")
	]

func _ready():
	yield(utils.create_timer(1.2),"timeout")
	spawner()
	pass

func spawner():
	while true:
		
		randomize()
		var enemy = utils.choose(enemies).instance()
		var pos = Vector2()
		pos.x = rand_range(0+16,get_viewport().get_visible_rect().size.width-16)
		pos.y = 0-16
		enemy.set_pos(pos)
		get_node("container").add_child(enemy)
		yield(waitForSeconds(rand_range(0.5,1.25)),"timeout")
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
	
	