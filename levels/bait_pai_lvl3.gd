extends Area2D

@onready var mensagem = $caixa_dialogo

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
