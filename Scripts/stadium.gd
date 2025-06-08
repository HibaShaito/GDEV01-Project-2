extends StaticBody3D

var original_rotation: Vector3
var rotation_speed=2.5
var return_speed=5

var shouldReturn:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	original_rotation=rotation


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shouldReturn= true
	if Input.is_action_pressed("up"):
		rotation.x-=rotation_speed*delta;
		shouldReturn= false
	if Input.is_action_pressed("down"):
		rotation.x+=rotation_speed*delta;
		shouldReturn= false
	if Input.is_action_pressed("right"):
		rotation.z-=rotation_speed*delta;
		shouldReturn= false
	if Input.is_action_pressed("left"):
		rotation.z+=rotation_speed*delta;
		shouldReturn= false
	if shouldReturn:
		rotation=lerp(rotation,original_rotation,return_speed*delta)
	
	
	
