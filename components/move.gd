class_name MoveComponent extends Node

enum MoveMode { DIRECTIONAL, TARGET_NODE, NAVIGATION }

@export var mode: MoveMode = MoveMode.DIRECTIONAL
@export var speed: float = 100.
@export var nav_agent: NavigationAgent2D

var direction: Vector2 = Vector2.ZERO
var target: Node2D

func _physics_process(delta: float) -> void:
	var parent = get_parent()
	if not parent is Node2D:
		return

	var direction_vector := Vector2.ZERO

	match mode:
		MoveMode.DIRECTIONAL:
			direction_vector = direction.normalized()
		MoveMode.TARGET_NODE:
			if is_instance_valid(target):
				direction_vector = parent.global_position.direction_to(target.global_position)
		MoveMode.NAVIGATION:
			if is_instance_valid(nav_agent) and not nav_agent.is_navigation_finished():
				var next_position = nav_agent.get_next_path_position()
				direction_vector = parent.global_position.direction_to(next_position)
				var direction_ideal = direction_vector
				nav_agent.velocity = direction_ideal * speed # On envoie l'intention à l'agent


	if parent is CharacterBody2D:
		parent.velocity = direction_vector * speed
		parent.move_and_slide()
	else:
		parent.global_position += direction_vector * speed * delta

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
		var parent = get_parent()
		if parent is CharacterBody2D:
			parent.velocity = safe_velocity
			parent.move_and_slide()
