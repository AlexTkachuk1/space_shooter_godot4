extends Node2D

@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var shoot_input_component: ShootInputComponent = $ShootInputComponent as ShootInputComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var flame_animated_sprite_2d: AnimatedSprite2D = $Anchor/FlameAnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var variable_pitch_audio_stream_player: VariablePitchAudioStreamPlayer = $VariablePitchAudioStreamPlayer as VariablePitchAudioStreamPlayer

func _ready() -> void:
	shoot_input_component.shoot.connect(fire_lasers)
	
func fire_lasers() -> void:
	variable_pitch_audio_stream_player.play_with_variance()
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()

func _process(_delta: float) -> void:
	animate_the_ship()

func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("bank_left")
		flame_animated_sprite_2d.play("bank_left")
	if move_component.velocity.x > 0:
		animated_sprite_2d.play("bank_right")
		flame_animated_sprite_2d.play("bank_right")
	if move_component.velocity.x == 0:
		animated_sprite_2d.play("center")
		flame_animated_sprite_2d.play("center")
