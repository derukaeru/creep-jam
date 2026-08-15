class_name RouteMap extends Control
@onready var map_container: Control = $map_container
@onready var animation: AnimationPlayer = $AnimationPlayer

var open: bool = false

func _ready() -> void:
	pass

func add_details() -> void:
	pass

func _process(delta: float) -> void:
	if open:
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
		if direction.length() > 0:
			direction = direction.normalized()
			
			map_container.position.x += delta * direction.x * 80
			map_container.position.y += delta * direction.y * 80
