extends Area2D

#===================  Explanation of Changes:
#Onready Variable: @onready var game_manager is used to reference the GameManager node, allowing for interaction with the game manager's functions.
#Body Entered Function: The _on_body_entered(body) function is called when another body enters the Area2D:
#Body Check: if body.name == "CharacterBody2D" checks if the body entering the area is the CharacterBody2D.
#Free Node: queue_free() removes the current Area2D node from the scene tree, effectively "destroying" it.
#Add Points: game_manager.add_points() calls the add_points function from the game manager to increase the player's points.
#====================================

# Onready variable to reference the GameManager node.
@onready var game_manager = %GameManager

# Function called when a body enters the Area2D.
func _on_body_entered(body):
	# Check if the body that entered is the CharacterBody2D.
	if ( body.name == "CharacterBody2D" ):
		# Free the current Area2D node from the scene tree.
		queue_free()
		# Call the add_points function from the game_manager to increase the points.
		game_manager.add_points()
