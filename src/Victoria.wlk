import Juego.*
import personajes.*
import vida.*
import wollok.game.*
import sonido.*

object menuControles{
	var property image = "controles final.png"
	var property position = game.origin()
}

object fotoRojoGana{
	var property image = "gano rojocontroles.png"
	var property position = game.origin()
}

object fotoAzulGana{
	var property image = "gano azul controles.png"
	var property position = game.origin()
}

object rojoGana {
	
	var property rojoGana = game.sound("Ruido ambiente.mp3")
	
	method reiniciarSonidoAca(){
		rojoGana.stop()
		rojoGana = game.sound("Ruido ambiente.mp3")
	}
	
	method resetGame(){
		juego.inicio()
		sonido.reiniciar()
		self.reiniciarSonidoAca()
	}
	
	method ganar(){
		game.clear()
		game.addVisual(fotoRojoGana)
		rojoGana.volume(0.3)
		game.schedule(1,{rojoGana.play()})
		keyboard.r().onPressDo { self.resetGame()}
		keyboard.p().onPressDo { game.stop()}
		
	}
	
}

object azulGana {
	
	var property azulGana = game.sound("Ruido ambiente.mp3")
	
	method reiniciarSonidoAca(){
		azulGana.stop()
		azulGana = game.sound("Ruido ambiente.mp3")
	}
	
	method resetGame(){
		juego.inicio()
		sonido.reiniciar()
		self.reiniciarSonidoAca()
	}
	
	method ganar(){
		game.clear()
		game.addVisual(fotoAzulGana)
		azulGana.volume(0.3)
		game.schedule(1,{azulGana.play()})
		keyboard.r().onPressDo { self.resetGame()}
		keyboard.p().onPressDo { game.stop()}
	}
	
}

object menu{
	var property image = "menu controles.png"
	var property position = game.origin()
}

object fondo{
	var property image = "fondo.png"
	var property position = game.origin()
}
