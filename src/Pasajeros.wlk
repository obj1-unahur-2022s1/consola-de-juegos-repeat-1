import autoPlayer.*
import wollok.game.*
import config.*

class Pasajero {
	var property destino // Destino()
	var property dineroDisponible // Int
	var property position = game.at(5,5)
	const property posicionInicial = position
	const property image = "pasajero1.png"
	var property costoDelUltimoViaje = 0
	

	
	method interactuar(auto){
		if (auto.pasajeroActual() == null){
			auto.subirPasajero(self)
		}else{
			game.say(auto,"Che, llevame a mi primero")
		}
			
		
	}
	
	method abonarViaje(auto){
		costoDelUltimoViaje = 0.max(dineroDisponible - auto.pasosDelPasajeroAlDestino())
		dineroDisponible -= costoDelUltimoViaje
		auto.recibirCobro(costoDelUltimoViaje)
		self.bajarDelAuto()
	}
	
	
	method bajarDelAuto(){
		position = destino.position()
		game.addVisual(self)
		autoJugador.pasajeroActual(null)
		game.schedule(2000, {game.removeVisual(self)})
		game.schedule(2000, {game.removeVisual(destino)})
	}
	
	method estaEnDestino(){
		return position == destino.position()
	}
	
	
	
	method mensaje(){
		if (position != destino.position()) {
			game.say(self,"
					¿Uber?") 
	}if (self.estaEnDestino() and costoDelUltimoViaje == 0){
		game.say(self,"Dejá, la proxima llamo un remis")
	}else if (self.estaEnDestino()){
		game.say(self,"$" + costoDelUltimoViaje + " dice la app, gracias") 
	}
}

}

class Destino{
	var property image = "null.png"
	var property position
	const property posicionInicial = position
	
	method mostrarDestino(){
		image = "Pixel.png"
	}
	
	method mensaje(){
	}
	
	method interactuar(auto){
		if (auto.pasajeroActual().destino() == self){
			auto.bajarPasajero(auto.pasajeroActual())
		}
			
		
	}
}
