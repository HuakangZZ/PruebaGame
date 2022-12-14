import wollok.game.*
import personajes.*
import objetoInvitible.*
import vida.*
import Victoria.*
import sonido.*

object juego {
	
	method inicio(){
		game.clear()
		game.addVisual(menu)
		game.title("WollokPunch")
		game.height(15)
		game.width(30)
		rojito.reiniciar()
		azulito.reiniciar()
		sonido.sonidoDeInicio()
		keyboard.c().onPressDo{self.controles()}
		keyboard.enter().onPressDo{self.configuracion()}
		keyboard.p().onPressDo { game.stop()}
	}
	
	method configuracion(){
		game.clear()
		sonido.reiniciarSonidoDeInicio()
		keyboard.d().onPressDo { azulito.moverDerecha()}
		keyboard.g().onPressDo { azulito.pegar()}
		keyboard.a().onPressDo { azulito.moverIzquierda()}
		keyboard.f().onPressDo { azulito.defenderse()}
		keyboard.right().onPressDo { rojito.moverDerecha()}
		keyboard.left().onPressDo { rojito.moverIzquierda()}
		keyboard.l().onPressDo { rojito.pegar()}
		keyboard.k().onPressDo { rojito.defenderse()}
		game.title("WollokPunch")
		game.height(15)
		game.width(30)
		game.addVisual(fondo)
		//game.boardGround("FondoBox.jpg")
		game.addVisual(rojito)
		game.addVisual(azulito)
		game.addVisual(invisibleRojo)
		game.addVisual(vidaRojo)
		game.addVisual(vidaAzul)
		game.addVisual(contador)
		
		rojito.movimiento()
	
		azulito.movimiento()
		
		game.whenCollideDo(azulito,{p => azulito.quieto()})
		game.whenCollideDo(rojito,{p => rojito.quieto()})
		
		sonido.iniciarMusica()
		//game.start()
		
	}
	
	method controles(){
		sonido.reiniciarSonidoDeInicio()
		game.clear()
		game.addVisual(menuControles)
		keyboard.r().onPressDo { self.inicio()}
		keyboard.p().onPressDo { game.stop()}
	}
	
	
}
