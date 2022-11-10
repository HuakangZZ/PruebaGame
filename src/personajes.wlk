import wollok.game.*
import objetoInvitible.*
import Victoria.*

object azulito {
	var property image = "azul descanso.png"
	var property position = game.at(0,0)
	var property vida = 17
	var property estaCubierto = false
	var property estaNokeado = false
	var pegue = true
	
	
	
	method reiniciar(){
		image = "azul descanso.png"
		position = game.at(0,0)
		vida = 17
		estaCubierto = false
		estaNokeado = false
	}
	
	method moverDerecha(){
		if (position.x() != game.width() and invisibleRojo.position().x() < rojito.position().x()
			and not self.estaMuerto() and not estaNokeado
		)
		self.derechaConInvisible()
		if (invisibleRojo.position().x() > rojito.position().x() and not estaNokeado)
			position = game.at(position.x()-1,0)
		if(not self.estaMuerto() and not estaNokeado)
			image = "Azul camina 1.png"
		estaCubierto = false
	}
	
	method derechaConInvisible(){
		position = new Position(x = position.x()+1, y = position.y())
		invisibleRojo.movete(self)
	}
	
	method moverIzquierda(){
		if (position.x() != -1 and not self.estaMuerto() and not estaNokeado)
		self.izquierdaConInvisible()
		if (not self.estaMuerto() and not estaNokeado)
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
		estaNokeado = false
	}
	
	method golpear(){
		if (image == "azul descanso.png") 
		image = "azul golpe alto.png"
		else
			image = "azul golpe.png"
		estaCubierto = false
		pegue = false
		if(rojito.noEstaCubierto() and invisibleRojo.position().x() == rojito.position().x() and not rojito.estaNokeado())
			rojito.recibirGolpe()
		game.schedule(500,{pegue = true})
	}
			
	method pegar(){
		if(not self.estaMuerto() and not rojito.estaNokeado() and not estaNokeado and pegue)
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
		if(not self.estaMuerto() and not estaNokeado)
			self.defensa()
	}
	
	method seCaePrimeraVez() = vida == 12
	
	method seCaeSegundaVez() = vida == 6
		
	method seNokea(){
		image = "azul nokeado.png"
	}	
	
	method seLevantaPrimeraVez(){
		image = "azul levantandose.png"
	}
	
	method seLevantaPrimeraVez2(){
		image = "azul casi de pie-1.png.png"
	}
	
	method caerse(){
		estaNokeado = true
		self.seNokea()
		game.removeTickEvent("pruebaAzulito")
		if(self.seCaePrimeraVez())
		self.configuracionCaersePrimeraVez()
		else
		self.configuracionCaerseSegundaVez()
		
	}
	
	method configuracionCaersePrimeraVez(){
		game.schedule(2000,{self.seLevantaPrimeraVez()})
		game.schedule(2500,{self.seLevantaPrimeraVez2()})
		vida--
		game.schedule(3000,{self.movimientoAzul()})
	}
	
	method configuracionCaerseSegundaVez(){
		game.schedule(4000,{self.seLevantaPrimeraVez()})
		game.schedule(6000,{self.seLevantaPrimeraVez2()})
		vida--
		game.schedule(7000,{self.movimientoAzul()})
	}
	
	method noEstaEstatico(){
		if(self.seCaePrimeraVez() or self.seCaeSegundaVez())
			self.caerse()
		else
			self.cambiar()
	}
	
	method movimientoAzul(){
		game.onTick(500,"pruebaAzulito",{
			if(not self.estaMuerto())
			self.noEstaEstatico()
			else
			self.perder()
		})
	}
	
	method recibirGolpe(){
		if(not self.estaMuerto() and not estaNokeado)
			self.configRecibirGolpe()
	}
	
	method configRecibirGolpe(){
		image = "azul golpeado.png"
		vida = 0.max(vida - 1)
		sonidoGolpeAzul.golpe()
	}
	
	method estaMuerto() = vida <= 0

	method perder(){
		if(self.estaMuerto())
		image = "azul nokeado.png"
		sonido.musica().stop()
		sonido.gritoMuere()
		self.parpadear()
		game.schedule(2700,{rojoGana.ganar()})
		}
		
	method cambioParpadeo(){
		if(image == "azul nokeado.png")
		image = "rojo nokeadovacio.png"
		else
		image = "azul nokeado.png"
	}
	
	method parpadear(){
		game.removeTickEvent("pruebaAzulito")
		game.onTick(300,"parpadeo",{
			self.cambioParpadeo()
		})
	}
}

object rojito {
	var property image = "rojo descanso-1.png.png"
	var property position = game.at(game.width()-9,0)
	var property vida = 17
	var property estaCubierto = false
	var property estaNokeado = false
	var pegue = true
		
