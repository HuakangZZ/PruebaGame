import Juego.*
import personajes.*
import vida.*
import wollok.game.*


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

object sonido{
	var campana = game.sound("musical114.mp3")
	var musica = game.sound("MusicaIntro.mp3")
	var golpe = game.sound("Golpe.mp3")
	var menuInicio = game.sound("ojo de tigre instrumental.mp3")
	
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
		game.schedule(1500,{ musica.play()})
	}
	
	method detenerMusica(){
		campana.stop()
		musica.stop()		
	}
	
	method reiniciarGolpe(){
		golpe = game.sound("Golpe.mp3")
		
	}
	
	method golpe(){
		game.schedule(5,{golpe.play()})
		self.reiniciarGolpe()
	}
	
	method reiniciarSonidoDeInicio(){
		menuInicio.stop()
		menuInicio = game.sound("ojo de tigre instrumental.mp3")
	}
	
	method sonidoDeInicio(){
		menuInicio.volume(0.5)
		game.schedule(0,{menuInicio.play()})
		menuInicio.shouldLoop(true)	
	}
	
	
		
}

object sonidoGolpeAzul{
	
	var golpe = game.sound("Golpe.mp3")
	
	method golpe(){
		game.schedule(5,{golpe.play()})
		self.reiniciarGolpe()
	}
	
	method reiniciarGolpe(){
		golpe = game.sound("Golpe.mp3")
	}
	}
