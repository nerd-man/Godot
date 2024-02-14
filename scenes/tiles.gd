extends TileMap

@export var variable = 0

var noise = FastNoiseLite.new()

var width = 32
var height = 32

@onready var player = get_tree().current_scene.get_node('Player')

var loaded_chunks = []

func _ready():
	noise.seed = randi()
	noise.frequency = 0.05
	

func _process(delta):
	var player_tile_pos = local_to_map(player.position)
	generate_chunk(player_tile_pos)
	

func generate_chunk(pos):
	for x in range(width):
		for y in range(height):
			var temp = int(noise.get_noise_1d(pos.x - (width/ 2) + x) * 10)
			
			if temp > -1:
				set_cell(0, Vector2i(pos.x - (width / 2) + x, temp), 1, Vector2(1, 0))
			else:
				# Temperary "biome" picker will actual biome noise later
				set_cell(0, Vector2i(pos.x - (width / 2) + x, temp), 1, Vector2(0, 3))

			# If the block is below the noise then fill it with dirt
			if pos.y - (height / 2)+ y > temp:
				set_cell(0, Vector2i(pos.x - (width / 2) + x, pos.y - (height / 2) + y), 1, Vector2(1, 1))
			
			
		
