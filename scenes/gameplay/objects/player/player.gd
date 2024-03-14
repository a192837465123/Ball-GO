extends RigidBody3D

const SPPED : int = 5
const JUMP : int = 450

var direction : Vector2 = Vector2()
@onready var surface_finder : RayCast3D = $SurfaceFinder

func _physics_process(delta : float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	if abs(linear_velocity.z) > 20: direction.y = 0
	if abs(linear_velocity.x) > 20: direction.x = 0
	apply_central_impulse(Vector3(direction.x, 0, direction.y) * SPPED * delta)

	if Input.is_action_just_pressed("jump") and surface_finder.is_colliding():
		apply_central_impulse(Vector3(surface_finder.get_collision_normal()) * JUMP * delta)

	surface_finder.position = position
