extends Node2D

# Function called when the yes button is pressed.
func _on_yes_button_pressed():
	# Change the current scene to 'level2.tscn'.
	get_tree().change_scene_to_file("res://scenes/level2.tscn")

# Function called when the back button is pressed.
func _on_back_button_pressed():
	# Change the current scene to 'main_menu.tscn'.
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

