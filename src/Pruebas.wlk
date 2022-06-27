import wollok.game.*
import autoPlayer.*
import EstacionDeServicio.*
import Pasajeros.*

object prueba{
	const eds = new EstacionDeServicio()
	const d1 = new Destino(position=game.at(10,10))
	const p1 = new Pasajero(dineroDisponible=20,destino = d1)
}

