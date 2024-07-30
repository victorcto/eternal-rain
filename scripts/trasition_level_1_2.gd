extends Area2D

# Defina diretamente o caminho da próxima cena.
const NEXT_LEVEL_PATH : String = "res://levels/level_2.tscn"

# Função chamada quando um corpo entra na área.
func _on_body_entered(body):
	print("Corpo entrou na área: ", body.name)  # Mensagem de depuração
	if body.name == "player":
		print("Jogador detectado. Mudando de cena...")  # Mensagem de depuração
		var result = get_tree().change_scene_to_file(NEXT_LEVEL_PATH)
		if result != OK:
			print("Erro ao mudar de cena: ", result)
		else:
			print("Cena mudada com sucesso.")
