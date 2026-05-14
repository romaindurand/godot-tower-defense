class_name Game extends Node2D

const enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
@export var enemies: Array[Enemy] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemy: Enemy = enemy_scene.instantiate()
	var x = 500 if randf() > 0.5 else -500
	var y = 300 if randf() > 0.5 else -300
	enemy.position = Vector2(x, y)
	add_child(enemy)
	enemies.push_back(enemy)
