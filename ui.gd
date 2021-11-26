extends Control


signal strength_changed(new_value)
signal rotation_speed_changed(new_value)
signal throw_ball()


# Called when the node enters the scene tree for the first time.
func _ready():
    $background/VBoxContainer/speed/HSlider.connect("value_changed", self, "on_rs_changed")
    $background/VBoxContainer/strength/HSlider.connect("value_changed", self, "on_str_changed")
    $background/VBoxContainer/throw_button.connect("pressed", self, "on_throw")


func on_rs_changed(value):
    emit_signal("rotation_speed_changed", value)
    
func on_str_changed(value):
    emit_signal("strength_changed", value)
    
func on_throw():
    emit_signal("throw_ball")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
