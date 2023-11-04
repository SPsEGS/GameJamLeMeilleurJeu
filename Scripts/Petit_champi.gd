extends Area2D




func _on_body_entered(body):
	$AnimationPlayer.play("flashing")


func _on_body_exited(body):
	$AnimationPlayer.stop()
