extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

const NEXT_LEVEL_PATH : String = "res://levels/level_3.tscn"

func _on_body_entered(body):
	if body.name == "player":
		var result = get_tree().change_scene_to_file(NEXT_LEVEL_PATH)
		if result != OK:
			print("Erro ao mudar de cena: ", result)
		else:
			print("Cena mudada com sucesso.")
	
