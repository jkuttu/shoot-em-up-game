extends "res://scripts/powerUp.gd"


func _ready():
	connect("area_enter",self,"_on_area_enter")
	
	
	pass

func _on_area_enter(other):
	if other.is_in_group("ship"):
		audio_player.play("powerup")
		other.armor+=1
		queue_free()