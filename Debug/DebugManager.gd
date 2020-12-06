class_name DebugManager
extends Node

# DebugManager is a base
# When using Debug Manager in a scene tree you want debugging you should clear
# this script and add new inherited script from this script to each scene 
# with stats you want to track rename each script to unique name like "DebugManagerLevel3"
# This new script should be located with each scene for easy finding. 

signal stat_passed(stat_name, object, stat_ref, is_method, colour)

onready var root := get_tree().get_current_scene()

func get_node_from_path(string_path: String):
	# Put path to node you want to get as object from a current scene tree
	# For example if your scene is "Level/Player/Sprite" and you want to 
	# add stats from Player Sprite you will put "Player/Sprite"
	return root.get_node(string_path)

func pass_stats():
	# To add stats you should edit this function following this template:
	# var object = get_node_from_path("Object_path")
	# Change the name of `object` to represent the name of object you are adding
	# for example var PlayerSprite = get_node_from_path("Player/Sprite")
	# Then for every stat you want from that object add signal "stat_passed"
	# Those are the stats you will need to pass along with the signal 
	# emit_signal("stat_passed",stat_name:String, object:Object, stat_ref:String, 
	# is_method:bool = false, colour:String = "white")

	# stat_name is a string that will be displayed on a screen 
	# object is the object you are adding a stat from in this example PlayerSprite
	# stat_ref is the actual name of a stat in code. 
	# is_method is false by default you must pass it as true if your stat is method
	# colour use one of names below as string for example "blue" by defalult colour is white

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
