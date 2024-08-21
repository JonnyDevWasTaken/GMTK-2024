extends Node2D
class_name HealthComponent


signal destroyed


@export var MAX_HEALTH: int = 10
var health: int


func _ready() -> void:
	health = MAX_HEALTH


func damage(dmg: int) -> void:
	health -= dmg
	
	if health <= 0:
		destroyed.emit()
		get_parent().queue_free()
