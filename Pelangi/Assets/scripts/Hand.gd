class_name Hand
extends Node3D

const Card = preload("res://Assets/Scenes/Card.gd")
var DebugDraw

var current_hand_size: int = 5
@export var max_hand_size: int = 5
@export var hand_size_text_template: String = "Hand Size: %s/%s"
var hand_curve: Path3D
var cards_in_hand: Array[Card]

# Called when the node enters the scene tree for the first time.
func _ready():
	DebugDraw = get_node("/root/DebugDraw")
	hand_curve = $HandCurve
	cards_in_hand = loadCards()
	generate_hand_size_text()

func generate_hand_size_text() -> void:
	$UI_hand_size.set_text(hand_size_text_template % [current_hand_size, max_hand_size])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setCardPositions()
	
func setCardPositions():
	var curve_segment_size = 1.0/cards_in_hand.size()
	print("START")
	for i in cards_in_hand.size():
		var curve_sample = hand_curve.curve.sample_baked(((curve_segment_size * i)+(curve_segment_size/2)) * hand_curve.curve.get_baked_length(),true)
		
		cards_in_hand[i].position = curve_sample
		var look_vec = global_position
		look_vec.y = cards_in_hand[i].global_position.y
		cards_in_hand[i].look_at(look_vec, Vector3(0,1,0))
		print(cards_in_hand[i].rotation)
		DebugDraw.draw_line_3d(self.position, curve_sample + hand_curve.global_position, Color.GREEN_YELLOW)

func loadCards() -> Array[Card]:
	var cards: Array[Card]
	for child in get_children():
		if child is Card:
			cards.append(child)
	return cards
