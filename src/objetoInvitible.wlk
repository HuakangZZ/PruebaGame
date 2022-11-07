import wollok.game.*
import personajes.*

object invisibleRojo {
	//var property image = "MejorPajarito.png"
	var property position = game.at(4,0)
	
	method movete(personaje){
		if(position.x() < rojito.position().x())
		position = game.at(personaje.position().x()+4,0)
	}
	
	method moveteIzquierda(personaje){
		position = game.at(personaje.position().x()+4,0)
	}
}
