extends CharacterBody2D

var player_path = ""
@onready var raycast = $RayCast2D
@onready var sprite = $Sprite2D
@onready var animations = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.flip_h = true
	animations.play("wait")

func _process(delta):
	position = position

func _physics_process(delta):
	velocity.y += delta * 450
	if(raycast.is_colliding()):
		velocity.x = -45 * 1.7 #constantes para que ele ande para o lado
		animations.play("dash")
	else:
		velocity.x = 0
		animations.play("wait")
	move_and_slide()

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "dash"):
		get_tree().change_scene_to_file("res://prefabs/entity_jumpscare.tscn")
