extends CharacterBody2D


#================Explanation of Changes:
#=======================================
#Constants: SPEED and JUMP_VELOCITY are defined for easier adjustment and readability.
#Onready Variable: @onready var sprite_2d is used to reference the Sprite2D node, allowing for easy animation control.
#Gravity Setting: gravity is fetched from the project settings to ensure it matches the physics settings.
#Physics Process Function: The _physics_process(delta) function is called every physics frame and handles movement, gravity, jumping, and animations:
#Animation Control: Sets the animation based on horizontal velocity.
#Gravity Application: Adds gravity to the vertical velocity when the character is not on the floor.
#Jump Handling: Sets the vertical velocity to JUMP_VELOCITY when the jump key is pressed and the character is on the floor.
#Movement Control: Updates the horizontal velocity based on input and smoothly decelerates to a stop.
#Sprite Flipping: Flips the sprite horizontally based on the direction of movement.

#================================-------------------------------------=====================

# Constants for movement speed and jump velocity.
const SPEED = 300.0
const JUMP_VELOCITY = -800.0
# Onready variable to reference the Sprite2D node for animations.
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Function called every physics frame. delta is the elapsed time since the previous frame.
func _physics_process(delta):
	# Handle animation based on horizontal velocity.
	if ( velocity.x > 1 || velocity.x < -1 ):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"	
	
	# Apply gravity when not on the floor.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump action when the jump key is pressed and the character is on the floor.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 15)
# Move the character and handle collisions.
	move_and_slide()
	
	# Flip the sprite horizontally based on the direction of movement.
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
