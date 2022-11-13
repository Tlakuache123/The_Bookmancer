extends Node
class_name TurnManager

signal player_turn(value)


func units_turns(player : bool) -> void:
	var all_enemies = get_tree().get_nodes_in_group("ENEMY")
	if all_enemies.size() == 0:
		return

	if player:
		enemy_turn()
	else:
		player_turn()


func player_turn():
	BattleUnits.player.turn = true
	yield(BattleUnits.player, "end_turn")
	units_turns(true)


func enemy_turn():
	yield(get_tree(), "idle_frame")
	var all_enemy = get_tree().get_nodes_in_group("ENEMY")
	for enemy in all_enemy:
		enemy.turn = true
		yield(enemy, "end_turn")
	units_turns(false)


func end_player_turn():
	yield(get_tree(),"idle_frame")
	emit_signal("player_turn", false)


func start_player_turn():
	yield(get_tree(),"idle_frame")
	emit_signal("player_turn", true)
