extends Sprite2D


var stored_resources := StoredResource.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stored_resources.crew = randi_range(1, 10)
	stored_resources.titanium = randi_range(1, 10)
	stored_resources.tritium = randi_range(1, 10)


func _on_health_component_destroyed() -> void:
	EventBus.transfer_resource.emit(stored_resources)
