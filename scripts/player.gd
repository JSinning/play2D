extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = 128
const FLOOR = Vector2(0, -2)
const GRAVITY = 16
const JUMP_HEIGHT = 384
onready var motion = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_axis() ->Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	# axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	motionCtrl()


func motionCtrl():
	motion.y += GRAVITY
	
	if get_axis().x == 1:
		$AnimatedSprite.flip_h = false
	elif get_axis().x == -1:
		$AnimatedSprite.flip_h = true
	
	
	if get_axis().x != 0:
		motion.x = get_axis().x * SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if get_axis().x != 0:
			$AnimatedSprite.play("run")
		else: 
			$AnimatedSprite.play("idle")
		
		
		if Input.is_action_just_pressed("ui_up"):
			$BGPlayer.play()
			motion.y -= JUMP_HEIGHT
		
		
		
	else:
		if motion.y < 0:
			$AnimatedSprite.play("jump")
	
	motion = move_and_slide(motion, FLOOR)
