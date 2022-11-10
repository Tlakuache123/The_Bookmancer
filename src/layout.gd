extends Resource
class_name Layout

export(bool) var F_L = false
export(bool) var F_C = false
export(bool) var F_R = false
export(bool) var B_L = false
export(bool) var B_C = false
export(bool) var B_R = false

func get_front() -> Array:
	return [F_L, F_C, F_R]

func get_back() -> Array:
	return [B_L, B_C, B_R]

func get_full() -> Array:
	return [get_front(), get_back()]
