extends Resource
class_name PlayerStats

export(int) var max_hp : int = 10 setget, get_max_hp
export(int) var hp : int = 10 setget set_hp
export(int) var bonus_hp : int = 0
export(int) var damage : int = 1 setget, get_damage
export(int) var bonus_damage : int = 0


func get_damage() -> int:
	return damage + bonus_damage


func refresh_stats():
	hp = max_hp


func set_hp(value):
	hp = clamp(value, 0, self.max_hp)


func get_max_hp() -> int:
	return max_hp + bonus_hp
