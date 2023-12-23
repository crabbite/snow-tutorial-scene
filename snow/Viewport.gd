extends Viewport

export(NodePath) var player_path

export(Rect2) var world_extends

var player : RigidBody

func _ready():
	player = get_node(player_path)
	
	if not player :
		set_process(false)
	get_texture().set_flags(Texture.FLAG_FILTER)
	
func _process(delta):
	var half_world_extends = world_extends.size * 0.5
	var player_pos = Vector2(player.translation.x, player.translation.z)
	
	player_pos += half_world_extends
	var paintbrush_position = player_pos /world_extends.size
	$Sprite.position = paintbrush_position * size
