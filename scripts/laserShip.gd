extends "res://scripts/laser.gd"

func _ready():
	connect("area_enter",self,"OnAreaEnter")
	audio_player.play("laser_ship")
	pass
func OnAreaEnter(other):
	if other.is_in_group("enemy"):
		other.armor -=1
		create_flare()
		utils.remote_call("camera","shake",1,0.13)
		queue_free()
	pass