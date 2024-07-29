extends Area2D

@onready var texture = $warning_icon
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	pass # Replace with function body.


func _on_body_exited(body):
	pass # Replace with function body.

func _unhandled_input(event):
	if get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("Interaction"):
			texture.hide()
			var scene = preload("res://prefabs/dad_scroll.tscn").instantiate()
			get_tree().current_scene.add_child(scene)
			queue_free()
	else:
		texture.hide()
		
