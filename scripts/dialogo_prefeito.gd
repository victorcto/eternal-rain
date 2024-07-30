extends Node2D

@onready var texture = $texture2
@onready var area_interaction = $area_interaction2

const LINES : Array[String] = [
	"Bom dia Prefeito, Você viu meu pai? \n - Maya",
	"Maya, não o vi. Você deve voltar para casa \n Está chegando uma tempestade - Prefeito",
	"Mas meu e meu pai?!\n - Maya",
	"Não se preucupe ele logo deve volta \n Vá para casa menina - Prefeito"    
]

func _unhandled_input(event):
	if area_interaction.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("Interaction") and not is_dialog_active():
			texture.hide()
			start_dialog(global_position, LINES)
	else:
		texture.hide()
		if is_dialog_active():
			end_dialog()

func is_dialog_active() -> bool:
	return DialogManager.is_message_active

func start_dialog(position: Vector2, lines: Array[String]):
	DialogManager.start_message(position, lines)

func end_dialog():
	if DialogManager.dialog_box != null:
		DialogManager.dialog_box.queue_free()
		DialogManager.is_message_active = false
