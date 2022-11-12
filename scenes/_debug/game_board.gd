extends Node

enum {
	FRONT,
	BACK
}

var enemy_board : Array = []

export (Resource) var board

onready var front_layout = get_node("FrontEnemy").get_children()


func check_player_select():
	return is_instance_valid(BattleUnits.player) and \
		BattleUnits.player.state == BattleUnits.State.SELECT


func diselect_enemies():
	for enemy in enemy_board:
		enemy.in_mouse = false


func set_enemies() -> void:
	var front_board = board.get_board()
	for index in front_board.size():
		if  front_board[index] == null:
			enemy_board.append(null)
			continue
		
		var new_enemy : Enemy = front_board[index].instance()
		new_enemy.board_index[0] = index
		new_enemy.connect("selected", self, "update_selected_enemy")
		new_enemy.connect("end_selected", self, "process_selected_enemy")
		front_layout[index].add_child(new_enemy)
		enemy_board.append(new_enemy)


func process_selected_enemy():
	for enemy in enemy_board:
		if enemy.in_mouse:
			enemy.hp -= 1
	if check_player_select():
		BattleUnits.player.turn = false
		diselect_enemies()


func update_selected_enemy(select: bool, index: Array):
	var select_array = board.get_board_selected_index(index[0])
	for index in select_array:
		if(enemy_board[index] == null):
			continue
		
		enemy_board[index].in_mouse = select
