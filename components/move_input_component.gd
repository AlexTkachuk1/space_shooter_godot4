class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats

func _input(_event: InputEvent) -> void:
	var input_axis = Input.get_axis("input_left", "input_right")
	move_component.velocity = Vector2(input_axis * move_stats.speed, 0)
