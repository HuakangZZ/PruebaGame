import wollok.game.*
import personajes.*
import objetoInvitible.*

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
		game.title("Peleita")
		game.height(15)
		game.width(30)
		game.boardGround("FondoBox.jpg")
		game.addVisual(rojito)
		game.addVisual(azulito)
		game.addVisual(invisibleRojo)
		
		game.onTick(500,"prueba",{
			rojito.cambiar()
		})
	
		game.onTick(500,"prueba",{
			azulito.cambiar()
		})
		
		game.whenCollideDo(azulito,{p => azulito.quieto()})
		game.whenCollideDo(rojito,{p => rojito.quieto()})
	
		game.start()
		
	}
	
	
	
}
