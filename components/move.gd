class_name MoveComponent extends Node

var angle = 0
var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent() is Node2D:
		get_parent().position.x = get_parent().position.x + speed * delta * cos(angle)
		get_parent().position.y = get_parent().position.y + speed * delta * sin(angle)
