extends TileMap

@export var variable = 0

var noise = FastNoiseLite.new()
var chunk_size = 8

@onready var player = get_tree().current_scene.get_node('Player')


var loaded_chunks = {}

func _ready():
	noise.seed = randi()
	noise.frequency = 0.05
	

func _process(delta):
	var player_tile_pos = local_to_map(player.position)
	

func generate_chunk(x, y):
	var chunk_data = []
	for y_pos in range(chunk_size):
		for x_pos in range(chunk_size):
			var target_x = x * chunk_size + x_pos
			var target_y = y * chunk_size + x_pos
			var tile_type = 0
			
			if target_y > 10:
				tile_type = 2
			elif target_y == 10:
				tile_type = 1
			
			if tile_type != 0:
				chunk_data.append([Vector2(target_x, target_y), target_y, tile_type])
			return chunk_data
