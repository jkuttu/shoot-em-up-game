extends Area2D

export var velocity = Vector2()

const flare = preload("res://scenes/flare.tscn")
func _ready():
	set_process(true)
	create_flare()
	yield(get_node("VisibilityNotifier2D"),"exit_screen")
	queue_free()
	pass

func _process(delta):
	translate(velocity * delta)
	pass
	
func create_flare():
	var tempFlare = flare.instance()
	tempFlare.set_pos(get_pos())
	#get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1 )	
	utils.main_node.add_child(tempFlare)
	pass