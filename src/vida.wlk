import wollok.game.*
import personajes.*



object vidaRojo{
	const listaDeVida = ["vida rojo6.png","vida rojo5.png","vida rojo4.png","vida rojo3.png","vida rojo2.png","vida rojo1.png"]
	const property position = game.at(game.width()-11
		,12
	)
	
	
	method image() = listaDeVida.get(rojito.vida())
	
}

object vidaAzul{
	const listaDeVida = ["vidaAzul11.png","vidaAzul10.png","vidaAzul9.png","vidaAzul8.png","vidaAzul7.png","vidaAzul6.png"]
	const property position = game.at(1,12)
	
	
	method image() = listaDeVida.get(azulito.vida())
	
}