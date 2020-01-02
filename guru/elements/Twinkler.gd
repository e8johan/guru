extends Node2D

func _ready() -> void:
    var rng = RandomNumberGenerator.new()
    rng.randomize()
    
    var timer = Timer.new()
    timer.set_wait_time(rng.randf_range(5.0, 30.0))
    timer.set_one_shot(false)
    timer.connect("timeout", self, "_do_twinkle")
    add_child(timer)
    timer.start()
    
    $twinkle.visible = false

func _do_twinkle() -> void:
    $AnimationPlayer.play("twinkle")

