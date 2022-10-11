extends StaticBody2D

var posicao_inicial
var posicao_final
var direcao = 1
var velocidade = 2

func _ready():
	$Sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 400
	
func _process(delta):
	if($".".position.x <= posicao_final and direcao == 1):
		$".".position.x += velocidade
	else:
		$Sprite.flip_h = true
		direcao = 0
		
	if($".".position.x >= posicao_inicial and direcao == 0):
		$".".position.x -= velocidade
	else:
		$Sprite.flip_h = false
		direcao = 1
