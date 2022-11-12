extends Control

enum {
	MENU,
	SELECT,
	OFF_TURN
}

export(Resource) var player_stats
export(Resource) var board 

var single_layout = preload("res://src/layouts/layout_1x1.tres")
var turn : bool = true setget set_turn
var state : int = OFF_TURN setget set_state

onready var button_panel = $ButtonPanel
onready var stats_panel = $PlayerStatsPanel
onready var message_panel = $MessagePanel

func _ready():
	setup()


func setup():
	stats_panel.setup(player_stats)
	BattleUnits.player = self


func set_state(value):
	state = value
	match value:
		OFF_TURN:
			button_panel.hide()
			message_panel.hide()
		MENU:
			button_panel.show()
			message_panel.hide()
		SELECT:
			button_panel.hide()
			message_panel.set_text("Select Enemy")
			message_panel.show()


func set_turn(value):
	turn = value
	if value:
		self.state = MENU
	else:
		self.state = OFF_TURN


func _on_AttackButton_pressed():
	board.board_selected = single_layout
	self.state = SELECT
