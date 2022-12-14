extends Node2D
class_name Actor

signal setup
signal end_turn
signal end_take_damage

export(int) var max_hp: int = 1
export(int) var damage: int = 1
export(int) var speed: int = 1
export(int) var drop_coins: int = 1
export(int) var drop_xp: int = 1

onready var hp = max_hp setget _set_hp


func _setup() -> void:
	yield(get_tree(),"idle_frame")
	emit_signal("setup")


func _take_damage() -> void:
	send_end_take_damage()


func _end_turn() -> void:
	send_end_turn()


func _drop_loot() -> Dictionary:
	return {"coins": drop_coins, "xp": drop_xp}


func _play_turn() -> void:
	pass


func _do_damage() -> void:
	if is_instance_valid(BattleUnits.player):
		BattleUnits.player.hp -= damage


func _set_hp(value) -> void:
	hp = clamp(value, 0, max_hp) 


func send_end_turn():
	yield(get_tree(),"idle_frame")
	emit_signal("end_turn")


func send_end_take_damage():
	yield(get_tree(),"idle_frame")
	emit_signal("end_take_damage")
