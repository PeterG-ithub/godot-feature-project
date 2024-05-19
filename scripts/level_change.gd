extends Area2D

var player_in_area = false

func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		print("player is here")

func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		print("player left")

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		print("interacted with next_level_portal: " + str(self))
		next_level()
		
func next_level():
	print("going to next level")
