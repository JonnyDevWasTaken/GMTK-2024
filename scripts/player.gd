extends CharacterBody2D


signal update_resources
signal game_end


@export var health_component: HealthComponent
@export var speed: float = 50.0
@export var acceleration: float = 0.1
@export var rotation_speed: float = 3.0
@export var base_health: int = 10
var target_rotation: float
var stored_resources := StoredResource.new()
var base_resource_limit := StoredResource.new()
var resource_limit := StoredResource.new()
var curr_scale: float = 1


func _ready() -> void:
	
	# set initial stored resources
	stored_resources.titanium = 10
	stored_resources.tritium = 10
	#stored_resources.crew = 10
	health_component.MAX_HEALTH = base_health
	health_component.health = base_health
	
	base_resource_limit.titanium = 50
	base_resource_limit.tritium = 50
	#base_resource_limit.crew = 20
	
	resource_limit.titanium = 50
	resource_limit.tritium = 50
	#resource_limit.crew = 20
	
	scale = Vector2.ONE
	
	EventBus.transfer_resource.connect(receive_resources)


func _process(delta: float) -> void:
	if stored_resources.tritium == 0 or stored_resources.titanium == 0:
		game_end.emit()


func _physics_process(delta: float) -> void:
	target_rotation = Input.get_axis("rotate_left", "rotate_right")
	if Input.is_action_pressed("thrust"):
		velocity += transform.x * (acceleration * speed)
	rotation += target_rotation * rotation_speed * delta
	move_and_slide()


func receive_resources(resources: StoredResource, add_scale: float) -> void:
	stored_resources.add_resources(resources)
	if add_scale > 0:
		curr_scale += add_scale
		resource_limit.scale_resources(curr_scale)
		health_component.MAX_HEALTH = base_health * curr_scale
		scale = Vector2.ONE * curr_scale
	update_resources.emit()


func _on_health_component_destroyed() -> void:
	game_end.emit()


func _on_regen_timer_timeout() -> void:
	if stored_resources.titanium > 5 and health_component.health < health_component.MAX_HEALTH:
		health_component.health += 10
		stored_resources.titanium -= 5
