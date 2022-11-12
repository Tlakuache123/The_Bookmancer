extends Control

onready var label = $MarginContainer/Label


func set_text(text : String):
	label.text = text
