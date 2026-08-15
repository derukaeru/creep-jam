extends Node

signal changed_map(prev_map_id: String, map_id: String)
signal go_to_map(map_id: String)

signal player_can_move
signal player_not_move

signal set_camera(camera: Camera3D)

signal change_env_background_color(color: Color)
signal change_env_fog_color(color: Color)
signal change_env_fog_density(value: float)

signal add_entities(node: Node3D)

signal recieved_mail(mail_id: String, mail_name: String)
signal delivered_mail(mail_id: String, mail_name: String)
