extends Node

var m_container_cached_min_size

func _setup_sizes():
	# Get the root Control node
	var top_container = $"TopContainer"
	
	# Ensure the root node is a valid Control node
	if top_container and top_container is Container:
		# Get the custom minimum size of the Container
		var min_size = top_container.get_minimum_size()
		if(min_size != m_container_cached_min_size):
			print("Set minimum window size: ", min_size)
			m_container_cached_min_size = min_size
			# Set the window size to match the custom minimum size
			DisplayServer.window_set_min_size(min_size)

# Called when the node enters the scene tree for the first time.
func _ready():
	GuiSizes.sizes_info_with_print()
	_setup_sizes()
	get_tree().get_root().size_changed.connect(_setup_sizes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
