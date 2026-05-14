extends StaticBody2D

const bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var bullet: Bullet  = bullet_scene.instantiate()
	var enemyPosition = findClosestEnemyPosition()
	if enemyPosition == Vector2.ZERO:
		return
	add_child(bullet)
	bullet.set_direction(atan2(enemyPosition.y - position.y, enemyPosition.x - position.x))
	#bullet.position = Vector2(50, 50)

func findClosestEnemyPosition() -> Vector2:
	var game: Game = get_parent()
	if game.enemies.size() == 0:
		return Vector2(0, 0)
	var closest: Enemy = game.enemies[0]
	return closest.position
