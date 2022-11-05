import wollok.game.*

object rojito {
	var property image = "rojitoEstatico1.png"
	var property position = game.at(0,0)
	
	method moverDerecha(){
		if (position.x() != game.width().div(6))
		position = new Position(x = position.x()+1, y = position.y())
	}
	
	method moverIzquierda(){
		if (position.x() != -1)
		position = new Position(x = position.x()-1, y = position.y())
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
		position = game.origin()
	}

}

object azulito {
	var property image = "MejorPajarito.png"
	var property position = game.at(game.width(),0)
	
	method moverDerecha(){
		if (position.x() != game.width())
		position = new Position(x = position.x()+1, y = position.y())
	}
	
	method moverIzquierda(){
		if (position.x() != game.width().div(6))
		position = new Position(x = position.x()-1, y = position.y())
	}
	
	method quieto(){
		position = game.origin()
	}
	
}
