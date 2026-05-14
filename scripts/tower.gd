extends StaticBody2D

const bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var closest_enemy = find_closest_enemy()

	# S'il n'y a pas d'ennemi on ne tire pas
	if closest_enemy == null:
		return

	var bullet: Bullet = bullet_scene.instantiate()

	get_parent().add_child(bullet)
	# spawn bullet at tower position
	bullet.global_position = global_position

	var bullet_angle = global_position.angle_to_point(closest_enemy.global_position)
	bullet.set_direction(bullet_angle)

func find_closest_enemy() -> Enemy:
	var game: Game = get_parent()
	if game.enemies.is_empty():
		return null

	#var closest: Enemy = game.enemies[0]
	var closest: Enemy = null
	var closest_distance: float = INF
	for enemy in game.enemies:
		var distance = global_position.distance_to(enemy.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest = enemy
	return closest
