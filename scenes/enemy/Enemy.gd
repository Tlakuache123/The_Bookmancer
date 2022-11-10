extends Actor
class_name Enemy

signal selected(select, index)
signal end_selected

var in_mouse : bool = false setget set_in_mouse
var board_index : Array = [0]  # 1- Front / Back  2- Left, Center, Right

onready var hp_bar = $HpBar
onready var anim = $AnimationPlayer

func _ready():
	_setup()

func _setup() -> void:
	hp_bar.max_value = max_hp
	hp_bar.value = hp

func _set_hp(value) -> void:
	hp = clamp(value, 0, max_hp)
	hp_bar.value = hp

func set_in_mouse(value):
	in_mouse = value
	if in_mouse:
		anim.play("select")
	else:
		anim.play("RESET")

func _on_ClickBox_mouse_entered():
	emit_signal("selected", true, board_index)

func _on_ClickBox_mouse_exited():
	emit_signal("selected", false, board_index)


func _on_ClickBox_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			emit_signal("end_selected")
