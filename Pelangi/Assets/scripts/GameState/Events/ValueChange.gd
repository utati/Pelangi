class_name ValueChange
extends GameEvent

var previous_value: int
var new_value: int
func get_value_delta() -> int:
	return new_value-previous_value

#Make this based unchecked enum?
var target_value: int
