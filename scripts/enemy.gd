extends CharacterBody2D
class_name Enemy


@onready var player: CharacterBody2D = get_node("/root/MainGame/Player")
var stored_resources := StoredResource.new()
@export var speed: float = 50.0
@export var min_dist_to_player: int = 100
@export var add_scale: float = 0.1
@export var separation_dist: int = 200
var local_enemies: Array = []


func _ready() -> void:
	stored_resources.titanium = randi_range(1, 10)
	stored_resources.tritium = randi_range(1, 10)
	#stored_resources.crew = randi_range(1, 10)


func _physics_process(delta: float) -> void:
	
	look_at(player.global_position)
	if global_position.distance_to(player.global_position) > min_dist_to_player:
		velocity = global_position.direction_to(player.global_position).normalized() * speed
	else:
		velocity = Vector2.ZERO
		
	# maintain certain distance from other ememies
	for enemy in local_enemies:
		if global_position.distance_to(enemy.global_position) < separation_dist:
			velocity -= global_position.direction_to(enemy.global_position).normalized() * speed

	move_and_slide()


func _on_enemy_visiblility_screen_exited() -> void:
	queue_free()


func _on_health_component_destroyed() -> void:
	EventBus.transfer_resource.emit(stored_resources, add_scale)


func _on_separation_area_body_entered(body: Enemy) -> void:
	if body != self:
		local_enemies.append(body)


func _on_separation_area_body_exited(body: Enemy) -> void:
	local_enemies.erase(body)
