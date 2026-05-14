class_name Enemy extends Node2D
@onready var move_component: MoveComponent = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_component.target = get_parent().get_node_or_null("Tower")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		var game: Game = get_parent()
		game.enemies.erase(self)
		queue_free()
		body.queue_free()
