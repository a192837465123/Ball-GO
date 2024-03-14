extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta : float) -> void:
	$Scene/Marker3D.rotation_degrees.y += delta

func _on_play_button_down():
	get_tree().change_scene_to_file("res://scenes/gameplay/levels/level000.tscn")
