import wollok.game.*
import objetoInvitible.*

object azulito {
	var property image = "azul descanso.png"
	var property position = game.at(0,0)
	var property vida = 5
	var property estaCubierto = false
	
	method moverDerecha(){
		if (position.x() != game.width() and invisibleRojo.position().x() < rojito.position().x())
		position = new Position(x = position.x()+1, y = position.y())
		invisibleRojo.movete(self)
		if (invisibleRojo.position().x() > rojito.position().x())
			position = game.at(position.x()-1,0)
		image = "Azul camina 1.png"
		estaCubierto = false
	}
	
	method moverIzquierda(){
		if (position.x() != -1)
		position = new Position(x = position.x()-1, y = position.y())
		invisibleRojo.moveteIzquierda(self)
		image = "Azul camina 1.png"
		estaCubierto = false
	}
	
	method cambiar() {
		if(image == "azul descanso.png")
			image ="azul descanso abajo.png"
		else
			image = "azul descanso.png"
		estaCubierto = false
	}
			
	method pegar(){
		if (image == "azul descanso.png") 
		image = "azul golpe alto.png"
		else
			image = "azul golpe.png"
		estaCubierto = false
		if(rojito.noEstaCubierto() and invisibleRojo.position().x() == rojito.position().x())
			rojito.recibirGolpe()
	}
	
	method noEstaCubierto() = estaCubierto == false
	
	method quieto(){
		position = game.at(position.x(),0)
	}
	
	method defenderse(){
		if (image == "azul descanso.png" or image == "azul camina 1.png")
			image = "azul defensa 1.png.png"
		else
			image = "azul abajo.png"
		estaCubierto = true
	}
	
	method recibirGolpe(){
		image = "azul golpeado.png"
		vida = vida - 1
	}

}

object rojito {
	var property image = "rojo descanso-1.png.png"
	var property position = game.at(game.width()-9,0)
	var property vida = 5
	var property estaCubierto = false
	
	method moverDerecha(){
		if (position.x() != game.width()-9)
		position = new Position(x = position.x()+1, y = position.y())
		image = "Rojo camina 1.png"
	}
	
	method moverIzquierda(){
		if (position.x() != invisibleRojo.position().x())
		position = new Position(x = position.x()-1, y = position.y())
		if (self.position().x() < invisibleRojo.position().x())
			position = game.at(position.x()+1,0)
			image = "Rojo camina 1.png"
	}
	
	method cambiar(){
		if(image == "rojo descanso-1.png.png")
			image ="rojo descanso abajo.png"
		else
			image = "rojo descanso-1.png.png"
		estaCubierto = false
		}
		
			
	method pegar(){
		if (image == "rojo descanso-1.png.png") 
			image = "rojo golpe alto.png"
		else
			image = "rojo golpe.png"
		estaCubierto = false
		if(azulito.noEstaCubierto() and invisibleRojo.position().x() == self.position().x())
			azulito.recibirGolpe()
	}
	
	method quieto(){
		position = game.at(position.x(),0)
	}
	
	method noEstaCubierto() = estaCubierto == false
	
	method recibirGolpe(){
		image = "rojo golpeado.png"
		vida = vida - 1
	}
	
	method defenderse(){
		if (image == "rojo descanso.png" or image == "rojo camina 1.png")
			image = "rojo defensa.png"
		else
			image = "rojo abajo.png"
		estaCubierto = true
	}
	
}
