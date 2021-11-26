extends Camera

# Throw strength
export(float) var strength = 10.0
# How fast do we rotate around the origin
export(float) var rotation_speed = 1.0
# Path to the object we will throw
export(NodePath) var ball

# current time from the script start in seconds
var t = 0
# distance to the origin
var dist = 0

func _ready():
    # save our distance to the origin
    dist = translation.length()


func _physics_process(delta):
    # rotate and look at the origin
    t += delta * rotation_speed
    translation = Vector3(cos(t), translation.y/dist, sin(t)) * dist
    transform = transform.looking_at(Vector3(0,0,0), Vector3(0,1,0))
    
    # throw if space was pressed
    if Input.is_action_just_pressed("ui_accept"):
        activate_throw()


func activate_throw():
    # get current position on the scene
    var position = transform.origin 
    # throw in the direction we are looking + 30 degrees up
    var direction = -transform.rotated(transform.basis.x, deg2rad(30.0)).basis.z
    
    # ask our object to teleport and throw itself
    var obj_phys = get_node(ball)
    obj_phys.sleeping = false
    obj_phys.throw_at(position, strength * direction)
