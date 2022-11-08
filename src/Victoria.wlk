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
		game.addVisual(fotoRojoGana)
		game.schedule(1,{azulGana.play()})
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
		game.schedule(1,{azulGana.play()})
		keyboard.r().onPressDo { self.resetGame()}
		keyboard.p().onPressDo { game.stop()}
	}
	
}

object menu{
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
		game.schedule(10,{golpe.play()})
		self.reiniciarGolpe()
	}
	
		
}


