extends Node
class_name TurnManager

signal player_turn(value)


func end_player_turn():
	yield(get_tree(),"idle_frame")
	emit_signal("player_turn", false)


func start_player_turn():
	yield(get_tree(),"idle_frame")
	emit_signal("player_turn", true)
