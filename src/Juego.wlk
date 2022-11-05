import wollok.game.*
import personajes.*

object juego {
	
	method iniciar(){
		keyboard.d().onPressDo { rojito.moverDerecha()}
		keyboard.g().onPressDo { rojito.pegar()}
		keyboard.a().onPressDo { rojito.moverIzquierda()}
		keyboard.b().onPressDo { game.say(rojito,"hola")}
		keyboard.right().onPressDo { azulito.moverDerecha()}
		keyboard.left().onPressDo { azulito.moverIzquierda()}
		keyboard.l().onPressDo { azulito.pegar()}
		game.title("Peleita")
		game.height(17)
		game.width(35)
		game.boardGround("FondoBox.jpg")
		game.addVisual(rojito)
		game.addVisual(azulito)
		game.start()
		
		game.onTick(500,"prueba",{
		rojito.cambiar()
		})
	
		game.onTick(500,"prueba",{
		azulito.cambiar()
		})
		
		}
	
	
	
}
