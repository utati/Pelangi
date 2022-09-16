extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _runner: Player
func get_runner() -> Player:
	return _runner

var _corp: Player
func get_corp() -> Corp:
	return _corp
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
