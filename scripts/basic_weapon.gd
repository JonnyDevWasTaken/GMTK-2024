extends Node2D


@onready var bullet := preload("res://scenes/projectile.tscn")
@onready var source: Marker2D = $Source
@export var bullet_damage: float = 1.0


func _on_timer_timeout() -> void:
	var new_bullet := bullet.instantiate()
	source.add_child(new_bullet)
	new_bullet.global_position = source.global_position
	new_bullet.global_rotation = source.global_rotation
	new_bullet.damage = bullet_damage
