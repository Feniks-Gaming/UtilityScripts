class_name DebugManager
extends Node

# DebugManager is a base
# When using Debug Manager in a scene tree you want debugging you should clear
# this script and add new inherited script per each scene with stats you want to track
# This new script should be located with each scene


onready var root := get_tree().get_current_scene()
onready var DebugOverlay = root.find_node("DebugOverlay")

func _ready() -> void:
	
	# To add stats use:
	# DebugOverlay.add_stat(stat_name:String, object:Object, stat_ref:String, 
	#	is_method:bool, colour:String = "white")
	
	#to get object in above funtion use get_node_from_path() 
	#for example var object = get_node_from_path("Player/Sprite")
	pass

func get_node_from_path(string_path: String):
	#Put path to node you want to get as object from a current scene tree
	#For example "Player/Sprite"
	return root.get_node(string_path)
