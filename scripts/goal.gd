extends Area2D

@export var next_level : String = ""

func _on_body_entered(body):
	if body.name == "player" and !next_level == "":
		assert(get_tree().change_scene_to_file(next_level) == OK)
