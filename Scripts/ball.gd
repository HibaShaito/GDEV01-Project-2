extends RigidBody3D

var fell=false
var original_position:Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	original_position=position
	update_UI()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#add extra safety using toggle function
	if position.y < -5 && not fell:
		fell=true
		die()

func die():
	if PlayerStat.lives >1:
		PlayerStat.lives-=1
		respawn()
	else:
		PlayerStat.lives-=1
		get_tree().change_scene_to_file.bind("res://Scenes/game_over.tscn").call_deferred()
	update_UI()
		
	
func respawn():
	position=original_position
	linear_velocity=Vector3.ZERO
	angular_velocity=Vector3.ZERO
	fell=false

func update_UI():
	$CanvasLayer/Control/Lives.text="Lives: "+ str(PlayerStat.lives)
	
