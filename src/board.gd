extends Resource
class_name Board

export (Array, PackedScene) var game_board = [
	null, null, null
]

export(Resource) var board_selected

func get_board() -> Array:
	return game_board

func set_unit(index: int, unit: Actor) -> void:
	game_board[index] = unit

func get_unit(index : int) -> Actor:
	return game_board[index]

func get_board_selected_index(index : int) -> Array:
	var select_array = []
	
	# Front
	var front_layout = board_selected.get_front()
	
	# Center
	if front_layout[1]:
		select_array.append(index)
	# Left
	if front_layout[0]:
		if index > 0:
			select_array.append(index - 1)
	# Right
	if front_layout[2]:
		if index < 2:
			select_array.append(index + 1)
	
	return select_array
