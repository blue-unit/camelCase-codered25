extends Label

@onready var data = get_parent().get_parent().get_child(1)

func _ready():
	purchase(0)

func purchase(val):
	var pts = data.loadpoints()
	pts -= val
	text = str(pts)
	data.savepoints(pts)

func reload():
	var pts = data.loadpoints()
	return pts
