class_name MoveComponent extends Node

var angle = 0.0
var speed = 0.0

func _process(delta: float) -> void:
	var parent = get_parent()
	if parent is Node2D:
		# Crée un vecteur direction partir de l'angle (en radians) et on le multiplie par la vitesse
		var velocity = Vector2.from_angle(angle) * speed
		parent.position += velocity * delta
