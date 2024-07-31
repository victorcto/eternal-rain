extends Node2D

@onready var texture = $textura
@onready var area_interaction = $area_interacao

const lines : Array[String] = [
	"Bom dia, prefeito\n - Maya", 
	"você viu meu pai? \n- Maya",
	"Não o vi, Maya, mas você deveria voltar para casa \n- Prefeito",
	"Está chegando uma tempestade \n- Prefeito",
	"Mas e meu pai?!\n- Maya",
	"Não se preocupe, ele logo deve voltar \n- Prefeito",
	"Vá para casa, Maya \n- Prefeito"
]

var player_in_area = false

func _ready():
	# Desconectar sinais antigos se já conectados
	area_interaction.disconnect("body_entered",  Callable(self, "_on_area_interacao_body_entered"))
	area_interaction.disconnect("body_exited", Callable(self, "_on_area_interacao_body_exited"))

	# Conectar sinais corretamente
	area_interaction.connect("body_entered", Callable(self, "_on_area_interacao_body_entered"))
	area_interaction.connect("body_exited", Callable(self, "_on_area_interacao_body_exited"))

func _process(delta):
	if player_in_area and Input.is_action_pressed("Interaction"):
		print("Jogador interagiu.")
		if not DialogoManeagerPrefeito.is_message_active:
			print("Mostrando diálogo")
			texture.hide()
			DialogoManeagerPrefeito.start_message(global_position, lines)

func _on_area_interacao_body_entered(body):
	print("Corpo entrou na área: ", body.name)  # Mensagem de depuração
	if body.name == "player":
		print("Jogador detectado. Mostrando exclamação")  # Mensagem de depuração
		texture.show()
		player_in_area = true

func _on_area_interacao_body_exited(body):
	if body.name == "player":
		texture.hide()
		player_in_area = false
		if DialogoManeagerPrefeito.dialog_box != null:
			DialogoManeagerPrefeito.dialog_box.queue_free()
			DialogoManeagerPrefeito.is_message_active = false
