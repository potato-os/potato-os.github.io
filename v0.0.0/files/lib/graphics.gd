var _classes = {
	"Colour": ColorWrapper,
	"Image": ImageWrapper
}

class ColorWrapper:
	var _color: Color
	var _methods = {"code": code}

	func _init(r=null, g=null, b=null, a=null):
		if r is String:
			_color = Color(r)
		elif r is Color:
			_color = r
		elif r != null and g != null and b != null:
			_color = Color(r, g, b, a if a != null else 1.0)
		else:
			_color = Color(0, 0, 0, 0)
	func unwrap(): return _color

class ImageWrapper:
	var _image: Image
	var _methods = {"file": file}

	func _init(path): var base = OS.get_user_data_dir().path_join("potatofs"); var new_path = base.path_join(path).simplify_path(); _image = Image.new().load(new_path) if new_path.begins_with(base) else null
	func unwrap(): return _image