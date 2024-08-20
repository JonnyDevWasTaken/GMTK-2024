extends CanvasLayer


@onready var restart_button: Button = $ColorRect/VBoxContainer/RestartButton
@onready var main_game: PackedScene = preload("res://scenes/main_game.tscn")
@onready var main_screen: PackedScene = preload("res://scenes/menu_screen.tscn")


func _on_restart_button_button_up() -> void:
	get_tree().reload_current_scene()
