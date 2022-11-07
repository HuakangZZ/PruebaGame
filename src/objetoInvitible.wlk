import wollok.game.*
import personajes.*

object invisibleRojo {
	//var property image = "MejorPajarito.png"
	var property position = game.at(4,0)
	
	method movete(personaje){
		if(position.x() < rojito.position().x() and not personaje.estaMuerto())
		position = game.at(personaje.position().x()+4,0)
	}
	
	method moveteIzquierda(personaje){
		if(not personaje.estaMuerto())
		position = game.at(personaje.position().x()+4,0)
	}
}
