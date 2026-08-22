class_name RouteMap extends Control

@onready var map_container: Control = $map_container
@onready var animation: AnimationPlayer = $AnimationPlayer

@onready var marker: TextureRect = $marker

var open: bool = false

func _ready() -> void:
	pass

func add_details() -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	marker.position = Vector2(player.global_position.x, player.global_position.y)
	# trains running

func _process(delta: float) -> void:
	if open:
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
		if direction.length() > 0:
			direction = direction.normalized()
			
			map_container.position.x += delta * direction.x * 80
			map_container.position.y += delta * direction.y * 80
