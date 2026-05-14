class_name Enemy extends Node2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	navigation_agent_2d.target_position = get_parent().get_node_or_null("Tower").global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		var game: Game = get_parent()
		game.enemies.erase(self)
		queue_free()
		body.queue_free()
