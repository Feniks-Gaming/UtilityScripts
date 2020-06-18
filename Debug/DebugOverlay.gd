extends CanvasLayer

# Debug Overlay controls displaying of stats and adds stats arrays 
# It is called from DebugManager that then tells it what nodes to add to stats
# It can be toggles as active or inactive in each scene for easier readability

export var active = true

var stats = [] 
var text_strings = []

func _ready() -> void:
	$RichTextLabel.rect_min_size = get_viewport().size


func _process(delta):
	toggle_visibility()
	
	if active:
		var label_text: String = ""
		text_strings.clear()
		$RichTextLabel.clear()
		
		#Always print FPS and memory usage
		var fps := Engine.get_frames_per_second()
		text_strings.append(str("FPS: ", fps))
		var mem := OS.get_static_memory_usage()
		text_strings.append(str("Static Memory: ", String.humanize_size(mem)))
		
		# Sorting new stat into display readable array
		for s in stats:
				var value = null
				if s[1] and is_instance_valid(s[1]):
					if s[3]:
						value = s[1].call(s[2])
					else:
						value = s[1].get(s[2])
				text_strings.append(str(s[0], ": ", value))
		
		#Adding colors to display for readability
		for i in text_strings.size():
			if i < 2:
				label_text += "[color=yellow]" + text_strings[i] + "[/color]" + "\n"
			else:
				label_text += "[color=" + str(stats[i-2][4]) + "]" + text_strings[i] + "[/color]" + "\n"
		$RichTextLabel.bbcode_text = label_text


func add_stat(stat_name:String, object:Object, stat_ref:String, 
		is_method:bool, colour:String = "white") -> void:
	#Adds new stat as subarray to stat array for further displaying
	stats.append([stat_name, object, stat_ref, is_method, colour])


func toggle_visibility() -> void:
	#Make label visible doesn't affect processing
	if active:
		$RichTextLabel.visible = true
	else:
		$RichTextLabel.visible = false
