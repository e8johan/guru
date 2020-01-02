extends Node2D

var speedX : float = 10
var speedY : float = 100
var amplitude : float = 100
var amplitudeChange : float = 10
var frequency : float = 100
var scaleFactor : float = 10

var time : float = 0
var origin : Vector2

func _ready() -> void:
    var rng = RandomNumberGenerator.new()
    rng.randomize()
    
    speedX = rng.randf_range(-30.0, 30.0)
    speedY = rng.randf_range(50.0, 250.0)
    amplitude = rng.randf_range(50.0, 200.0)
    amplitudeChange = rng.randf_range(-5.0, 5.0)
    frequency = rng.randf_range(10.0, 300.0)
    scaleFactor = rng.randf_range(2.0, 20.0)

func _process(delta: float) -> void:
    time += delta
    
    self.position.y = origin.y - speedY * time
    self.position.x = origin.x + sin(time*frequency/360) * amplitude + speedX * time
    
    self.scale.x = 1.0 / (1+time*scaleFactor/100)
    self.scale.y = self.scale.x
    
    amplitude -= amplitudeChange*delta
    
    if self.position.y < -160:
        queue_free()