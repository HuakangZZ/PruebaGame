import wollok.game.*
import personajes.*
import objetoInvitible.*
import vida.*

object juego {
	
	method iniciar(){
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
		game.boardGround("FondoBox.jpg")
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
	
		game.start()
		
	}
	
	
	
}
