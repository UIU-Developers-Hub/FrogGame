extends Node
# Onready variable to reference the Points Label node.
@onready var points_label = %"Points Label"

var points = 0
# Function to add points and update the label.
func add_points():
	points += 1
	print(points)
	# Update the text of the points_label to reflect the new points total.
	points_label.text = "points :" +  str(points)

