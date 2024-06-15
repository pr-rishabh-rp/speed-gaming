extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func new_game():
	$"Player-ish".start($StartPosition.position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	new_game()
