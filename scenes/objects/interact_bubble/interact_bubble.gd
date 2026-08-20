class_name InteractBubble extends Node3D
@onready var label: Label3D = $Label3D
@export var text: String = ""

func _ready() -> void:
	if text.length() > 0:
		label.text = text
	
	hide()
