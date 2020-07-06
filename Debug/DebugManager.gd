class_name DebugManager
extends Node

# DebugManager is a base
# When using Debug Manager in a scene tree you want debugging you should clear
# this script and add new inherited script per each scene with stats you want to track
# This new script should be located with each scene

signal stat_passed(stat_name, object, stat_ref, is_method, colour)

onready var root := get_tree().get_current_scene()

func get_node_from_path(string_path: String):
	# Put path to node you want to get as object from a current scene tree
	# For example "Player/Sprite"
	return root.get_node(string_path)

func pass_stats():
	# To add stats use:
	# var object = get_node_from_path("Object_path")
	# for example var object = get_node_from_path("Player/Sprite")
	# Then for every stat you want from that object:
	# emit_signal("stat_added",stat_name:String, object:Object, stat_ref:String, 
	# is_method:bool, colour:String = "white")

	#List of valid colours in BBCode:
	# aqua
	# black
	# blue
	# fuchsia
	# gray
	# green
	# lime
	# maroon
	# navy
	# purple
	# red
	# silver
	# teal
	# white
	# yellow
	pass
