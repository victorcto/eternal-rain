extends SubViewportContainer

@onready var letter_camera = get_tree().current_scene.get_node("SubViewportContainer/Camera2D")
@onready var closing = $dad_scroll/AnimationPlayer
@onready var player_camera = get_tree().current_scene.get_node("player/Camera2D2")  # Ajuste o caminho conforme necessário


func _unhandled_input(event):
	if event.is_action_pressed("Interaction"):
		closing.play("closing")
		player_camera.enabled = true
		letter_camera.enabled = false
		queue_free()

