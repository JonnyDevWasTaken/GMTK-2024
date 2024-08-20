extends CanvasLayer


@onready var health_level: ProgressBar = $HealthLevel
@onready var tritium_level: ProgressBar = $TritiumLevel
@onready var titanium_level: ProgressBar = $TitaniumLevel
@onready var crew_number: Label = $CrewNumber


func _ready() -> void:
	pass


func update_health(new_health: int) -> void:
	health_level.value = new_health


func update_max_health(new_max_health: int) -> void:
	health_level.max_value = new_max_health


func update_resources(new_resources: StoredResource) -> void:
	tritium_level.value = new_resources.tritium
	titanium_level.value = new_resources.titanium
	#crew_number.text = str(new_resources.crew)
	
	
func update_limits(new_max_resources: StoredResource) -> void:
	tritium_level.max_value = new_max_resources.tritium
	titanium_level.max_value = new_max_resources.titanium
