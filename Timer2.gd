extends Timer

@onready var but = $"../commute"
@onready var countdown = $"../Label2"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time_left >0:
		countdown.text = str(int(time_left))
	else:
		countdown.text = ""
		

func _on_timeout():
	but.disabled = false
	print("stopped") 
