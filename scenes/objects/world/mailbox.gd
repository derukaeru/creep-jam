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
	var matched_mail: Mail = find_mail()
	
	if matched_mail:
		submit_mail(matched_mail)
		animation.play("interact")
	
func find_mail() -> Mail:
	var player: Player = Util.get_player()
	if not player: return
	
	for mail: Mail in player.mails:
		if mail.mail_id == mail_id:
			return mail
	
	return null

func submit_mail(mail: Mail) -> void:
	var player: Player = Util.get_player()
	if not player: return
	
	player.mails.erase(mail)
	EventBus.delivered_mail.emit(mail.mail_id, mail.mail_name)
	
