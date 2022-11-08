import Juego.*
import personajes.*
import vida.*
import wollok.game.*

object fotoRojoGana{
	var property image = "rojo Gana.png"
	var property position = game.origin()
}

object fotoAzulGana{
	var property image = "azul Gana.png"
	var property position = game.origin()
}

object rojoGana {
	
	method ganar(){
		game.clear()
		game.addVisual(fotoRojoGana)
		keyboard.r().onPressDo { juego.inicio()}
	}
	
}

object azulGana {
	
	method ganar(){
		game.clear()
		game.addVisual(fotoAzulGana)
		keyboard.r().onPressDo { juego.inicio()}
	}
	
}

object pepe{
	var property image = "menu de inicio.png"
	var property position = game.origin()
}

object fondo{
	var property image = "fondo.png"
	var property position = game.origin()
}

object sonido{
	const property campana = game.sound("musical114.mp3")
	const property musica = game.sound("MusicaIntro.mp3")
	
	method iniciarMusica(){	
		
		game.schedule(100,{campana.play()})
		musica.volume(0.2)
		musica.shouldLoop(true)	
		game.schedule(2500,{ musica.play()})
			
	}
	
	method detenerMusica(){
		musica.stop()		
	}
	
		
}


