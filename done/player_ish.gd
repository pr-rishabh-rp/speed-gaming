extends Node2D
class_name Player

@export var speed: int = 0
@export var progress: int = 0
@export var direction = 1




var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = speed * 28 * delta
	direction = mysign(velocity.x)
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "default"
	if (speed == 0):
		print("He's just standing there, menacingly...")
		

		
#	if Input.is_action_pressed("jump"):
#		velocity.y = 10 * delta
	
#	while Input.is_action_pressed("move_right"):
#		if speed < 3:
#			progress += 1
		
#	while Input.is_action_pressed("move_left"):
#		if speed > -3: 
#			progress -= 1
			
#	if not Input.is_anything_pressed():
#		velocity.x -= 1
		
	_on_timer_timeout(delta)
	
	if (progress >= 227):
		if (speed < 3):
			speed += 1
			progress = 0
			
	if (progress <= -227):
		if (speed > -3):
			speed -= 1
			progress = 0
			


func _on_timer_timeout(delta):
	if Input.is_action_pressed("move_right"):
		if speed < 3:
			progress += 1

	if Input.is_action_pressed("move_left"):
		if speed > -3: 
			progress -= 1
			
	if not Input.is_anything_pressed():
		velocity.x -= 1 * delta
	
#	if Input.is_action_pressed("jump"):
#		velocity.y = -10 * delta
	
func mysign(fValue):
	if fValue < 0: 
		return "-1" #negative
	elif fValue > 0: 
		return "+1" #positive
	else:
		return "0" # zero  
		
func start(pos):
	position = pos
	show()
	$CharacterBody2D/CollisionPolygon2D.disabled = false
