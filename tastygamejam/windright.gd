extends Area2D


@onready var collision_shape = $CollisionShape2D
@onready var gpu_particles = $GPUParticles2D
@onready var graceperiodtimer = $GracePeriod
@onready var timer = $Timer
var facing_direction = 0

@export var TIMED_WIND = false
@export var WIND_INTERNAL = 2.5


var wind_on = true

func _ready() -> void:
	timer.wait_time = WIND_INTERNAL
	#var material = gpu_particles.process_material
	#material.emission_box_extents = Vector3(collision_shape.shape.size.x/2, collision_shape.shape.size.y/2,0)
	#gpu_particles.amount = (collision_shape.shape.size.x/collision_shape.shape.size.y) * 15


func _on_timer_timeout() -> void:
	if(TIMED_WIND):
		wind_on = !wind_on
		if(wind_on):
			graceperiodtimer.start(1.5)
			gpu_particles.emitting = true
		else:
			collision_shape.disabled = true
			gpu_particles.emitting = false
		


func _on_grace_period_timeout() -> void:
	collision_shape.disabled = false
