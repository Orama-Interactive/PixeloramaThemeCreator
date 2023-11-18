extends Control

var theme_to_apply := theme.duplicate() as Theme
var theme_properties := {
	"Primary": [
		ThemeProperty.new(&"panel", &"Panel"),
		ThemeProperty.new(&"disabled", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"focus", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"hover", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"normal", &"Button", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"bg", &"Tree", Theme.DATA_TYPE_STYLEBOX),
	],
	"Secondary": [
		ThemeProperty.new(&"panel", &"PanelContainer", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"panel", &"TabContainer", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"clear_color", &"Misc"),
	],
	"Accent": [
		ThemeProperty.new(&"pressed", &"Button", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"focus", &"LineEdit", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"focus", &"TextEdit", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_focus", &"TabBar", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_selected", &"TabBar", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_focus", &"TabContainer", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"tab_selected", &"TabContainer", Theme.DATA_TYPE_STYLEBOX, true),
		ThemeProperty.new(&"selected", &"Tree", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"selected_focus", &"Tree", Theme.DATA_TYPE_STYLEBOX),
		ThemeProperty.new(&"font_hover_pressed_color", &"Button"),
		ThemeProperty.new(&"font_pressed_color", &"Button"),
		ThemeProperty.new(&"icon_color_pressed", &"Button"),
		ThemeProperty.new(&"modulate_color", &"Icons"),
		ThemeProperty.new(&"progress_color", &"ValueSlider"),
	],
	"Text color": [
		ThemeProperty.new(&"font_color", &"Button"),
	],
}

@onready var grid_container := %GridContainer as GridContainer
@onready var theme_preview: Panel = %ThemePreview


class ThemeProperty:
	var data_type: Theme.DataType
	var name := &""
	var theme_type := &""
	var border := false

	func _init(
		_name: StringName, _theme_type: StringName, _data_type := Theme.DATA_TYPE_COLOR, _border := false
		) -> void:
		name = _name
		theme_type = _theme_type
		data_type = _data_type
		border = _border

	func set_color(theme: Theme, color: Color) -> void:
		if data_type == Theme.DATA_TYPE_COLOR:
			theme.set_color(name, theme_type, color)
		elif data_type == Theme.DATA_TYPE_STYLEBOX:
			var stylebox := theme.get_stylebox(name, theme_type)
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
	theme_preview.theme = theme_to_apply
	for color_group: String in theme_properties.keys():
		var properties: Array = theme_properties[color_group]
		var first_property: ThemeProperty = properties[0]
		var label := Label.new()
		label.text = color_group
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var color_picker := ColorPickerButton.new()
		color_picker.color = first_property.get_color(theme_to_apply)
		color_picker.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		color_picker.color_changed.connect(color_changed.bind(properties))
		grid_container.add_child(label)
		grid_container.add_child(color_picker)


func color_changed(color: Color, properties: Array) -> void:
	for prop: ThemeProperty in properties:
		prop.set_color(theme_to_apply, color)


func _on_apply_button_pressed() -> void:
	pass
	#for color_group: String in theme_properties.keys():
		#for prop: ThemeProperty in theme_properties[color_group]:
			#prop.set_color(theme_to_apply)
