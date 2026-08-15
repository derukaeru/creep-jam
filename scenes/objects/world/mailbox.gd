class_name Mailbox extends InteractableComponent
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var model_container: Node3D = $model_container
@onready  var interact_bubble: InteractBubble = $interact_bubble

@export var mail_id: String = ""

func _ready() -> void:
	body_entered.connect(
		func(body) -> void: 
			if body is Player:
				interact_bubble.show()
	)
	body_exited.connect(
		func(body) -> void:
			if body is Player:
				interact_bubble.hide()
	)

func _on_interacted() -> void:
	# check if player has mail with the same id
	animation.play("interact")
	
