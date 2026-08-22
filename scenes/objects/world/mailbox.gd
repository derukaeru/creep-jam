class_name Mailbox extends InteractableComponent
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var model_container: Node3D = $model_container

@export var id: int = 0
var is_active: bool = false

func _on_interacted() -> void:
	if not is_active: return
	
	submit_mail()
	animation.play("interact")
	

func submit_mail() -> void:
	EventBus.delivered_mail.emit(id)

func set_as_next_mail() -> void:
	is_active = true
	
	var marker: Node3D = load(Registry.UID.mail_marker).instantiate()
	add_child(marker)
	
	marker.position.y = 1.5
