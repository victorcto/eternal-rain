extends Area2D

@onready var mensagem = $mensage  # Referência para o nó da label
@onready var area_interaction = $Placa

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Corpo entrou na área: ", body.name)  # Mensagem de depuração
	if body.name == "player":
		print("Jogador detectado. Mostrando mensagem...")  # Mensagem de depuração
		mensagem.show()
	else:
		mensagem.hide()


func _on_body_exited(body):
	if body.name == "player":
		print("Jogador saiu da área. Escondendo mensagem...")  # Mensagem de depuração
		mensagem.hide()
