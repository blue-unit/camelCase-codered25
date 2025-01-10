extends Camera2D

var zoomTarget : Vector2

var dragStartMousePos = Vector2.ZERO
var dragStartCameraPos = Vector2.ZERO
var isDragging : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#zoomTarget = zoom
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#Zoom()
	#click
	
func Zoom():
	if Input.is_action_just_pressed("Zoom_in"):
		zoom = zoom * 1.1
	
	if Input.is_action_just_pressed("Zoom_out"):
		zoom = zoom * 0.9 
