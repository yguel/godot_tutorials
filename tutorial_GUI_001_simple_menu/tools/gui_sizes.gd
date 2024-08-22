extends Node

func sizes_info(screen_index: int = -1):
	# Get the size of the screen in pixels
	var screen_size_pixels = DisplayServer.screen_get_size(screen_index)
	#
	# Get the DPI (dots per inch) of the screen
	var dpi = DisplayServer.screen_get_dpi(screen_index)
	#
	# Calculate the physical size in inches
	var screen_size_inches = screen_size_pixels / dpi
	#
	# Provide the size in mm
	var m1_inch2mm = 25.4
	var screen_size_mm = screen_size_inches * m1_inch2mm
	# Window size in pixels
	var window_size = DisplayServer.window_get_size()
	var pixel_to_mm = screen_size_mm.x / screen_size_pixels.x
	var window_size_mm = window_size * pixel_to_mm
	return {
		"screen": {
		"size_pixels": screen_size_pixels,
		"size_mm": screen_size_mm
		},
		"window": {
		"size_pixels": window_size,
		"size_mm": window_size_mm
		}
	}

func sizes_info_with_print(screen_index: int = -1):
	# Get the size of the screen in pixels
	var screen_size_pixels = DisplayServer.screen_get_size(screen_index)
	print("Screen size in pixels: ", screen_size_pixels)
	#
	# Get the DPI (dots per inch) of the screen
	var dpi = DisplayServer.screen_get_dpi(screen_index)
	print("Screen DPI: ", dpi)
	#
	# Calculate the physical size in inches
	var screen_width_inches = screen_size_pixels.x / dpi
	var screen_height_inches = screen_size_pixels.y / dpi
	#
	# Provide the size in mm
	var m1_inch2mm = 25.4
	var screen_width_mm = screen_width_inches * m1_inch2mm
	var screen_height_mm = screen_height_inches * m1_inch2mm
	print("Screen width in mm: ", screen_width_mm)
	print("Screen height in mm: ", screen_height_mm)
	var screen_size_mm = Vector2(screen_width_mm, screen_height_mm)
	# Window size in pixels
	var window_size = DisplayServer.window_get_size()
	print("Window width in pixels: ", window_size.x)
	print("Window height in pixels: ", window_size.y)
	var pixel_to_mm = screen_width_mm / screen_size_pixels.x
	print("Pixel size in mm: %0.2f" % pixel_to_mm)
	var window_size_mm = window_size * pixel_to_mm
	print("Window width in mm: %0.2f" % window_size_mm.x)
	print("Window height in mm: %0.2f" % window_size_mm.y)
	return {
		"screen": {
		"size_pixels": screen_size_pixels,
		"size_mm": screen_size_mm
		},
		"window": {
		"size_pixels": window_size,
		"size_mm": window_size_mm
		}
	}
