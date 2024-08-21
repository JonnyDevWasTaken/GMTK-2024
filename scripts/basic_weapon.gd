extends Node2D


enum Origin {PLAYER, ENEMY}


@onready var bullet := preload("res://scenes/projectile.tscn")
@onready var timer: Timer = $Timer
@onready var source: Marker2D = $Source
@export var bullet_damage: float = 1.0
@export var fire_rate: float = 0.5
@export var origin: Origin

@onready var enemy_laser = preload("res://assets/enemy_laser.png")
@onready var player_laser = preload("res://assets/player_laser.png")


func _ready() -> void:
	timer.wait_time = fire_rate


func _on_timer_timeout() -> void:
	var new_bullet := bullet.instantiate()
	if origin == Origin.ENEMY:
		new_bullet.set_collision_mask_value(1, 1)
		new_bullet.set_laser_sprite(enemy_laser)
	else:
		new_bullet.set_collision_mask_value(2, 1)
		new_bullet.set_laser_sprite(player_laser)
	source.add_child(new_bullet)
	new_bullet.global_position = source.global_position
	new_bullet.global_rotation = source.global_rotation
	new_bullet.damage = bullet_damage
