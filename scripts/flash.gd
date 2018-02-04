extends Sprite

func _ready():
	get_node("animation").play("flareEffect")
	yield(get_node("animation"),"finished")
	queue_free()
	pass
