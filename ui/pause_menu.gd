extends Control

func resume():
	get_tree().paused = false
	visible = false

func pause():
	get_tree().paused = true
	visible = true

func handle_pause_menu() -> void:
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

func _ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	handle_pause_menu()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_back_to_main_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
