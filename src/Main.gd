extends Control

enum Palettes {DARK, GRAY, BLUE, CARAMEL, LIGHT, PURPLE}

var theme_to_apply := theme.duplicate() as Theme
var theme_properties := {
	"Background": [
		ThemeProperty.new(&"normal", &"CelButton", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"hover", &"CelButton", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"guide", &"CelButton", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"panel", &"Panel", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"disabled", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"normal", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"pressed", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"ItemList", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"Tree", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"focus", &"LineEdit", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"normal", &"LineEdit", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"read_only", &"LineEdit", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"focus", &"TextEdit", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"normal", &"TextEdit", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"read_only", &"TextEdit", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"under_color", &"ValueSlider"),
		ThemeProperty.new(&"panel", &"PopupPanel", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"PopupMenu", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"tab_focus", &"TabBar", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"tab_selected", &"TabBar", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"tab_unselected", &"TabBar", Theme.DATA_TYPE_STYLEBOX, false, _darken.bind(0.3)),
		ThemeProperty.new(&"tab_focus", &"TabContainer", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"tab_selected", &"TabContainer", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"tab_unselected", &"TabContainer", Theme.DATA_TYPE_STYLEBOX, false, _darken.bind(0.3)),
		ThemeProperty.new(&"panel", &"TooltipPanel", Theme.DATA_TYPE_STYLEBOX),
	],
	"Primary": [
		ThemeProperty.new(&"normal", &"CelButton", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"PanelContainer", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"AcceptDialog", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"TabContainer", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"Tree", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"clear_color", &"Misc"),
	],
	"Secondary": [
		ThemeProperty.new(&"grabber", &"HScrollBar", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"grabber_pressed", &"HScrollBar", Theme.DATA_TYPE_STYLEBOX, false, _lighten.bind(0.2)),
		ThemeProperty.new(&"grabber_highlight", &"HScrollBar", Theme.DATA_TYPE_STYLEBOX, false, _lighten.bind(0.3)),
		ThemeProperty.new(&"grabber", &"VScrollBar", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"grabber_pressed", &"VScrollBar", Theme.DATA_TYPE_STYLEBOX, false, _lighten.bind(0.2)),
		ThemeProperty.new(&"grabber_highlight", &"VScrollBar", Theme.DATA_TYPE_STYLEBOX, false, _lighten.bind(0.3)),
		ThemeProperty.new(&"progress_color", &"ValueSlider"),
		ThemeProperty.new(&"hover", &"Button", Theme.DATA_TYPE_STYLEBOX, false, _halve_alpha),
		ThemeProperty.new(&"hover", &"CelButton", Theme.DATA_TYPE_STYLEBOX, false, _halve_alpha),
		ThemeProperty.new(&"hover", &"PopupMenu", Theme.DATA_TYPE_STYLEBOX, false, _halve_alpha),
		ThemeProperty.new(&"guide", &"CelButton", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"pressed", &"LayerFrameButton", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"selected", &"ItemList", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"selected_focus", &"ItemList", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"selected", &"Tree", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"selected_focus", &"Tree", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"disabled", &"RulerButton", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"focus", &"RulerButton", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"hover", &"RulerButton", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"normal", &"RulerButton", Theme.DATA_TYPE_STYLEBOX),
	],
	"Accent": [
		ThemeProperty.new(&"pressed", &"Button", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"pressed", &"CelButton", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"pressed", &"LayerFrameButton", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"focus", &"Button", Theme.DATA_TYPE_STYLEBOX, true, _change_brightness.bind(0.2)),
		ThemeProperty.new(&"focus", &"LineEdit", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"focus", &"TextEdit", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_focus", &"TabBar", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_selected", &"TabBar", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_focus", &"TabContainer", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_selected", &"TabContainer", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"panel", &"ItemList", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"font_focus_color", &"Button"),
		ThemeProperty.new(&"font_hover_color", &"Button"),
		ThemeProperty.new(&"font_hover_pressed_color", &"Button"),
		ThemeProperty.new(&"font_pressed_color", &"Button"),
		ThemeProperty.new(&"icon_normal_color", &"Button"),
		ThemeProperty.new(&"icon_pressed_color", &"Button", Theme.DATA_TYPE_COLOR, false, _lighten.bind(0.2)),
		ThemeProperty.new(&"icon_hover_pressed_color", &"Button", Theme.DATA_TYPE_COLOR, false, _lighten.bind(0.2)),
		ThemeProperty.new(&"icon_hover_color", &"Button", Theme.DATA_TYPE_COLOR, false, _lighten.bind(0.3)),
		ThemeProperty.new(&"font_hover_color", &"PopupMenu"),
		ThemeProperty.new(&"font_pressed_color", &"MenuButton"),
		ThemeProperty.new(&"font_hover_color", &"MenuButton"),
		ThemeProperty.new(&"font_pressed_color", &"MenuBar"),
		ThemeProperty.new(&"font_hover_color", &"MenuBar"),
		ThemeProperty.new(&"font_hovered_color", &"ItemList"),
		ThemeProperty.new(&"modulate_color", &"Icons"),
		ThemeProperty.new(&"panel", &"TooltipPanel", Theme.DATA_TYPE_STYLEBOX, true),
	],
	"Accent #2": [
		ThemeProperty.new(&"pressed", &"CelButton", Theme.DATA_TYPE_STYLEBOX),
	],
	"Text color": [
		ThemeProperty.new(&"font_color", &"Button"),
		ThemeProperty.new(&"font_color", &"MenuButton"),
		ThemeProperty.new(&"font_color", &"MenuBar"),
		ThemeProperty.new(&"font_color", &"PopupMenu"),
		ThemeProperty.new(&"font_color", &"OptionButton"),
		ThemeProperty.new(&"font_color", &"ProgressBar"),
		ThemeProperty.new(&"font_color", &"Label"),
		ThemeProperty.new(&"font_color", &"LineEdit"),
		ThemeProperty.new(&"font_color", &"TextEdit"),
		ThemeProperty.new(&"font_color", &"ItemList"),
		ThemeProperty.new(&"font_color", &"Tree"),
		ThemeProperty.new(&"font_selected_color", &"TabBar"),
		ThemeProperty.new(&"font_unselected_color", &"TabBar"),
		ThemeProperty.new(&"font_selected_color", &"TabContainer"),
		ThemeProperty.new(&"font_unselected_color", &"TabContainer"),
		ThemeProperty.new(&"title_color", &"Window"),
		ThemeProperty.new(&"font_color", &"TooltipLabel"),
		ThemeProperty.new(&"font_disabled_color", &"Button", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"icon_disabled_color", &"Button", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"MenuButton", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"MenuBar", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"PopupMenu", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"OptionButton", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"PopupMenu", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_uneditable_color", &"LineEdit", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_uneditable_color", &"TextEdit", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"TabBar", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
		ThemeProperty.new(&"font_disabled_color", &"TabContainer", Theme.DATA_TYPE_COLOR, false, _halve_alpha),
	],
	"Window border": [
		ThemeProperty.new(&"embedded_border", &"Window", Theme.DATA_TYPE_STYLEBOX),
	]
}
## Background, Primary, Secondary, Accent, Accent #2, Text, Window border
var palettes: Array[PackedColorArray] = [
	[Color("171717"), Color("242424"), Color("3b3b3b"), Color("c0c0c0"), Color("999999"), Color("c6c6c6"), Color("525252")],  # Dark
	[Color("333339"), Color("2e2e34"), Color("4f5065"), Color("a7b2ea"), Color("76768b"), Color("9192b8"), Color("22222e")],  # Gray
	[Color("47526e"), Color("333b4f"), Color("262c3b"), Color("92a8e0"), Color("7182ad"), Color("a3aaeb"), Color("2b303d")],  # Blue
	[Color("b16832"), Color("cf874d"), Color("ce7c40"), Color("ffcd86"), Color("d88141"), Color("f8cc9d"), Color("995d42")],  # Caramel
	[Color("e7f1f7"), Color("dbe4f0"), Color("aaccf8"), Color("484b68"), Color("afc4de"), Color("497199"), Color("90afca")],  # Light
	[Color("433057"), Color("623b78"), Color("7a4d8e"), Color("d093dd"), Color("9e66b5"), Color("ae72d0"), Color("3d2446")],  # Purple
	[Color("a53753"), Color("c85676"), Color("df6f89"), Color("f69bb2"), Color("c14d68"), Color("c6c6c6"), Color("61283d")],  # Rose
]
@onready var grid_container := %GridContainer as GridContainer
@onready var palette_option_button := %PaletteOptionButton as OptionButton
@onready var theme_name_line_edit := %ThemeNameLineEdit as LineEdit
@onready var path_line_edit := %PathLineEdit as LineEdit


class ThemeProperty:
	var data_type: Theme.DataType
	var name := &""
	var theme_type := &""
	var border := false
	var method := Callable()

	func _init(
			_name: StringName,
			_theme_type: StringName,
			_data_type := Theme.DATA_TYPE_COLOR,
			_border := false,
			_method := Callable()
		) -> void:
		name = _name
		theme_type = _theme_type
		data_type = _data_type
		border = _border
		method = _method

	func set_color(theme: Theme, color: Color) -> void:
		if method.is_valid():
			color = method.call(color)
		if data_type == Theme.DATA_TYPE_COLOR:
			theme.set_color(name, theme_type, color)
		elif data_type == Theme.DATA_TYPE_STYLEBOX:
			var stylebox := theme.get_stylebox(name, theme_type)
			if not is_instance_valid(stylebox):
				stylebox = StyleBoxFlat.new()
			if stylebox is StyleBoxFlat:
				if border:
					stylebox.border_color = color
				else:
					stylebox.bg_color = color
			elif stylebox is StyleBoxLine:
				stylebox.color = color
			theme.set_stylebox(name, theme_type, stylebox)

	func get_color(theme: Theme) -> Color:
		if data_type == Theme.DATA_TYPE_COLOR:
			return theme.get_color(name, theme_type)
		elif data_type == Theme.DATA_TYPE_STYLEBOX:
			var stylebox := theme.get_stylebox(name, theme_type)
			if stylebox is StyleBoxFlat:
				if border:
					return stylebox.border_color
				return stylebox.bg_color
			elif stylebox is StyleBoxLine:
				return stylebox.color
		return Color.BLACK


func _ready() -> void:
	theme = theme_to_apply
	for color_group: String in theme_properties.keys():
		var properties: Array = theme_properties[color_group]
		var first_property: ThemeProperty = properties[0]
		var label := Label.new()
		label.text = color_group
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var color_picker := ColorPickerButton.new()
		color_picker.name = color_group + "ColorPicker"
		color_picker.color = first_property.get_color(theme_to_apply)
		color_picker.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		color_picker.color_changed.connect(color_changed.bind(properties))
		grid_container.add_child(label)
		grid_container.add_child(color_picker)
		color_changed(color_picker.color, properties)


func color_changed(color: Color, properties: Array) -> void:
	for prop: ThemeProperty in properties:
		prop.set_color(theme_to_apply, color)


func _on_save_file_button_pressed() -> void:
	theme_to_apply.resource_name = theme_name_line_edit.text
	ResourceSaver.save(theme_to_apply, "user://theme.tres")


func _on_save_to_path_pressed() -> void:
	var path := path_line_edit.text
	if path.is_empty():
		return
	var theme_name := theme_name_line_edit.text
	var dir := DirAccess.open(path)
	if not is_instance_valid(dir):
		return
	var theme_directory := path.path_join(theme_name.to_lower())
	if not DirAccess.dir_exists_absolute(theme_directory):
		DirAccess.make_dir_absolute(theme_directory)
	theme_to_apply.resource_name = theme_name
	ResourceSaver.save(theme_to_apply, theme_directory.path_join("theme.tres"))


func _invert_color(color: Color) -> Color:
	return color.inverted()


func _halve_alpha(color: Color) -> Color:
	var new_color := color
	new_color.a /= 2.0
	return new_color


func _change_brightness(color: Color, amount: float) -> Color:
	if color.v > 0.5:
		return _darken(color, amount)
	return _lighten(color, amount)


func _lighten(color: Color, amount: float) -> Color:
	return color.lightened(amount)


func _darken(color: Color, amount: float) -> Color:
	return color.darkened(amount)


func _on_palette_option_button_item_selected(index: int) -> void:
	theme_name_line_edit.text = palette_option_button.get_item_text(index)
	var i := 0
	for child in grid_container.get_children():
		if not child is ColorPickerButton:
			continue
		(child as ColorPickerButton).color = palettes[index][i]
		(child as ColorPickerButton).color_changed.emit(palettes[index][i])
		i += 1
