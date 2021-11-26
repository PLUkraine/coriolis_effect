extends Spatial


func change_rotation_speed(value):
    $camera.rotation_speed = value

func change_strength(value):
    $camera.strength = value

func throw_ball():
    $camera.activate_throw()
