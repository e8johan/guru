extends Node2D

onready var lampOrigin = $LampOrigin.position
onready var lampParent = $Lamps
onready var lampTemplate = preload("res://elements/Lamp.tscn")

func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.pressed == false:
            _spawn_lamp()
        
func _spawn_lamp() -> void:
    var lamp = lampTemplate.instance()
    lamp.position = lampOrigin
    lamp.origin = lampOrigin
    lampParent.add_child(lamp)