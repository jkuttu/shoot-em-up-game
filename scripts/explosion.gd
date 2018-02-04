extends Sprite

func _ready():
	randomize()
	set_rot(deg2rad(rand_range(0,360)))
	get_node("smoke").set_emitting(true)
	get_node("flare").set_emitting(true)
	audio_player.play("explosion")
	utils.remote_call("camera","shake",8,0.2)
	
	get_node("animation").play("flareEffect")
	
	yield(get_node("animation"),"finished")
	
	queue_free()
	
	pass
