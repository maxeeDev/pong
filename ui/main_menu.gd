extends Control

func _on_player_vs_player_pressed() -> void:
	Globals.game_mode = Globals.mode.PLAYER_VS_PLAYER
	get_tree().change_scene_to_file("res://level/level.tscn")
	
func _on_player_vs_cpu_pressed() -> void:
	Globals.game_mode = Globals.mode.PLAYER_VS_CPU
	get_tree().change_scene_to_file("res://level/level.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
