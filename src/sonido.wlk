import wollok.game.*

object sonido{
	var campana = game.sound("musical114.mp3")
	var property musica = game.sound("MusicaIntro.mp3")
	var golpe = game.sound("Golpe.mp3")
	var menuInicio = game.sound("ojo de tigre instrumental.mp3")
	var gritoMuere = game.sound("gritoPierde.mp3")
	
	
	method reiniciar(){
		self.detenerMusica()
		campana = game.sound("musical114.mp3")
		musica = game.sound("MusicaIntro.mp3")
		golpe = game.sound("Golpe.mp3")
		gritoMuere = game.sound("gritoPierde.mp3")
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
	
	method gritoMuere(){
		gritoMuere.play()
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
	
	var golpe = game.sound("Golpe2.mp3")
	
	method golpe(){
		game.schedule(5,{golpe.play()})
		self.reiniciarGolpe()
	}
	
	method reiniciarGolpe(){
		golpe = game.sound("Golpe.mp3")
	}
}