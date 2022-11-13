extends MarginContainer

onready var hp_bar = $Panel/ProgressBar
onready var hp_label = $Panel/HpLabel

func setup(hp : int, max_hp : int):
	hp_bar.max_value = max_hp
	hp_bar.value = hp
	hp_label.text = "HP:%s/%s" % [hp, max_hp]

func set_hp(hp : int, max_hp: int):
	hp_bar.value = hp
	hp_label.text = "HP:%s/%s" % [hp, max_hp]

