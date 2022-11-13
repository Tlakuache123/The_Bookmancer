extends Node2D

export (NodePath) var player_path

onready var turn_manager = $TurnManager

func _ready():
	$GameBoard.set_enemies()
	get_tree().call_group("UNIT", "setup")
	var player = get_node(player_path)
	player.setup()
	yield(player,"setup")
	turn_manager.units_turns(false)
