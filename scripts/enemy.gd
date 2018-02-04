extends Area2D
const explotion = preload("res://scenes/explosion.tscn")

export var velocity=Vector2();
export var armor = 2 setget setArmor
func _ready():
	set_process(true)
	add_to_group("enemy")
	connect("area_enter",self,"on_area_enter")
	pass

func on_area_enter(other):
	if other.is_in_group("ship"):
		other.armor-=1
		makeExplotion()
		queue_free()
	pass
func _process(delta):
	translate(velocity*delta)
	
	if get_pos().y-16 > get_viewport_rect().size.height:
		queue_free()
	
	pass
func setArmor(newValue):
	if is_queued_for_deletion():return
	if newValue<armor:audio_player.play("hit_enemy")
	armor = newValue
	if armor <=0 : 
		makeExplotion()
		utils.find_node("score_texture").score+=5;
		queue_free()
	pass
	
func makeExplotion():
	var tempExplotion = explotion.instance();
	tempExplotion.set_pos(get_pos())
	utils.main_node.add_child(tempExplotion)
	pass
	
	
	