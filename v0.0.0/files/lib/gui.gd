var _methods = {}

func _init():
	_methods["Window"] = create_window
	_methods["Text"] = create_label
	_methods["add_content"] = add_content

# STARCH can't access members of external classes for basically no reason so uh
func add_content(window: OSWindow, child):
	window.add_content(child)

func create_window(position: Vector2 = Vector2.ZERO, size: Vector2 = Vector2(500, 500)):
	var window := OSWindow.new()
	WindowManager.get_root().add_child(window)
	window.position = position
	window.size = size
	return window

func create_label(text: String):	
	var label := Label.new()
	label.text = str(text)
	label.add_theme_color_override("font_color", Color.BLACK)
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	return label

