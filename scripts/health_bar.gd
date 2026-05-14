extends Control

@export var health_component: HealthComponent
@onready var health_rect: ColorRect = $CurrentHealth

func _ready() -> void:
		if health_component:
				health_component.health_changed.connect(_on_health_component_health_changed)
		else:
				push_warning("HealthBar : Aucun HealthComponent n'est assigné !")


func _on_health_component_health_changed(current_health: float, max_health: float) -> void:
	health_rect.scale.x = current_health / max_health