	method reiniciar(){
		image = "rojo descanso-1.png.png"
		position = game.at(game.width()-9,0)
		vida = 17
		estaCubierto = false
		estaNokeado = true
	}
	
	method moverDerecha(){
		if (position.x() != game.width()-9 and not self.estaMuerto() and not estaNokeado)
			position = new Position(x = position.x()+1, y = position.y())
		if (not self.estaMuerto() and not estaNokeado)	
			image = "Rojo camina 1.png"
	}
	
	method moverIzquierda(){
		if (position.x() != invisibleRojo.position().x() and not self.estaMuerto() and not estaNokeado)
		position = new Position(x = position.x()-1, y = position.y())
		if (self.position().x() < invisibleRojo.position().x() and not self.estaMuerto() and not estaNokeado)
			position = game.at(position.x()+1,0)
		if (not self.estaMuerto() and not estaNokeado)
			image = "Rojo camina 1.png"
	}
	
	method noEstaEstatico(){
		if(self.seCaePrimeraVez() or self.seCaeSegundaVez())
			self.caerse()
		else
			self.cambiar()
	}
	
	method cambiar(){
		if(image == "rojo descanso-1.png.png")
			image ="rojo descanso abajo.png"
		else
			image = "rojo descanso-1.png.png"
		estaCubierto = false
		estaNokeado = false
		}
		
	method golpear(){
		if (image == "rojo descanso-1.png.png") 
			image = "rojo golpe alto.png"
		else
			image = "rojo golpe.png"
		estaCubierto = false
		pegue = false
		if(azulito.noEstaCubierto() and invisibleRojo.position().x() == self.position().x() and not azulito.estaMuerto() and not azulito.estaNokeado())
			azulito.recibirGolpe()
		game.schedule(500,{pegue = true})
	}
			
	method pegar(){
		if(not self.estaMuerto() and not azulito.estaNokeado() and not estaNokeado and pegue)
		self.golpear()
	}
	
	method quieto(){
		position = game.at(position.x(),0)
	}
	
	method noEstaCubierto() = estaCubierto == false
	
	method recibirGolpe(){
		if(not self.estaMuerto() and not estaNokeado)
			self.configRecibirGolpe()
	}
	
	method configRecibirGolpe(){
		image = "rojo golpeado.png"
		vida = 0.max(vida - 1)
		sonido.golpe()
	}
	
	method defensa(){
		if (image == "rojo descanso-1.png.png" or image == "rojo camina 1.png")
			image = "rojo defensa.png"
		else
			image = "rojo abajo.png"
		estaCubierto = true
	}
	
	method defenderse(){
		if(not self.estaMuerto() and not estaNokeado)
		self.defensa()
	}
	
	method estaMuerto() = vida <= 0
	
	method perder(){
		if(self.estaMuerto())
		image = "rojo nokeado.png"
		sonido.musica().stop()
		sonido.gritoMuere()
		self.parpadear()
		game.schedule(2700,{azulGana.ganar()})
	}
	
	method seCaePrimeraVez() = vida == 12
	
	method seCaeSegundaVez() = vida == 6
		
	method seNokea(){
		image = "rojo nokeado.png"
	}	
	
	method seLevantaPrimeraVez(){
		image = "rojo levantandose.png"
	}
	
	method seLevantaPrimeraVez2(){
		image = "rojo casi de pie.png"
	}
	
	method caerse(){
		estaNokeado = true
		self.seNokea()
		game.removeTickEvent("pruebaRojito")
		if(self.seCaePrimeraVez())
		self.configuracionCaersePrimeraVez()
		else
		self.configuracionCaerseSegundaVez()
		
	}
	
	method configuracionCaersePrimeraVez(){
		game.schedule(2000,{self.seLevantaPrimeraVez()})
		game.schedule(2500,{self.seLevantaPrimeraVez2()})
		vida--
		game.schedule(3000,{self.movimientoRojo()})
	}
	
	method configuracionCaerseSegundaVez(){
		game.schedule(4000,{self.seLevantaPrimeraVez()})
		game.schedule(6000,{self.seLevantaPrimeraVez2()})
		vida--
		game.schedule(7000,{self.movimientoRojo()})
	}
	
	method movimientoRojo(){
		
		game.onTick(500,"pruebaRojito",{
			if(not self.estaMuerto())
			self.noEstaEstatico()
			else
			self.perder()
		})
	}
	
	method cambioParpadeo(){
		if(image == "rojo nokeado.png")
		image = "rojo nokeadovacio.png"
		else
		image = "rojo nokeado.png"
	}
	
	method parpadear(){
		game.removeTickEvent("pruebaRojito")
		game.onTick(300,"parpadeo",{
			self.cambioParpadeo()
		})
	}
}
