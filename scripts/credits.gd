extends CanvasLayer


func _on_back_button_button_up() -> void:
	EventBus.back_to_main_screen.emit()
