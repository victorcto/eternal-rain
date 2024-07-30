extends Area2D

@export_node_path("CharacterBody2D") var player_path
@export_node_path("Marker2D") var point
@export_node_path("AudioStreamPlayer") var scream 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body == get_node(player_path)):
		var enemy = preload("res://actors/female_enemy.tscn").instantiate()
		get_parent().call_deferred("add_child", enemy)
		enemy.player_path = player_path
		enemy.global_position = get_node(point).global_position
		get_node(scream).play()
		queue_free()
