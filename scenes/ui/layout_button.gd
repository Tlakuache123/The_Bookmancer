extends Control

export (Resource) var layout
export (Resource) var board


func _on_Button_pressed():
	board.board_selected = layout
