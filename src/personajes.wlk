import wollok.game.*
import objetoInvitible.*
import Victoria.*

object azulito {
	var property image = "azul descanso.png"
	var property position = game.at(0,0)
	var property vida = 5
	var property estaCubierto = false
	
	method reiniciar(){
		image = "azul descanso.png"
		position = game.at(0,0)
		vida = 5
		estaCubierto = false
	}
	
	method moverDerecha(){
		if (position.x() != game.width() and invisibleRojo.position().x() < rojito.position().x()
			and not self.estaMuerto()
		)
		self.derechaConInvisible()
		if (invisibleRojo.position().x() > rojito.position().x())
			position = game.at(position.x()-1,0)
		if(not self.estaMuerto())
			image = "Azul camina 1.png"
		estaCubierto = false
	}
	
	method derechaConInvisible(){
		position = new Position(x = position.x()+1, y = position.y())
		invisibleRojo.movete(self)
	}
	
	method moverIzquierda(){
		if (position.x() != -1 and not self.estaMuerto())
		self.izquierdaConInvisible()
		if (not self.estaMuerto())
			image = "Azul camina 1.png"
		estaCubierto = false
	}
	
	method izquierdaConInvisible(){
		position = new Position(x = position.x()-1, y = position.y())
		invisibleRojo.moveteIzquierda(self)
	}
	
	method cambiar() {
		if(image == "azul descanso.png")
			image ="azul descanso abajo.png"
		else
			image = "azul descanso.png"
		estaCubierto = false
	}
	
	method golpear(){
		if (image == "azul descanso.png") 
		image = "azul golpe alto.png"
		else
			image = "azul golpe.png"
		estaCubierto = false
		if(rojito.noEstaCubierto() and invisibleRojo.position().x() == rojito.position().x())
			rojito.recibirGolpe()
	}
			
	method pegar(){
		if(not self.estaMuerto())
			self.golpear()
	}
	
	method noEstaCubierto() = estaCubierto == false
	
	method quieto(){
		position = game.at(position.x(),0)
	}
	
	method defensa(){
		if (image == "azul descanso.png" or image == "azul camina 1.png")
			image = "azul defensa 1.png.png"
		else
			image = "azul abajo.png"
		estaCubierto = true
	}
	
	method defenderse(){
		if(not self.estaMuerto())
			self.defensa()
	}
	
	method recibirGolpe(){
		if(not self.estaMuerto())
		image = "azul golpeado.png"
		vida = 0.max(vida - 1)	
	}
	
	method estaMuerto() = vida <= 0

	method perder(){
		if(self.estaMuerto())
		image = "azul nokeado.png"
		rojoGana.ganar()
		
	}
}

object rojito {
	var property image = "rojo descanso-1.png.png"
	var property position = game.at(game.width()-9,0)
	var property vida = 5
	var property estaCubierto = false
	
	method reiniciar(){
		image = "rojo descanso-1.png.png"
		position = game.at(game.width()-9,0)
		vida = 5
		 estaCubierto = false
	}
	
	method moverDerecha(){
		if (position.x() != game.width()-9 and not self.estaMuerto())
			position = new Position(x = position.x()+1, y = position.y())
		if (not self.estaMuerto())	
			image = "Rojo camina 1.png"
	}
	
	method moverIzquierda(){
		if (position.x() != invisibleRojo.position().x() and not self.estaMuerto())
		position = new Position(x = position.x()-1, y = position.y())
		if (self.position().x() < invisibleRojo.position().x() and not self.estaMuerto())
			position = game.at(position.x()+1,0)
		if (not self.estaMuerto())
			image = "Rojo camina 1.png"
	}
	
	method cambiar(){
		if(image == "rojo descanso-1.png.png")
			image ="rojo descanso abajo.png"
		else
			image = "rojo descanso-1.png.png"
		estaCubierto = false
		}
		
	method golpear(){
		if (image == "rojo descanso-1.png.png") 
			image = "rojo golpe alto.png"
		else
			image = "rojo golpe.png"
		estaCubierto = false
		if(azulito.noEstaCubierto() and invisibleRojo.position().x() == self.position().x() and not azulito.estaMuerto())
			azulito.recibirGolpe()
	}
			
	method pegar(){
		if(not self.estaMuerto())
		self.golpear()
	}
	
	method quieto(){
		position = game.at(position.x(),0)
	}
	
	method noEstaCubierto() = estaCubierto == false
	
	method recibirGolpe(){
		if(not self.estaMuerto())
		image = "rojo golpeado.png"
		vida = 0.max(vida - 1)
	}
	
	method defensa(){
		if (image == "rojo descanso.png" or image == "rojo camina 1.png")
			image = "rojo defensa.png"
		else
			image = "rojo abajo.png"
		estaCubierto = true
	}
	
	method defenderse(){
		if(not self.estaMuerto())
		self.defensa()
	}
	
	method estaMuerto() = vida <= 0
	
	method perder(){
		if(self.estaMuerto())
		image = "rojo nokeado.png"
		azulGana.ganar()
	}
	
	
	
}
