var _methods = {}
var _classes = {}
var graphics = load("user://potatofs/system/lib/graphics.gd")

func _init():
	_classes["Window"] = WindowWrapper
	_classes["Widget"] = Widget
	_classes["Text"] = Text
	_classes["Button"] = ButtonWidget
	_classes["ColourRect"] = ColourRect
	_classes["Container"] = ContainerWidget
	_classes["FlexBox"] = FlexBox

class WindowWrapper extends OSWindow:
	var _methods: Dictionary = {"add_content": _add_content, "title": title}
	
	func _init(position: Vector2 = Vector2.ZERO, size: Vector2 = Vector2(500, 500)):
		super()
		WindowManager.get_root().add_child(self)
		self.position = position
		self.size = size
	
	func _add_content(child):
		print("ADDING CONTENT (FROM GUI MODULE)")
		var real_child = child.unwrap() if child is GDScriptInstanceWrapper else child 
		self.add_content(real_child)
	
	func title(text):
		self.set_title(text)
		return self

class Widget extends Control:
	var _methods: Dictionary = {}
	var container_parent: bool = false
	
	func _init(): _methods["fill"] = fill; _methods["dock"] = dock; _methods["width"] = width; _methods["height"] = height; _methods["get_size"] = size; _methods["get_position"] = position; _methods["anchor_left"] = set_anchor_left; _methods["anchor_right"] = set_anchor_right; _methods["anchor_top"] = set_anchor_top; _methods["anchor_bottom"] = set_anchor_bottom; _methods["margin_all"] = margin_all; _methods["get_parent"] = parent; _methods["delete"] = delete
	func fill(): if container_parent: return self; set_anchors_preset(Control.PRESET_FULL_RECT); return self;
	func dock(side: int): if container_parent: return self; set_anchors_preset(Control.PRESET_TOP_WIDE if side == 0 else (Control.PRESET_LEFT_WIDE if side == 1 else (Control.PRESET_BOTTOM_WIDE if side == 2 else Control.PRESET_RIGHT_WIDE))); return self;
	func width(width: int): custom_minimum_size.x = width; return self;
	func height(height: int): custom_minimum_size.y = height; return self;
	func size(): return self.global_size;
	func position(): return self.global_position;
	
	func set_anchor_left(anchor: float): if container_parent: return self; set_anchor(SIDE_LEFT, anchor); return self;
	func set_anchor_right(anchor: float): if container_parent: return self; set_anchor(SIDE_RIGHT, anchor); return self;
	func set_anchor_top(anchor: float): if container_parent: return self; set_anchor(SIDE_TOP, anchor); return self;
	func set_anchor_bottom(anchor: float): if container_parent: return self; set_anchor(SIDE_BOTTOM, anchor); return self;

	func margin_all(margin: float): if container_parent: return self; set_anchor_and_offset(SIDE_TOP, anchor_top, margin); set_anchor_and_offset(SIDE_LEFT, anchor_left, margin); set_anchor_and_offset(SIDE_BOTTOM, anchor_bottom, -margin); set_anchor_and_offset(SIDE_RIGHT, anchor_right, -margin); return self;
	func expand(expand): if not container_parent: return self; var flag = SIZE_EXPAND_FILL if expand else SIZE_SHRINK_BEGIN; set_h_size_flags(flag); set_v_size_flags(flag); return self;

	func parent(): return get_parent()
	func delete(): queue_free()

class Text extends Widget:
	var _label: RichTextLabel
	
	func _init(): super(); _methods["text"] = text; _label = RichTextLabel.new(); _label.set_anchors_and_offsets_preset(PRESET_FULL_RECT); _label.bbcode_enabled = true; _label.text = "[font_size=][/font_size]"; add_child(_label);
	func text(text: String): _label.text = "[font_size=][color=black]%s[/color][/font_size]" % text; return self;
	func align(horizontally, vertically): _label.horizontal_alignment = horizontally; _label.vertical_alignment = vertically; return self;

class ButtonWidget extends Widget:
	var _button: Button
	
	func _init(): super(); _button = Button.new(); _button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER; _button.expand_icon = true; _button.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART; colour(Color.WHITE); add_child(_button); _button.set_anchors_and_offsets_preset(PRESET_FULL_RECT); _methods["text"] = text; _methods["image"] = image; _methods["flat"] = flat; _methods["colour"] = colour; _methods["font_size"] = font_size; _methods["font"] = font; _methods["on_click"] = on_click;
	func o(name, color): color = color if color is Color else color.unwrap(); _button.add_theme_color_override(name, color);

	func text(text: String): _button.text = text; return self;
	func image(image): image = image if image is Image else image.unwrap(); _button.icon = ImageTexture.create_from_image(image); return self;
	func flat(flat: bool): _button.flat = flat; return self;
	func colour(colour): colour = colour if colour is Color else colour.unwrap(); o("font_color", colour); o("font_focus_color", colour); o("font_pressed_color", colour); o("font_hover_color", colour); o("font_hover_pressed_color", colour); o("font_disabled_color", colour); return self;
	func font_size(size: int): _button.add_theme_font_size_override("font_size", size); return self;
	func font(path: String): var font = FontFile.new(); font.load_dynamic_font("user://potatofs".path_join(name)); _button.add_theme_font_override("font", font); return self;
	func on_click(callback): _button.pressed.connect(callback.bind([]))

class ColourRect extends Widget:
	var _rect: ColorRect

	func _init(): super(); _rect = ColorRect.new(); _rect.set_anchors_and_offsets_preset(PRESET_FULL_RECT); add_child(_rect); _rect.color = colour if colour is Color else colour.unwrap();
	func colour(colour): _rect.color = colour if colour is Color else colour.unwrap(); return self;
	func random(): _rect.color = Color(randf(), randf(), randf())

class ContainerWidget extends Widget:
	var _container: Control

	func _init(): super(); _container = Control.new(); add_child(_container); _container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); _methods["add"] = add; _methods["remove"] = remove;
	func add(child: Node): _container.add_child(child); return self;
	func remove(child: Node): _container.remove_child(child); return self;

class FlexBox extends ContainerWidget:
	func _init(): super(); _container = BoxContainer.new(); add_child(_container); _container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); _methods["gap"] = gap;
	
	func direction(direction): _container.vertical = direction.upper() == "VERTICAL"; return self;
	func gap(gap): _hbox.add_theme_constant_override("separation", gap); return self;
	func align(alignment): var align = alignment.upper(); "this could be lower but shouting is fun"; _container.alignment = BoxContainer.ALIGNMENT_END if alignment == "END" else (BoxContainer.ALIGNMENT_CENTER if alignment == "CENTER" else BoxContainer.ALIGNMENT_BEGIN); return self;
