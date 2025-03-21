extends Node2D

@export var minigameScene: PackedScene;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and not body.isDoingMinigame:
		body.isDoingMinigame = true;
		print("Pinto pelado preto confuso n sei dirigir");
		var minigame: BaseMinigame = minigameScene.instantiate();
		
		# Pegando a janela principal
		var window = get_viewport_rect();
		
		# Calculando a posição central para a janela do minigame
		var windowOffsetX = (window.size.x / 2) - (minigame.size.x / 2);
		var windowOffsetY = (window.size.y / 2) - (minigame.size.y / 2);
		
		# Definindo a posição correta da janela do minigame
		minigame.global_position = Vector2(windowOffsetX, windowOffsetY);
		
		# Adicionando o minigame à cena atual
		get_tree().current_scene.add_child(minigame);
