extends MarginContainer

var player_stats : Resource

onready var hp_bar = $Panel/ProgressBar
onready var hp_label = $Panel/HpLabel

func setup(stats):
	player_stats = stats
	player_stats.setup()
	player_stats.connect("change_hp", self, "set_hp")
	hp_bar.max_value = player_stats.max_hp
	hp_bar.value = player_stats.hp
	hp_label.text = "HP:%s/%s" % [player_stats.max_hp, player_stats.hp]

func set_hp(value):
	hp_bar.value = value
	hp_label.text = "HP:%s/%s" % [player_stats.hp, player_stats.max_hp]

func _input(event):
	if event.is_action_pressed("ui_down"):
		player_stats.hp -= 1
