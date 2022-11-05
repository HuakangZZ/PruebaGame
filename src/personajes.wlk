import wollok.game.*
import objetoInvitible.*

object rojito {
	var property image = "rojitoEstatico1.png"
	var property position = game.at(0,0)
	
	method moverDerecha(){
		if (position.x() != game.width())
		position = new Position(x = position.x()+1, y = position.y())
		invisibleRojo.movete(self)
		if (invisibleRojo.position().x() > azulito.position().x())
			position = game.at(position.x()-1,0)
	}
	
	method moverIzquierda(){
		if (position.x() != -1)
		position = new Position(x = position.x()-1, y = position.y())
		invisibleRojo.movete(self)
	}
	
	method cambiar() =
		if(image == "rojitoEstatico1.png")
			image ="rojitoEstatico2.png"
		else
			image = "rojitoEstatico1.png"
			
	method pegar(){
		if (image == "rojitoEstatico1.png") 
		image = "RojitoPega.png"
		else
			image = "RojitoPega2.png"
	}
	
	method quieto(){
		position = game.at(position.x()-1,0)
	}

}

object azulito {
	var property image = "azulitoEstatico1.png"
	var property position = game.at(game.width()-9,0)
	
	method moverDerecha(){
		if (position.x() != game.width()-9)
		position = new Position(x = position.x()+1, y = position.y())
	}
	
	method moverIzquierda(){
		if (position.x() != game.width().div(6))
		position = new Position(x = position.x()-1, y = position.y())
		if (self.position().x() < invisibleRojo.position().x())
			position = game.at(position.x()+1,0)
	}
	
	method cambiar() =
		if(image == "azulitoEstatico1.png")
			image ="azulitoEstatico2.png"
		else
			image = "azulitoEstatico1.png"
			
	method pegar(){
		if (image == "azulitoEstatico1.png") 
			image = "AzulitoPega.png"
		else
			image = "AzulitoPega2.png"
	}
	
	method quieto(){
		position = game.at(position.x()+1,0)
	}
	
}
