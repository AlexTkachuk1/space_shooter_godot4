extends ParallaxBackground

@onready var space_layer: ParallaxLayer = $SpaceLayer
@onready var far_stars_layer: ParallaxLayer = $FarStarsLayer
@onready var close_stars_layer: ParallaxLayer = $CloseStarsLayer

func _process(delta):
	space_layer.motion_offset.y += 8 * delta
	far_stars_layer.motion_offset.y += 15 * delta
	close_stars_layer.motion_offset.y += 30 * delta
