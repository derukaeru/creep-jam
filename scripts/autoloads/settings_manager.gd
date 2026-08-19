extends Node

var sound_effect_strength: float = 0.5
var music_strength: float = 0.5

var fullscreen: bool = false

func set_sfx(value: float) -> void:
	sound_effect_strength = value

func set_music(value: float) -> void:
	music_strength = value

func set_fullscreen(value: bool) -> void:
	fullscreen = value
