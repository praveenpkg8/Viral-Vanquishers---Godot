extends CharacterBody2D
@export var health: int = 100 :
	set = _set_hp

signal died
signal hp_changed(new_hp: int)

func _set_hp(val):
	if val !=  health:
		health = clamp(val, 0, 100)
		
		if health <= 100:
			emit_signal("died")
		else:
			emit_signal("hp_changed", health)
