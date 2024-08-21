extends Node2D


@onready var new_game_button: Button = $CanvasLayer/ColorRect/VBoxContainer/NewGameButton
@onready var instructions_button: Button = $CanvasLayer/ColorRect/VBoxContainer/InstructionsButton
@onready var main_game: PackedScene = preload("res://scenes/main_game.tscn")
@onready var main_screen: CanvasLayer = $MainScreen
@onready var information: CanvasLayer = $Information
@onready var credits: CanvasLayer = $Credits


func _ready() -> void:
	main_screen.visible = true
	information.visible = false
	credits.visible = false
	EventBus.back_to_main_screen.connect(to_main_screen)


func to_main_screen() -> void:
	main_screen.visible = true
	information.visible = false
	credits.visible = false


func _on_new_game_button_button_up() -> void:
	get_tree().change_scene_to_packed(main_game)


func _on_instructions_button_button_up() -> void:
	main_screen.visible = false
	information.visible = true
	credits.visible = false


func _on_credits_button_up() -> void:
	main_screen.visible = false
	information.visible = false
	credits.visible = true
