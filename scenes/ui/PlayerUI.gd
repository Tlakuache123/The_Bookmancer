extends Control

signal setup
signal end_turn

enum {
	MENU,
	SELECT,
	OFF_TURN
}

export(Resource) var player_stats
export(Resource) var board 

var single_layout = preload("res://src/layouts/layout_1x1.tres")
var turn : bool = false setget set_turn
var state : int = OFF_TURN setget set_state

var max_hp : int = 0
var hp : int = 0 setget set_hp

onready var button_panel = $ButtonPanel
onready var stats_panel = $PlayerStatsPanel
onready var message_panel = $MessagePanel

func setup():
	player_stats.setup()
	max_hp = player_stats.max_hp
	hp = player_stats.hp
	
	stats_panel.setup(hp, max_hp)
	BattleUnits.player = self
	yield(get_tree(),"idle_frame")
	emit_signal("setup")


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


func set_hp(value):
	hp = clamp(value, 0, max_hp)
	stats_panel.set_hp(hp, max_hp)


func set_turn(value):
	turn = value
	if value:
		self.state = MENU
	else:
		self.state = OFF_TURN
		emit_signal("end_turn")


func _on_AttackButton_pressed():
	board.board_selected = single_layout
	self.state = SELECT
