extends CharacterBody2D


@export var speed: float = 50.0
@export var acceleration: float = 0.1
@export var rotation_speed: float = 3.0
var target_rotation: float


func _physics_process(delta: float) -> void:
	
	# get input
	target_rotation = Input.get_axis("rotate_left", "rotate_right")
	
	# set rotation and velocity
	if Input.is_action_pressed("thrust"):
		velocity += transform.x * (acceleration * speed)
	rotation += target_rotation * rotation_speed * delta

	move_and_slide()
