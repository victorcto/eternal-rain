extends Node2D

@onready var texture = $textura
@onready var area_interaction = $area_interacao

const lines : Array[String] = [
	"Está procurando seu pai, Maya? \n-Aarav",
	"Sim, Aarav!!! \n-Maya",
	"Estou super preocupada, ele saiu faz muito tempo... \n-Maya",
	"Você o viu? \n-Maya",
	"Ele passou em direção da floresta\n -Aarav",
	"Obrigada, Aarav!!! -Maya"
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
		if not DialogoManeagerMenino.is_message_active:
			print("Mostrando diálogo")
			texture.hide()
			DialogoManeagerMenino.start_message(global_position, lines)

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
		if DialogoManeagerMenino.dialog_box != null:
			DialogoManeagerMenino.dialog_box.queue_free()
			DialogoManeagerMenino.is_message_active = false
