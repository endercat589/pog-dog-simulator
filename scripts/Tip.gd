extends Area2D

export(String, MULTILINE) var text = "Use WASD or the arrow keys to move"
export(bool) var display_on_load = false

var is_shown = false

func _ready():
	$Label.text = text
	
	if display_on_load and not is_shown:
		$AnimationPlayer.play("fade_in")
		is_shown = true

func _on_entered(body):
	if body.is_in_group("Player") and not is_shown:
		$AnimationPlayer.play("fade_in")
		is_shown = true

func _on_exited(body):
	if body.is_in_group("Player") and is_shown:
		$AnimationPlayer.play("fade_out")
		is_shown = false
