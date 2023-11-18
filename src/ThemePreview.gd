@tool
extends Panel

@onready var tree: Tree = $MarginContainer/HBoxContainer/VBoxContainer2/Tree

func _ready() -> void:
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
