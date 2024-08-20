extends RigidBody2D
class_name Asteroid


var stored_resources := StoredResource.new()
@export var MIN_SPEED: int = 10
@export var MAX_SPEED: int = 20


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stored_resources.titanium = randi_range(1, 10)
	stored_resources.tritium = randi_range(1, 10)
	apply_impulse(Vector2.RIGHT.rotated(randf() * TAU) * randi_range(MIN_SPEED, MAX_SPEED))


func _on_health_component_destroyed() -> void:
	EventBus.transfer_resource.emit(stored_resources, 0)


func _on_asteroid_visibility_screen_exited() -> void:
	queue_free()
