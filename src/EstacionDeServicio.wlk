import autoPlayer.*
import wollok.game.*

class EstacionDeServicio {
	const property image = "nafta2.png"
	var property position = game.origin()//game.at(2,2)
	const property posicionInicial = position
	
	method interactuar(auto){
		self.venderCombustible(auto)
	}
	
	method venderCombustible(auto){
		if (auto.gananciasTotales() >0 ){
			auto.cargarCombustible(10)
		}
	}
	
	method mensaje(){
		if (autoJugador.gananciasTotales()>0){
			game.say(self,"Presiona Z para cargar combustible") 
		}else{
			game.say(self,"Not enough cash, stranger") 
		}
	}
	

	
}


