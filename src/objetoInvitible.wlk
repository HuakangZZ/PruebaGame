import wollok.game.*
import personajes.*

object invisibleRojo {
	
	var property image = "MejorPajarito.png"
	var property position = game.at(9,0)
	
	method movete(personaje){
		position = game.at(personaje.position().x()+9,0)
		if (position.x()> azulito.position().x())
			position = game.at(personaje.position().x()+9-1,0)
	}
}
