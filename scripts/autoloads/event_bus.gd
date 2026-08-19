extends Node

signal changed_map(prev_map_id: String, map_id: String)
signal go_to_map(map_id: String, outside: bool)

signal player_can_move(is_outside: bool)
signal player_not_move

signal set_camera(pivot: Vector3, position: Vector3, rotation: Vector3, follow_player: bool)

signal change_env_background_color(color: Color)
signal change_env_fog_color(color: Color)
signal change_env_fog_density(value: float)

signal add_entities(node: Node3D)

signal recieved_mail(mail_id: String, mail_name: String)
signal delivered_mail(mail_id: String, mail_name: String)
