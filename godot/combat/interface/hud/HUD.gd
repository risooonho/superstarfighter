extends HBoxContainer

var Bar = preload('res://combat/interface/hud/Bar.tscn')

var game_mode

func initialize(_game_mode):
	game_mode = _game_mode
	
	$TimeLeft.text = str(int(floor(game_mode.time_left)))
	
	for player in game_mode.players:
		var bar = Bar.instance()
		$Bars.add_child(bar)
		bar.initialize(player.species_template.color, game_mode.TARGET_SCORE)
		bar.player = player
		
func _process(_delta):
	# update time left
	$TimeLeft.text = str(int(floor(game_mode.time_left)))
	
	# update scores
	for bar in $Bars.get_children():
		bar.set_value(game_mode.scores[bar.player.name])
		