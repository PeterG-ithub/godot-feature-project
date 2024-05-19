extends Area2D

@export_enum("Interact", "Proximity") var sign_type: String

var player_in_area = false

const MOSSY_SIGN_INT = preload("res://assets/Mossy Tileset/mossy-sign-int.png")
const MOSSY_SIGN = preload("res://assets/Mossy Tileset/mossy-sign.png")

@onready var label = $Label
@onready var sign_sprite = $SignSprite

func _ready():
	label.visible = false
	if sign_type == "Interact":
		sign_sprite.texture = MOSSY_SIGN_INT
		label.text = "Intneract Sign:\nI think a sign is a feature?"
	else:
		sign_sprite.texture = MOSSY_SIGN
		label.text = "Proximity Sign:\nis a sign a feature?"

func _on_body_entered(body):
	print(body.name)
	if body.name == "Player":
		player_in_area = true
		print("player is here")
	if sign_type == "Proximity":
		label.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		print("player left")
		label.visible = false

func _process(delta):
	if sign_type == "Interact":
		if player_in_area and Input.is_action_just_pressed("interact"):
			label.visible = not label.visible
			print("interacted with sign " + str(self))
