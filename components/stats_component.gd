class_name StatsComponent
extends Node

@export var health: int = 1:
	set(value):
		if health > 0:
			health = value
			health_changed.emit()
		
			if health == 0: no_health.emit()
		else:
			health = 0

signal health_changed()
signal no_health()
