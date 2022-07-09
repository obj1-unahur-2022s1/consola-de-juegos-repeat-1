import autoPlayer.*
import wollok.game.*

class nafta{
	const property posicionInicial = self.position()
	
	method position()
	
	method mensaje(){}
	
	method interactuar(objeto){}
}

object naftaPrimerDigito inherits nafta{
	
	var property position=game.at(7,11)
	
	method image(){
		var numeroConComa = autoJugador.combustible() / 100
		
		return numeroConComa.truncate(0).toString() + ".png"
	}
	
	
}

object naftaSegundoDigito inherits nafta{
	
	var property position=game.at(8,11)
	
	method image(){
		var numeroConComa = autoJugador.combustible() / 100
		var numeroSinComa = numeroConComa.truncate(0)
		var numeroDe2Digitos = autoJugador.combustible() - numeroSinComa * 100
		var segundoDigitoConComa = numeroDe2Digitos / 10
		
		return segundoDigitoConComa.truncate(0).toString() + ".png"
	}
}

object naftaTercerDigito inherits nafta{
	
	var property position = game.at(9,11)
	
	method image(){
		var numeroConComa = autoJugador.combustible() / 100
		var numeroSinComa = numeroConComa.truncate(0)
		var numeroDe2Digitos = autoJugador.combustible() - numeroSinComa * 100
		var segundoDigitoConComa = numeroDe2Digitos / 10
		
		return (numeroDe2Digitos - segundoDigitoConComa.truncate(0) * 10).toString() + ".png"
	}
}
