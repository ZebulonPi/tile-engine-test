extends Camera2D

func center_camera_on_tilemap():
	# Get the reference to the TileMap node
	var tilemap = get_node("../TileMap")
	
	# Check if the tilemap is valid before proceeding
	if tilemap == null:
		print("TileMap is null, cannot center the camera.")
	return
	
	# Get the TileMap's size in tiles
	var map_size_in_tiles = tilemap.get_used_rect().size
	
	# Get the size of each tile in pixels
	var tile_size = tilemap.cell_quadrant_size

	# Calculate the center position in pixels
	var map_center = Vector2(map_size_in_tiles.x * tile_size / 2, map_size_in_tiles.y * tile_size / 2)
	
	# Set the camera position to the center
	position = map_center

func _ready():
	# Call the function to center the camera
	center_camera_on_tilemap()


var move_speed = 1000  # Adjust speed as necessary
var zoom_factor = 1.0
var zoom_speed = 0.5
var target_zoom_factor = zoom_factor

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		position.x -= move_speed * delta
	elif Input.is_action_pressed("ui_right"):
		position.x += move_speed * delta
	elif Input.is_action_pressed("ui_up"):
		position.y -= move_speed * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += move_speed * delta
	elif Input.is_action_pressed("ui_page_up"):
		target_zoom_factor -= zoom_speed * delta
		print("Zooming In: ", zoom_factor)  # Debugging output
	elif Input.is_action_pressed("ui_page_down"):
		target_zoom_factor += zoom_speed * delta
		print("Zooming Out: ", zoom_factor)  # Debugging output

	# Clamping zoom factor to prevent excessive zooming
	target_zoom_factor = clamp(target_zoom_factor, 0.1, 0.75)

	# Smooth transition to the target zoom level
	zoom_factor = lerp(zoom_factor, target_zoom_factor, 0.1)

	# Apply the zoom factor to the camera
	zoom = Vector2(zoom_factor, zoom_factor)
