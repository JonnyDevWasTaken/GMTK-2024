extends Node2D


@onready var game_ui: CanvasLayer = $GameUI
@onready var player: CharacterBody2D = $Player
@onready var game_over: CanvasLayer = $GameOver


func _ready() -> void:
	game_ui.update_limits(player.resource_limit)
	game_ui.update_resources(player.stored_resources)
	game_ui.visible = true
	game_over.visible = false


func _on_player_update_resources() -> void:
	game_ui.update_limits(player.resource_limit)
	game_ui.update_resources(player.stored_resources)


func _on_player_game_end() -> void:
	game_ui.visible = false
	game_over.visible = true
