class_name GameStats
extends Resource

@export var score: int = 0:
	set(value):
		if value > 0:
			score = value
			score_changed.emit(score)

@export var highscore: int = 0

signal score_changed(new_score)
