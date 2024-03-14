extends Node3D

@export var target : Node

@onready var rotation_marker : Marker3D = $Rotation
@onready var position_marker : Marker3D = $Position
@onready var wall_finder : RayCast3D = $WallFinder
@onready var camera : Camera3D = $Camera

const FOLLOW_SPEED : int = 4
const ROTATION_SPEED : int = 2

const CLIPPED_SPEED : int = 16
const FIX_CLIPPED_DISTANCE : float = 1.0125
const UNCLIPPED_SPEED : int = 2

func _physics_process(delta : float) -> void:
	if target == null:
		return

	position = lerp(position, target.position, FOLLOW_SPEED * delta)
	camera.rotation_degrees = lerp(camera.rotation_degrees, rotation_marker.rotation_degrees, ROTATION_SPEED * delta)
	rotation_marker.look_at(target.position)

	if wall_finder.is_colliding(): 
		camera.global_transform.origin = lerp(
			camera.global_transform.origin, wall_finder.get_collision_point() / FIX_CLIPPED_DISTANCE, CLIPPED_SPEED * delta)
	else:
		camera.global_transform.origin = lerp(
			camera.global_transform.origin, position_marker.global_transform.origin, UNCLIPPED_SPEED * delta)
