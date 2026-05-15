class_name Enemy extends CharacterBody2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var health_component: HealthComponent = $HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tower = get_parent().get_node_or_null("Tower")
	if is_instance_valid(tower):
		navigation_agent_2d.target_position = tower.global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Bullet:
		health_component.damage(35)
		body.queue_free()


func _on_health_component_died() -> void:
	var game: Game = get_parent()
	game.enemies.erase(self)
	queue_free()
