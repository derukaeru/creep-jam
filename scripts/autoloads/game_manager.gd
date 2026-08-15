extends Node

@onready var pause_screen: PauseScreen = load(Registry.UID.pause_screen).instantiate()
@onready var ui: UI = load(Registry.UID.ui).instantiate()

var canvas_layer: CanvasLayer = CanvasLayer.new()

var game_running: bool = true
var changing_rooms: bool = false

const normal_fov: float = 75.0

var mails: Array = []

func _ready() -> void:
	add_child(canvas_layer)
	canvas_layer.layer = 8
	
	canvas_layer.add_child(ui)
	ui.add_child(pause_screen)
	
	pause_screen.hide()
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_d) -> void:
	pass

func change_map(id: String) -> void:
	if Registry.MAPS.has(id):
		EventBus.go_to_map.emit(id)
	
	# transition here maybe
