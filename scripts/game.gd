class_name Game extends Node2D

const enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
@export var enemies: Array[Enemy] = []

@onready var spawn_path: Path2D = $SpawnLine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_timer_timeout() -> void:
	var enemy: Enemy = enemy_scene.instantiate()

	var random_offset = randf_range(0.0, spawn_path.curve.get_baked_length())
	enemy.global_position = spawn_path.to_global(spawn_path.curve.sample_baked(random_offset))

	add_child(enemy)
	enemies.push_back(enemy)
