extends CharacterBody2D


@export var speed : float = 300.0
@export var jump_velocity : float = -400.0
@export var double_jump_velocity : float = -300.0

@export var current_level:Node2D

var double_jump_cooldown = true
var basic_attack_cooldown = 0;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	for child in get_children():
		if child is Damageable:
			current_level.update_ui_hp(child.this_health)
	
func hp_changed(value : int):
	for child in get_children():
		if child is Damageable:
			child.hp_changed(value)
			current_level.update_ui_hp(child.this_health)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	elif !double_jump_cooldown:
		double_jump_cooldown = true

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_velocity
		elif double_jump_cooldown:
			velocity.y = double_jump_velocity
			double_jump_cooldown = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
		
		if velocity.x > 0 and get_node("BasicAttackHitbox").position.x < 0:
			get_node("BasicAttackHitbox").position.x = get_node("BasicAttackHitbox").position.x*-1
		if velocity.x < 0 and get_node("BasicAttackHitbox").position.x > 0:
			get_node("BasicAttackHitbox").position.x = get_node("BasicAttackHitbox").position.x*-1
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if basic_attack_cooldown >= 0:
		basic_attack_cooldown -= 0.5
	
	if Input.is_action_just_pressed("basic_attack") and basic_attack_cooldown <= 0 and !get_node("BasicAttackHitbox").visible:
		get_node("BasicAttackHitbox").visible = true
		get_node("BasicAttackHitbox").monitoring = true
		basic_attack_cooldown = 5
	
	if get_node("BasicAttackHitbox").visible and basic_attack_cooldown <= 0:
		get_node("BasicAttackHitbox").visible = false
		get_node("BasicAttackHitbox").monitoring = false
		basic_attack_cooldown = 5
		
	if Input.is_action_just_pressed("spell_down"):
		hp_changed(-1)
	

	move_and_slide()
