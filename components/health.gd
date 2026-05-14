class_name HealthComponent extends Node

signal health_changed(current_health: float, max_health: float)
signal died

@export var max_health: float = 100
var current_health: float = max_health

func damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0, max_health)
	_emit()
	if current_health == 0:
		died.emit()

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0, max_health)
	_emit()

func _emit() -> void:
	health_changed.emit(current_health, max_health)
