extends Node2D

@onready var spawner = $Spawner
@onready var spawner_timer = $Spawner/Timer
@onready var debug_label___for_testing = $"CanvasLayer/DebugLabel | For testing"
@onready var pause_menu = $PauseMenu

var VIRUS = preload("res://scence/collectables/virus_essence/virus_essence.tscn")

var can_spawn: bool = true

func _ready():
	GlobalSignals.connect('picked_up_collectable', add_cd_to_spawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_and_spawn_virus()
	if Input.is_action_just_pressed("pause"):
		pause()

func check_and_spawn_virus():
	if spawner.get_child_count() <= 10 and can_spawn:
		spawn_viruses()

func spawn_viruses():
	var screen = get_viewport().get_visible_rect().size
	var position = Vector2(randf_range(0, screen.x), randf_range(0, screen.y))
	var virus = VIRUS.instantiate()
	virus.position = position
	spawner.add_child(virus)

func add_cd_to_spawn(val: float):
	can_spawn = false
	spawner_timer.start()


func _on_timer_timeout():
	can_spawn = true

func pause():
	get_tree().paused = true
	pause_menu.show()
	

func unpause():
	get_tree().paused = false
	pause_menu.hide()


func _on_continue_pressed():
	unpause()
