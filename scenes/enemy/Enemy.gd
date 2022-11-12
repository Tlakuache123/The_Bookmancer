extends Actor
class_name Enemy

signal selected(select, index)
signal end_selected

var in_mouse : bool = false setget set_in_mouse
var board_index : Array = [0]  # 1- Front / Back  2- Left, Center, Right
var turn : bool = false setget set_turn

onready var hp_bar = $HpBar
onready var anim = $AnimationPlayer

func _ready():
	_setup()


func _play_turn() -> void:
	anim.play("attack")
	yield(anim,"animation_finished")
	_end_turn()


func _setup() -> void:
	hp_bar.max_value = max_hp
	hp_bar.value = hp


func _set_hp(value) -> void:
	hp = clamp(value, 0, max_hp)
	hp_bar.value = hp


func set_turn(value):
	turn = value
	if !turn:
		_end_turn()


func set_in_mouse(value):
	in_mouse = value
	if in_mouse:
		anim.play("select")
	else:
		anim.play("RESET")


func check_player() -> bool:
	return is_instance_valid(BattleUnits.player) and \
		BattleUnits.player.state == BattleUnits.State.SELECT


func _on_ClickBox_mouse_entered():
	if check_player():
		emit_signal("selected", true, board_index)


func _on_ClickBox_mouse_exited():
	if check_player():
		emit_signal("selected", false, board_index)


func _on_ClickBox_input_event(_viewport, event, _shape_idx):
	if check_player():
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == BUTTON_LEFT:
				emit_signal("end_selected")
