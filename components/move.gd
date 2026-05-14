class_name MoveComponent extends Node

enum MoveMode { DIRECTIONAL, TARGET_NODE, NAVIGATION }

@export var mode: MoveMode = MoveMode.DIRECTIONAL
@export var speed: float = 100.
@export var nav_agent: NavigationAgent2D

var direction: Vector2 = Vector2.ZERO
var target: Node2D

func _process(delta: float) -> void:
	var parent = get_parent()
	if not parent is Node2D:
		return

	var step = speed * delta

	match mode:
		MoveMode.DIRECTIONAL:
			parent.global_position += direction.normalized() * step

		MoveMode.TARGET_NODE:
			if is_instance_valid(target):
				parent.global_position = parent.global_position.move_toward(target.global_position, step)

		MoveMode.NAVIGATION:
			if is_instance_valid(nav_agent) and not nav_agent.is_navigation_finished():
				var next_position = nav_agent.get_next_path_position()
				parent.global_position = parent.global_position.move_toward(next_position, step)
