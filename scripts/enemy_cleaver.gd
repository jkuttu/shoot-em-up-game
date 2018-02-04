extends "res://scripts/enemy.gd"
const scene_laser = preload("res://scenes/laserEnemy.tscn")

func _ready():
	velocity.x = utils.choose([velocity.x,-velocity.x])
	shoot()
	pass
	
func _process(delta):
	if get_pos().x<= 0+16:
		velocity.x = abs(velocity.x)
	if get_pos().x >= get_viewport_rect().size.width -16:
		velocity.x = -abs(velocity.x)
	pass

func shoot():
	while true:
		var laser = scene_laser.instance()
		laser.set_pos(get_node("cannon").get_global_pos())
		utils.main_node.add_child(laser)
		yield(utils.create_timer(1.5),"timeout")
	
	pass 