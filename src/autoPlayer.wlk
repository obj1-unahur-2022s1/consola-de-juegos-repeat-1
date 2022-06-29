import wollok.game.*
import config.*

object autoJugador {
	var property image = "AutoAzulDerecha.png"
	var property position = game.origin()
	var property pasosDelPasajeroAlDestino = 0
	var property pasajeroActual = null
	var property gananciasTotales = 100
	var property combustible = 50
	var property ultimaDireccion = null
	var property vida = 100
	const property posicionInicial = position
	
	
	var property nivelActual = pantallaDeCarga
	
	
	
	
	
	
	method inicializarAuto(){
		pasosDelPasajeroAlDestino = 0
		combustible = 50
		vida = 100
		gananciasTotales = 0
		pasajeroActual = null
		
	}

	method avanzar(direccion){
		ultimaDireccion = direccion
		pasosDelPasajeroAlDestino += 1
		if (combustible == 0){
			game.removeVisual(self)
			game.addVisual(autoParado)
			game.addVisual(gameOver)
			game.say(autoParado,"Uh, me quedé sin nafta")
			
			game.schedule(10000, {game.stop()})	
			

		}
		if (combustible >= 1){
			self.rotar(direccion)
			combustible = 0.max(combustible - 1)}
		if(self.chocaConAuto()){
			vida = 0.max(vida-10)
		}
	}
	
	
	
	method rotar(direccion){
		if (direccion == "arriba"){
			image = "AutoAzulArriba.png"	
		}else if (direccion == "abajo"){
			image = "AutoAzulAbajo.png"
		}else if (direccion == "izq"){
			image = "AutoAzulIzquierda.png"
		}else if(direccion == "der"){
			image = "AutoAzulDerecha.png"
		}	
	}
	
	method subirPasajero(pasajero){
		pasosDelPasajeroAlDestino = 0
		pasajeroActual = pasajero
		pasajero.destino().mostrarDestino()
		game.removeVisual(pasajero)
		
	}
	
	method bajarPasajero(pasajero){
		pasajeroActual = null
		pasajero.abonarViaje(self)
		self.nivelActual().listaPasajeros().remove(pasajero)
		if(self.nivelActual().listaPasajeros().isEmpty()){
			config.pasarDeNivel()
		}
		
	}
	
	method recibirCobro(monto){
		gananciasTotales += monto
		
	}
	
	method cargarCombustible(litros){
		combustible += litros
		gananciasTotales = 0.max(gananciasTotales - litros)
	}
	
	method objetoColisionante()=
		if(game.colliders(self).size() == 1){
			game.uniqueCollider(self)
		}
		else if(game.colliders(self).size() > 1){
			
			game.colliders(self).anyOne()
		} 
		else{
			null
		}
			

	method interactuarCon(objeto) {
		if (self.objetoColisionante() != null)
			objeto.interactuar(self)
	}
	
	
	
	
	
	method chocaConAuto(){
		return position == autoPrueba.position() 
		
	}
	
	
	
	
}

object autoParado{
	var property image = autoJugador.image()
	var property position = self.positionAParar()
	const property posicionInicial = position
	

	
	method positionAParar(){
		
		if (autoJugador.ultimaDireccion() == "arriba"){
			return autoJugador.position().down(1)
		}if(autoJugador.ultimaDireccion() == "abajo"){
			return autoJugador.position().up(1)
		}if(autoJugador.ultimaDireccion() == "izq"){
			return autoJugador.position().right(1)
		}if(autoJugador.ultimaDireccion() == "der"){
			return autoJugador.position().left(1)
		}else{
			return autoJugador.position()
		}

}


}

object stats{
	var property position= game.at(10,2)
	

	
	const property posicionInicial = self.position()
	
	method text()= 
		return "Nafta: " + autoJugador.combustible() + "    " + "Dinero: " + autoJugador.gananciasTotales()
		+ "  " + "Vida: " + autoJugador.vida() + "   "+ autoJugador.nivelActual()
		
	
	method mensaje(){}
	
	method image() = "null.png"
		
	
	
}


object autoPrueba{
	var property image = "TaxiArriba.png"
    var property position = game.at(1.randomUpTo(15),1.randomUpTo(15))
    const property posicionInicial = position
    
    
	
	const property imagenes = ["TaxiArriba.png","TaxiAbajo.png","TaxiIzquierda.png","TaxiDerecha.png"]
	
    method movete() {
				image = imagenes.anyOne()
    		  	const x = 1.randomUpTo(4).roundUp()
			    const y = autoJugador.position().y() 
			    // otra forma de generar números aleatorios
			    // const x = (0.. game.width()-1).anyOne() 
			    // const y = (0.. game.height()-1).anyOne() 
			    position = game.at(x,y)
    	}
    	
    method mensaje(){
    	var frases = ["Eu tené cuidado", "¿Quien te enseño a manejar?", "Me chocaste!!", "Más vale que tengas seguro"]
    	
    	if (autoJugador.chocaConAuto()){
			game.say(self,frases.anyOne()) 
		}
	}
	
	method interactuar(objeto){}
  }


