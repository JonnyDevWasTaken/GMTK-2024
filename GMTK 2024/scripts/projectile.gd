extends Area2D

var direction: Vector2
var distance_travelled: float
var damage: float
@export var speed: float = 1000.0
@export var max_range: float = 500.0


func _physics_process(delta: float) -> void:
	direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	distance_travelled += speed * delta
	if distance_travelled > max_range:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var hitbox: HitboxComponent = area
		hitbox.damage(damage)
		queue_free()
