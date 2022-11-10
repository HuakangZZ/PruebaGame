import wollok.game.*
import personajes.*



object vidaRojo{
	const listaDeVida = ["vida rojo18.png","vida rojo17.png","vida rojo16.png","vida rojo15.png","vida rojo14.png","vida rojo13.png","vida rojo12.png","vida rojo11.png","vida rojo10.png","vida rojo9.png","vida rojo8.png","vida rojo7.png","vida rojo6.png","vida rojo5.png","vida rojo4.png","vida rojo3.png","vida rojo2.png","vida rojo1.png"]
	const property position = game.at(game.width()-11,12)
	
	method image() = listaDeVida.get(rojito.vida())
	
}

object vidaAzul{
	const listaDeVida = ["vidaAzul18.png","vidaAzul17.png","vidaAzul16.png","vidaAzul15.png","vidaAzul14.png","vidaAzul13.png","vidaAzul12.png","vidaAzul11.png","vidaAzul10.png","vidaAzul9.png","vidaAzul8.png","vidaAzul7.png","vidaAzul6.png","vidaAzul5.png","vidaAzul4.png","vidaAzul3.png","vidaAzul2.png","vidaAzul1.png"]
	const property position = game.at(1,12)
	
	method image() = listaDeVida.get(azulito.vida())
	
}