extends Node


func _ready():
    """
    Connect UI signals to the coriolis_scene
    """
    $ui.connect("strength_changed", $coriolis_scene, "change_strength")
    $ui.connect("rotation_speed_changed", $coriolis_scene, "change_rotation_speed")
    $ui.connect("throw_ball", $coriolis_scene, "throw_ball")
