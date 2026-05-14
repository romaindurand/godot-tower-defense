class_name Enemy extends Node2D
@onready var move_component: MoveComponent = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_component.speed = 40
	# direction vers le centre de la carte (0, 0)
	move_component.angle = position.direction_to(Vector2.ZERO).angle()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("collision")
	print(body)
	if body is Bullet:
		print("collision with bullet")
		var game: Game = get_parent()
		game.enemies.erase(self)
		print(game.enemies.size())
		queue_free()
		body.queue_free()
