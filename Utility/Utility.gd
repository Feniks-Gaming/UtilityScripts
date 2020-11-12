extends Node
# This node holds all reusable functions to be used accross multiple of nodes

# Text testing varibles
var lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non nulla tempor dui gravida ultrices a vel enim. Aliquam erat volutpat. Nulla malesuada purus ut justo placerat, et accumsan augue bibendum. Pellentesque mattis commodo efficitur. Maecenas auctor varius feugiat. Aenean eget lacus at nisi luctus maximus. Integer auctor placerat arcu, eu venenatis velit. In tincidunt ipsum id varius fringilla. Cras id porta libero, quis mattis neque. Nam eget nulla egestas nibh commodo porta sed vel ante. Donec viverra est lorem, vel fringilla massa rhoncus sed. Donec tristique nec mauris iaculis commodo"
var lazy_dog = "The quick brown fox jumps over the lazy dog"

func choose(arguments: Array):
	# Chooses one of the arguments from array with equal chance
	randomize()
	var size = arguments.size()
	var choice = randi() % size
	return arguments[choice]


func do_percent_chance_check(chance:float) -> bool:
	# Checks if roll is below stated chance and returns true.
	# Allows for accuracy to 6 decimal place
	randomize()
	var roll_check = randf()
	chance = chance /100 # convert float into %
	if roll_check > chance:
		return false
	else: 
		return true


func return_dictionary_key_from_value(my_dictonary, my_value):
	# Returns key given a dictionary and it's value 
		var key = my_dictonary.keys()[my_dictonary.values().find(my_value)]
		return key
