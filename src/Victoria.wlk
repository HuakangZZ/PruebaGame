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
	
	method resetGame(){
		juego.inicio()
		sonido.reiniciar()
	}
	
	method ganar(){
		game.clear()
		game.addVisual(fotoRojoGana)
		keyboard.r().onPressDo { self.resetGame()}
		keyboard.p().onPressDo { game.stop()}
		
	}
	
}

object azulGana {
	
	method resetGame(){
		juego.inicio()
		sonido.reiniciar()
	}
	
	method ganar(){
		game.clear()
		game.addVisual(fotoAzulGana)
		keyboard.r().onPressDo { self.resetGame()}
		keyboard.p().onPressDo { game.stop()}
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
	var campana = game.sound("musical114.mp3")
	var musica = game.sound("MusicaIntro.mp3")
	var golpe = game.sound("Golpe.mp3")
	
	method reiniciar(){
		self.detenerMusica()
		campana = game.sound("musical114.mp3")
		musica = game.sound("MusicaIntro.mp3")
		golpe = game.sound("Golpe.mp3")
	}
	
	method iniciarMusica(){	
		
		game.schedule(100,{campana.play()})
		
		musica.shouldLoop(true)	
		musica.volume(0.2)
		game.schedule(2500,{ musica.play()})
	}
	
	method detenerMusica(){
		campana.stop()
		musica.stop()		
	}
	
	method detenerGolpe(){
		golpe.stop()
	}
	
	method reiniciarGolpe(){
		self.detenerGolpe()
		golpe = game.sound("Golpe.mp3")
		
	}
	
	method golpe(){
		game.schedule(0,{golpe.play()})
		self.reiniciarGolpe()
	}
	
		
}


