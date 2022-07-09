import wollok.game.*
import consola.*
import autoPlayer.*
import config.*

class Juego {
	var property position = null
	var property color 
	
	method iniciar(){
        game.addVisual(object{method position()= game.center() method text() = "Juego "+color + " - <q> para salir"})		
	}
	
	method terminar(){

	}
	method image() = "juego" + color + ".png"
	

}

object uberto inherits Juego(color = "Amarillo"){
	
	override method iniciar(){
		pantallaDeCarga.inicio()
		
	}
	
	override method image() = "LogoUber.png"
	
	override method terminar(){
		game.stop()
	}
	
}