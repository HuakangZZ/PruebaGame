import wollok.game.*
import personajes.*

object invisibleRojo {
	
	var property position = game.at(4,0)
	
	method movete(personaje){
		position = game.at(personaje.position().x()+4,0)
	}
}
