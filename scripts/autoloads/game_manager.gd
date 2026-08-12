extends Node

@onready var pause_screen = load(Registry.UID["pause_screen"]).instantiate()
@onready var ui = load(Registry.UID["ui"]).instantiate()
var canvas_layer = CanvasLayer.new()

func _ready() -> void:
	add_child(canvas_layer)
	canvas_layer.layer = 5
	
	canvas_layer.add_child(ui)
	canvas_layer.add_child(pause_screen)
	
	pause_screen.hide()
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_d) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
			pause_screen.hide()
			Util.mouse_captured()
		else:
			get_tree().paused = true
			pause_screen.show()
			Util.mouse_visible()

func change_map(id: String) -> void:
	if Registry.MAPS.has(id):
		EventBus.go_to_map.emit(id)
	
	# transition here maybe
