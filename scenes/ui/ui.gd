class_name UI extends CanvasLayer

@onready var pause_screen: PauseScreen = $pause_screen
@onready var room_transition: ColorRect = $room_transition
@onready var room_transition_anim: AnimationPlayer = $room_transition/AnimationPlayer
@onready var route_map: RouteMap = $route_map

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if not GameManager.game_running: return
	
	if Input.is_action_just_pressed("map"):
		if not route_map.open and not GameManager.changing_rooms:
			open_route_map()
		else:
			close_route_map()
	
	if Input.is_action_just_pressed("ui_cancel"):
		if route_map.open:
			close_route_map()
		else:
			if get_tree().paused:
				if GameManager.settings_screen.visible:
					GameManager.pause_screen.settings_screen.exit_pressed()
				else:
					get_tree().paused = false
					GameManager.pause_screen.close()
			else:
				get_tree().paused = true
				GameManager.pause_screen.open()

func open_route_map() -> void:
	route_map.animation.play("open")
	route_map.show()
	
	await route_map.animation.animation_finished
	
	route_map.open = true
	EventBus.player_not_move.emit()

func close_route_map() -> void:
	route_map.animation.play_backwards("open")
	await route_map.animation.animation_finished
	
	route_map.open = false
	route_map.hide()
	
	EventBus.player_can_move.emit()
