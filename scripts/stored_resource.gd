class_name StoredResource

var tritium: int
var titanium: int
#var crew: int


func add_resources(other: StoredResource) -> void:
	#self.crew += other.crew
	self.titanium += other.titanium
	self.tritium += other.tritium


func scale_resources(scale: float) -> void:
	#self.crew *= scale
	self.titanium *= scale
	self.tritium *= scale
