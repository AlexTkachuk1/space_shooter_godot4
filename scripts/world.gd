extends Node2D

@export var game_stats: GameStats

@onready var ship: Node2D = $Ship
@onready var score_lable: Label = $ScoreLable

func _ready():
	randomize()
	update_score_lable(game_stats.score)
	game_stats.score_changed.connect(update_score_lable)
	
	ship.tree_exited.connect(func():
		if get_tree():
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
	)

func update_score_lable(new_score: int) -> void:
	score_lable.text = "Score: " + str(new_score)
