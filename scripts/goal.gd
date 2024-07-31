extends Area2D

@export var next_level : String = ""

func _on_body_entered(body):
	assert(get_tree().change_scene_to_file("res://levels/level_1.tscn") == OK)
