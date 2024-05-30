extends Area2D

@export var target_lavel : PackedScene

func _on_body_entered(body):
	if ( body.name == "CharacterBody2D"):
		get_tree().change_scene_to_packed(target_lavel)
