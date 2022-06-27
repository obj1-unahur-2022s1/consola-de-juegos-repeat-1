import wollok.game.*
import autoPlayer.*
import EstacionDeServicio.*
import Pasajeros.*




object config {
	//Configuracion de volumen y teclas, además tiene el metodo revisarColision y guarda el nivel actual en el que esta el juego

	method configurarTeclas() {
		keyboard.up().onPressDo{autoJugador.avanzar("arriba") }
		keyboard.down().onPressDo{autoJugador.avanzar("abajo") }
		keyboard.left().onPressDo{autoJugador.avanzar("izq") }
		keyboard.right().onPressDo{autoJugador.avanzar("der") }
	
		keyboard.z().onPressDo{autoJugador.interactuarCon(autoJugador.objetoColisionante())}
		
		keyboard.r().onPressDo{self.reiniciarJuego(autoJugador.nivelActual())}
		
		
		keyboard.enter().onPressDo{self.pasarDeNivel()}
		
	}
	
	method nivelSiguiente(){
		return autoJugador.nivelActual().siguienteNivel()
	}
	
	method pasarDeNivel(){
		
		self.nivelSiguiente().inicio()
		self.nivelSiguiente().reiniciar()
		autoJugador.nivelActual(self.nivelSiguiente())
	}
	
	method reiniciarJuego(nivel) {
		nivel.reiniciar()	
	}
	
	

	
}

object colisiones{
	
	
	method configurar(){
		game.onCollideDo(autoJugador, { e => e.mensaje()})
		game.onTick(1000, "movimiento", { autoPrueba.movete() })
	}
	
}

object gameOver{
	method image()= "GameOver2.png"
	method position()= game.at(4,8)
	
}
	
	
class Nivel{
	const anchoTotal = 17
	const altoTotal = 12
	var property siguienteNivel

	method inicio(){
		
		game.clear()
		game.title("El laburante de Uberto")
		game.width(anchoTotal)
		game.height(altoTotal)
		
		config.configurarTeclas()
		
	}
	
	method reiniciarPosiciones(){
		game.allVisuals().forEach({elemento => elemento.position(elemento.posicionInicial() ) } )
	}
	
	
	
	method reiniciar(){
		self.inicio()
		self.reiniciarPosiciones()
		//autoParado.position(autoJugador.position())
		autoJugador.inicializarAuto()
	}
	
	
	
	
	
}

object menuUber inherits Nivel(siguienteNivel = nivel1){
	
	var property image = "Menu.png"
	var property position = game.origin()
	
	override method inicio(){
		super()
		game.addVisual(self)
	}
	
	
}



object nivel1 inherits Nivel(siguienteNivel = nivel2){
	
	
	
	override method inicio(){
		
		super()
			
		var eds = new EstacionDeServicio(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var d1 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p1 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=20,destino = d1)
		
		
		var d2 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p2 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=60,destino = d2)
		
		
		var d3 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p3 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=50,destino = d3)
		
		
		var d4 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p4 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=40,destino = d4)

		
		game.addVisual(stats)
		
		
		game.addVisual(eds)
		game.addVisual(p1)
		game.addVisual(d1)
		
		game.addVisual(p2)
		game.addVisual(d2)
		
		game.addVisual(p3)
		game.addVisual(d3)
		
		game.addVisual(p4)
		game.addVisual(d4)



		game.addVisualCharacter(autoJugador)

		game.showAttributes(autoJugador)

		game.addVisual(autoPrueba)
		
		colisiones.configurar()	
		
		
	}
	
	
	
	
	
}



object nivel2 inherits Nivel(siguienteNivel = nivel3){

	
	override method inicio(){
		
		super()
		
			
		var eds = new EstacionDeServicio(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var d1 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p1 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=30,destino = d1)
		
		
		var d2 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p2 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=90,destino = d2)
		
		
		var d3 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p3 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=50,destino = d3)
		
		
		var d4 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p4 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=30,destino = d4)
		
		
		
		var d5 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p5 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=40,destino = d5)
		
		
		var d6 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p6 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=60,destino = d6)

		
		game.addVisual(stats)
		
		
		game.addVisual(eds)
		game.addVisual(p1)
		game.addVisual(d1)
		
		game.addVisual(p2)
		game.addVisual(d2)
		
		game.addVisual(p3)
		game.addVisual(d3)
		
		game.addVisual(p4)
		game.addVisual(d4)
		
		
		game.addVisual(p5)
		game.addVisual(d5)
		
		game.addVisual(p6)
		game.addVisual(d6)
		
		
		game.addVisualCharacter(autoJugador)
		game.showAttributes(autoJugador)

		game.addVisual(autoPrueba)
		
		colisiones.configurar()	
		
		
		
	}
	
	

	
}

object nivel3 inherits Nivel(siguienteNivel = creditos){

	
	override method inicio(){
		
		super()
		
			
					
		var eds = new EstacionDeServicio(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var d1 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p1 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=15,destino = d1)
		
		
		var d2 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p2 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=50,destino = d2)
		
		
		var d3 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p3 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=60,destino = d3)
		
		
		var d4 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p4 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=20,destino = d4)
		
		
		
		var d5 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p5 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=31,destino = d5)
		
		
		var d6 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p6 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=19,destino = d6)




		var d7 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p7 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=17,destino = d7)



		var d8 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p8 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=10,destino = d8)




		var d9 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p9 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=70,destino = d9)



		var d10 = new Destino(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)))
		
		var p10 = new Pasajero(position=game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)),dineroDisponible=1,destino = d10)

		
		game.addVisual(stats)
		
		
		game.addVisual(eds)
		game.addVisual(p1)
		game.addVisual(d1)
		
		game.addVisual(p2)
		game.addVisual(d2)
		
		game.addVisual(p3)
		game.addVisual(d3)
		
		game.addVisual(p4)
		game.addVisual(d4)
		
		
		game.addVisual(p5)
		game.addVisual(d5)
		
		game.addVisual(p6)
		game.addVisual(d6)
		
		
		game.addVisual(p7)
		game.addVisual(d7)
		
		game.addVisual(p8)
		game.addVisual(d8)
		
		
		game.addVisual(p9)
		game.addVisual(d9)
		
		game.addVisual(p10)
		game.addVisual(d10)
		
		
		
		game.addVisualCharacter(autoJugador)
		game.showAttributes(autoJugador)
		game.showAttributes(p2)
		game.showAttributes(d2)
		game.addVisual(autoPrueba)
		
		colisiones.configurar()	
		

	}
	
	
}


object creditos inherits Nivel(siguienteNivel = null){
	method image() = "caja.png"
	method position() = game.center()
	
	override method inicio(){
		super()
		
		game.addVisual(self)
	}
	
	
}
