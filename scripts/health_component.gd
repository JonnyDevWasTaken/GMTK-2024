extends Node2D
class_name HealthComponent


signal destroyed


@export var MAX_HEALTH: float = 10.0
var health: float


func _ready() -> void:
	health = MAX_HEALTH
	
	
func damage(dmg: float) -> void:
	health -= dmg
	
	if health <= 0:
		destroyed.emit()
		get_parent().queue_free()
