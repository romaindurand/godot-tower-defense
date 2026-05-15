class_name Enemy extends CharacterBody2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tower = get_parent().get_node_or_null("Tower")
	if is_instance_valid(tower):
		navigation_agent_2d.target_position = tower.global_position

func _process(_delta: float) -> void:
	if velocity.x > 0.1:
		animated_sprite_2d.flip_h = false
	elif velocity.x < -0.1:
		animated_sprite_2d.flip_h = true

func _on_health_component_died() -> void:
	var game: Game = get_parent()
	game.enemies.erase(self)
	queue_free()
