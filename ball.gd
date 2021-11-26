extends RigidBody


# velocity and position data for the throw event
var _throw_data: Dictionary = {}


func _integrate_forces(state: PhysicsDirectBodyState):
    """
    Teleport object to the position and apply the given force
    """
    
    # ignore if we have already thrown the object
    if not _throw_data:
        return
    
    # stop rotation and movement
    state.angular_velocity = Vector3.ZERO
    state.linear_velocity = Vector3.ZERO
    
    # teleport and apply force
    state.transform.origin = _throw_data.pos
    state.linear_velocity = _throw_data.force
    
    # make sure we don't do this again
    _throw_data = {}


func throw_at(pos: Vector3, force: Vector3):
    """
    Prepare object to be thrown at the next physics update
    """
    _throw_data = {
        "pos": pos,
        "force": force,
    }
