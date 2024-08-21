extends Node2D


@onready var spawn_point: PathFollow2D = $SpawnPath/SpawnPoint
@onready var spawn_timer: Timer = $SpawnTimer
@export var spawn_scene: PackedScene
@export var spawn_delay: float = 1


func _ready() -> void:
	spawn_timer.wait_time = spawn_delay
	
	
func spawn_object() -> void:
	var new_spawn := spawn_scene.instantiate()
	spawn_point.progress_ratio = randf()
	new_spawn.global_position = spawn_point.global_position
	add_child(new_spawn)


func _on_spawn_timer_timeout() -> void:
	spawn_object()
