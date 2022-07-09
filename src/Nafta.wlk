import autoPlayer.*

object naftaPrimerDigito {
	method image(){
		var numeroConComa = autoJugador.combustible() / 100
		
		return numeroConComa.truncate(0).toString() + ".png"
	}
}

object naftaSegundoDigito{
	method image(){
		var numeroConComa = autoJugador.combustible() / 100
		var numeroSinComa = numeroConComa.truncate(0)
		var numeroDe2Digitos = autoJugador.combustible() - numeroSinComa * 100
		var segundoDigitoConComa = numeroDe2Digitos / 10
		
		return segundoDigitoConComa.truncate(0).toString() + ".png"
	}
}

object naftaTercerDigito{
	method image(){
		var numeroConComa = autoJugador.combustible() / 100
		var numeroSinComa = numeroConComa.truncate(0)
		var numeroDe2Digitos = autoJugador.combustible() - numeroSinComa * 100
		var segundoDigitoConComa = numeroDe2Digitos / 10
		
		return (numeroDe2Digitos - segundoDigitoConComa.truncate(0) * 10).toString() + ".png"
	}
}
