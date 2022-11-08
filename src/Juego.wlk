import wollok.game.*
import personajes.*
import objetoInvitible.*
import vida.*
import Victoria.*

object juego {
	
	method inicio(){
		game.clear()
		game.addVisual(pepe)
		game.title("WollokPunch")
		game.height(15)
		game.width(30)
		keyboard.enter().onPressDo{self.configuracion()}
		game.start()
	}
	
	method configuracion(){
		game.clear()
		keyboard.d().onPressDo { azulito.moverDerecha()}
		keyboard.g().onPressDo { azulito.pegar()}
		keyboard.a().onPressDo { azulito.moverIzquierda()}
		keyboard.f().onPressDo { azulito.defenderse()}
		keyboard.right().onPressDo { rojito.moverDerecha()}
		keyboard.left().onPressDo { rojito.moverIzquierda()}
		keyboard.l().onPressDo { rojito.pegar()}
		keyboard.k().onPressDo { rojito.defenderse()}
		//game.title("WollokPunch")
		game.height(15)
		game.width(30)
		game.addVisual(fondo)
		//game.boardGround("FondoBox.jpg")
		game.addVisual(rojito)
		game.addVisual(azulito)
		game.addVisual(invisibleRojo)
		game.addVisual(vidaRojo)
		game.addVisual(vidaAzul)
		
		game.onTick(500,"prueba",{
			if(not rojito.estaMuerto())
			rojito.cambiar()
			else
			rojito.perder()
		})
	
		game.onTick(500,"prueba",{
			if(not azulito.estaMuerto())
			azulito.cambiar()
			else
			azulito.perder()
		})
		
		game.whenCollideDo(azulito,{p => azulito.quieto()})
		game.whenCollideDo(rojito,{p => rojito.quieto()})
		
		//sonido.iniciarMusica()
		//game.start()
		
	}
	
	
}
