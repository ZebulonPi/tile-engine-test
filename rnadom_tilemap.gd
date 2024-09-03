extends TileMap

func _ready():
	var map_width = 40
	var map_height = 30
	var tile_ids = [0, 1, 2, 3, 4, 5, 6, 7]  # Replace with the correct source IDs from your TileSet
	var atlas_positions = [Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1), Vector2i(4, 1), Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4), Vector2i(4, 4)]  # Replace with actual atlas coordinates
	var layer = 0  # Assuming you are working with the first layer

	for x in range(map_width):
		for y in range(map_height):
			var random_index = randi() % tile_ids.size()
			var random_tile = 1
			var coords = Vector2i(x, y)
			var atlas_coords = atlas_positions[random_index]
			set_cell(layer, coords, random_tile, atlas_coords)
