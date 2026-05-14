class_name MoveComponent extends Node

enum MoveMode { DIRECTIONAL, TARGET_NODE }

@export var mode: MoveMode = MoveMode.DIRECTIONAL
@export var speed: float = 100.0

var direction: Vector2 = Vector2.ZERO
var target: Node2D

func _process(delta: float) -> void:
	var parent = get_parent()
	if not parent is Node2D:
		return

	var step = speed * delta

	match mode:
		MoveMode.DIRECTIONAL:
			parent.position += direction.normalized() * step

		MoveMode.TARGET_NODE:
			if is_instance_valid(target):
				parent.position = parent.position.move_toward(target.global_position, step)
