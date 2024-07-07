class_name ShootInputComponent
extends Node

signal shoot

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot.emit()
