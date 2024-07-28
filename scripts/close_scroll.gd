extends SubViewportContainer

@onready var closing = $dad_scroll/AnimationPlayer

func _unhandled_input(event):
	if event.is_action_pressed("Interaction"):
		closing.play("closing")
		
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
