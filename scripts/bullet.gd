class_name Bullet extends Area2D

@onready var move_component: MoveComponent = $MoveComponent

func set_direction(new_angle: float) -> void:
	move_component.direction = Vector2.from_angle(new_angle)

func set_speed(new_speed: float) -> void:
	move_component.speed = new_speed


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.health_component.damage(35)
		queue_free()
