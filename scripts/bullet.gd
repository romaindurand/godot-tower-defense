class_name Bullet extends StaticBody2D

@onready var move_component: MoveComponent = $MoveComponent

func set_direction(new_angle: float) -> void:
	move_component.direction = Vector2.from_angle(new_angle)

func set_speed(new_speed: float) -> void:
	move_component.speed = new_speed
