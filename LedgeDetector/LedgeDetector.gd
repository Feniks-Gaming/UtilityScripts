class_name LedgeDetector
extends Node2D

## Checks if there is a wall with the floor above to climb onto
## If there is one emits signal ledge detected
## LedgeDetector should be connected to whatever scripts deals with falling 
## of the character. 
##
## is_detecting should only be set to true when falling to avoid player 
##trying to climb blocks he can just jump over

var is_detecting: bool
signal ledge_detected

onready var wall_ray:RayCast2D = $WallRay 
onready var climb_blocked:RayCast2D = $ClimbBlockedRay

func _process(delta: float) -> void:
	if is_detecting:
		if _is_there_empty_space_to_climb_to():
			if _is_there_a_ledge_to_grab():
				emit_signal("ledge_detected")


func _is_there_empty_space_to_climb_to() -> bool:
	if climb_blocked.is_colliding() == false:
		return true
	else: 
		return false

func _is_there_a_ledge_to_grab() -> bool:
	if wall_ray.is_colliding():
		return true
	else:
		return false
