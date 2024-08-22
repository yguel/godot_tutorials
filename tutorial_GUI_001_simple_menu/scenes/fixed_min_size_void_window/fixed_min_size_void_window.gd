extends Node

func setup_for_fixed_size_to_minimum_size():
	# Get the root Control node
	var root_control_node = $"."
	
	# Ensure control_node is a valid Control node
	if root_control_node and root_control_node is Control:
		# Get the custom minimum size of the Control node
		var custom_min_size = root_control_node.custom_minimum_size
		
		# Set the window size to match the custom minimum size
		DisplayServer.window_set_min_size(custom_min_size)
		
		# Optionally, connect to the size_changed signal if you want to handle window resizing dynamically
		#get_tree().connect("screen_resized", _on_screen_resized )
		

func _on_screen_resized():
	var root_control_node = $"."
	# Enforce the minimum size
	var custom_min_size = root_control_node.custom_minimum_size
	var wanted_size = DisplayServer.window_get_size()
	var new_width = max(custom_min_size.x, wanted_size.x)
	var new_height = max(custom_min_size.y, wanted_size.y)
	if new_width != wanted_size.x or new_height != wanted_size.y:
		DisplayServer.window_set_size(Vector2(new_width, new_height))

# Called when the node enters the scene tree for the first time.
func _ready():
	GuiSizes.sizes_info_with_print()
	setup_for_fixed_size_to_minimum_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
