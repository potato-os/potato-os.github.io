_methods = []

func _init():
	_methods["Window"] = create_window
	_methods["Text"] = create_label

func create_window(position: Vector2 = Vector2.ZERO, size: Vector2 = Vector2(500, 500)):
	return OSWindow.new()

func create_label(content):
	var label := Label.new()
	label.text = content
	return label