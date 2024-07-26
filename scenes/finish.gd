extends Area2D

func _ready():
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)

func _on_body_entered(body):
    if body.name == "CharacterBody2D":
        _change_scene()

func _on_body_exited(body):
    if body.name == "CharacterBody2D":
        pass

func _change_scene():
    print_debug(get_tree().current_scene.scene_file_path)
    match get_tree().current_scene.scene_file_path:
        "res://scenes/level1.tscn":
            get_tree().change_scene_to_file("res://scenes/level2.tscn")
        "res://scenes/level2.tscn":
            get_tree().change_scene_to_file("res://scenes/level3.tscn")
        "res://scenes/level3.tscn":
            get_tree().change_scene_to_file("res://scenes/level4.tscn")
        "res://scenes/level4.tscn":
            get_tree().change_scene_to_file("res://scenes/level5.tscn")
        "res://scenes/level5.tscn":
            get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
        _:
            print_debug("Unknown scene, cannot change.")

