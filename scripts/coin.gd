extends Area2D

# Declare member variables here. Examples:
onready var active: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("idel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_coin_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("join")


func _on_AnimationPlayer_animation_started(anim_name):
	match anim_name:
		"join":
			print("join")
			if active:
				$BGCOIN.play()
				active = false
				


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"join":
			queue_free()
