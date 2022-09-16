class_name Hand
extends Node

var current_hand_size: int = 5
@export var max_hand_size: int: int = 5
@export var hand_size_text_template: String: String = "Hand Size: %s/%s"

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_hand_size_text()

func generate_hand_size_text() -> void:
	$UI_hand_size.set_text(hand_size_text_template % [current_hand_size, max_hand_size])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
