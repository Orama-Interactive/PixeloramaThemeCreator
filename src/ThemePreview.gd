@tool
extends Panel

@onready var tab_container: TabContainer = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/TabContainer
@onready var popup_window: Button = $MarginContainer/VBoxContainer/HBoxContainer/Buttons/PopupWindow
@onready var tree: Tree = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/Tree
@onready var accept_dialog: AcceptDialog = $AcceptDialog


func _ready() -> void:
	tab_container.set_tab_disabled(2, true)
	popup_window.pressed.connect(func(): accept_dialog.popup_centered())
	var root := tree.create_item()
	root.set_text(0, "Tree")
	var child1 := tree.create_item(root)
	child1.set_text(0, "Item")
	var child2 := tree.create_item(root)
	child2.set_editable(0, true)
	child2.set_text(0, "Editable Item")
	var subtree := tree.create_item(root)
	subtree.set_text(0, "Subtree")
	var check_item := tree.create_item(subtree)
	check_item.set_cell_mode(0, TreeItem.CELL_MODE_CHECK)
	check_item.set_editable(0, true)
	check_item.set_text(0, "Check Item")
	var range_item := tree.create_item(subtree)
	range_item.set_cell_mode(0, TreeItem.CELL_MODE_RANGE)
	range_item.set_editable(0, true)
	range_item.set_range(0, 2)
