import wollok.game.*
import personajes.*
import objetoInvitible.*

object juego {
	
	method iniciar(){
		keyboard.d().onPressDo { rojito.moverDerecha()}
		keyboard.g().onPressDo { rojito.pegar()}
		keyboard.a().onPressDo { rojito.moverIzquierda()}
		keyboard.right().onPressDo { azulito.moverDerecha()}
		keyboard.left().onPressDo { azulito.moverIzquierda()}
		keyboard.l().onPressDo { azulito.pegar()}
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
