extends CharacterBody2D

@export_node_path("CharacterBody2D") var player_path = null 
@onready var raycast = $RayCast2D
@onready var animations = $AnimationPlayer
@onready var sprite = $Sprite2D
var alive = true

func _physics_process(delta):
	velocity.y += delta * 450
	if(player_path and alive):
		var player = get_node(player_path)
		var direction = (player.position.x - position.x)
		velocity.x = direction * 1.7
		animations.play("const walk")
		if(direction > 0):
			sprite.flip_h =true
			raycast.target_position.x = 52
		else:
			sprite.flip_h =false
			raycast.target_position.x = -52
	if(raycast.is_colliding()):
		if(raycast.get_collider() != get_node(player_path)):
			velocity.y = -300
	move_and_slide()

func _ready():
	pass # Replace with function body.



func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body == get_node(player_path)):
		alive = false
		velocity.x = 0
		animations.play("fading")


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "fading"):
		queue_free()
