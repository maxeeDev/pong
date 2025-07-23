extends Control

var game_scene: PackedScene = preload("res://level/level.tscn")

func _on_player_vs_player_pressed() -> void:
	Globals.game_mode = Globals.mode.PLAYER_VS_PLAYER
	get_tree().change_scene_to_packed(game_scene)

func _on_player_vs_cpu_pressed() -> void:
	Globals.game_mode = Globals.mode.PLAYER_VS_CPU
	get_tree().change_scene_to_packed(game_scene)
