extends Area2D

const ship_laser = preload("res://scenes/laserShip.tscn")
const explotion = preload("res://scenes/explosion.tscn")
const scn_flash = preload("res://scenes/flash.tscn")
signal armor_changed;
var armor = 4 setget setArmor
var is_double_shooting = false setget set_double_shooting
func _ready():
	set_process(true)
	add_to_group("ship")
	yield(utils.create_timer(0.5),"timeout")
	shoot()
	pass

func _process(delta):
	var motion = (get_global_mouse_pos().x -get_pos().x)*0.2
	translate(Vector2(motion,0))
	
	#clamping the view 
	var view_size = get_viewport_rect().size
	var pos = get_pos()
	pos.x = clamp(pos.x,0+16,view_size.width - 16)
	set_pos(pos)
	pass 
	
func shoot():
	while true:
		var posLeft = get_node("cannon/left").get_global_pos()
		var posRight = get_node("cannon/right").get_global_pos()
		
		createLaser(posLeft)
		createLaser(posRight)
		
		if is_double_shooting:
			var leftLaser = createLaser(posLeft)
			var rightLaser = createLaser(posRight)
			leftLaser.velocity.x=-25
			rightLaser.velocity.x=25
			
		
		yield(utils.create_timer(0.25),"timeout")
	pass
	
func setArmor(newValue):
	if newValue>4:return
	
	if newValue < armor:
		audio_player.play("hit_ship")
		utils.main_node.add_child(scn_flash.instance()) 
	armor = newValue
	emit_signal("armor_changed",armor)
	if armor<=0 : 
		makeExplotion()
		queue_free()
	pass
func set_double_shooting(newValue):
	is_double_shooting =newValue
	if is_double_shooting:
		yield(utils.create_timer(5),"timeout")
		is_double_shooting=false
		
	pass	
	
func makeExplotion():
	var tempExplotion = explotion.instance();
	tempExplotion.set_pos(get_pos())
	utils.main_node.add_child(tempExplotion)
	pass
	
func createLaser(pos):
	var laser = ship_laser.instance()
	laser.set_pos(pos)
	utils.main_node.add_child(laser)
	return laser
	