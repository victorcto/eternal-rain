extends Area2D

@onready var texture = $warning_icon
@onready var player_camera = null  # Referência para a câmera do jogador

func _ready():
	# Encontrar a câmera do jogador (ajuste o caminho conforme necessário)
	player_camera = get_tree().current_scene.get_node("player/Camera2D2")

func _unhandled_input(event):
	if get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("Interaction"):
			texture.hide()
			var scene = preload("res://prefabs/dad_scroll.tscn").instantiate()
			get_tree().current_scene.add_child(scene)
			if player_camera:
				player_camera.enabled = false  # Desativa a câmera
		
			queue_free()
	else:
		texture.hide()
