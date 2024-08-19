extends CharacterBody2D


@export var speed: float = 50.0
@export var acceleration: float = 0.1
@export var rotation_speed: float = 3.0
var target_rotation: float
var stored_resources := StoredResource.new()


func _ready() -> void:
	
	# set initial stored resources
	#var stored_resources = StoredResource.new()
	stored_resources.crew = 10
	stored_resources.titanium = 10
	stored_resources.tritium = 10
	print_resources()
	
	EventBus.transfer_resource.connect(receive_resources)


func _physics_process(delta: float) -> void:
	
	target_rotation = Input.get_axis("rotate_left", "rotate_right")
	
	if Input.is_action_pressed("thrust"):
		velocity += transform.x * (acceleration * speed)
	rotation += target_rotation * rotation_speed * delta

	move_and_slide()


func receive_resources(resources: StoredResource) -> void:
	stored_resources.add_resources(resources)
	print_resources()


func print_resources() -> void:
	print("Player crew: " + str(stored_resources.crew))
	print("Player titanium: " + str(stored_resources.titanium))
	print("Player tritium: " + str(stored_resources.tritium))


func _on_health_component_destroyed() -> void:
	print("Player died")
