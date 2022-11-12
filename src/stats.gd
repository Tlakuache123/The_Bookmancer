extends Resource
class_name Stats

signal change_hp(value)
signal change_turn(value)

export(int) var max_hp = 1
export(int) var hp = 1 setget set_hp
export(int) var damage = 1
var turn : bool = true setget set_turn

func setup():
	hp = max_hp


func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("change_hp", hp)


func set_turn(value):
	turn = value
	emit_signal("change_turn", value)
