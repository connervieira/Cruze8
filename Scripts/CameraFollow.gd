extends Spatial

var car = Node
var camera_follow_point = Node

var follow_offset = Vector3(0, 3.5, -5) # Where the camera is in relation to the car. Vector3(0,0,0) means the camera is in the center of the car.

# Called when the node enters the scene tree for the first time.
func _ready():
	car = get_parent().get_node("Car")
	camera_follow_point = car.get_node("CameraFollowPoint")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_translation(get_translation().linear_interpolate(camera_follow_point.get_translation(), delta * 4)) # Have the camera smoothly follow behind the car, visually emphasizing it's speed through it's distance from the car.
	#set_translation(car.get_translation() + follow_offset)
	self.look_at(car.get_translation(), Vector3(0,1,0)) # Have the camera look at the car.
