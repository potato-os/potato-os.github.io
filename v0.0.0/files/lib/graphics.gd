var _classes = {
	"Colour": ColorWrapper,
	"Image": ImageWrapper
}

class ColorWrapper:
	var _color: Color
	var _methods = {"code": code}

	func _init(r, g, b, a): _color = Color(r, g, b, a)
	func code(code): var result = ColorWrapper.new(0, 0, 0, 0); result._color = Color(code); return result

class ImageWrapper:
	var _image: Image
	var _methods = {"file": file}

	func _init(): _image = Image.new()
	func file(path): var base = OS.get_user_data_dir().path_join("potatofs"); var new_path = base.path_join(path).simplify_path(); return Image.new().load(new_path) if new_path.begins_with(base) else null