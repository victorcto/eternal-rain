extends Node2D

@onready var texture = $texture
@onready var area_interaction = $area_interaction

const lines : Array[String] = [
	"Bom dia Maya, o que vai querer hoje? \n- Ravi",
	"Olá, Sr. Ravi. Não encontro meu pai\n - Maya",
	"O senhor o viu? \n- Maya",
	"Desculpa, não o vi... \n- Ravi"
]

func _unhandled_input(event):
	if area_interaction.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("Interaction") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(global_position, lines)
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
