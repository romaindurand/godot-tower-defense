class_name Enemy extends Node2D
@onready var move_component: MoveComponent = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_component.speed = 40
	move_component.angle = atan2(0 - position.y, 0 - position.x)

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
