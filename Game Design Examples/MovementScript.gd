extends CharacterBody2D

@export var bullet:PackedScene
@export var bullet_spawn:Node2D

var can_fire = true;
# Called when the node enters the scene tree for the first time.
func _ready():
	bullet = load("res://bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x = get_global_mouse_position().x
	if Input.is_action_pressed("fire") and can_fire:
		var b = bullet.instantiate()
		b.global_position = bullet_spawn.global_position
		b.global_rotation = bullet_spawn.global_rotation
		get_tree().get_root().add_child(b) 
		can_fire = false
		$Timer.start()
