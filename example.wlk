object luisa{
  method jugadora(){}
}

////////Personajes

object floki{
  method arma() = ballesta
  method encontrar(elemento){
    if(self.arma.estaCargada()){
      elemento.sufirAtaque(self.arma().potencia())
      self.arma().fueUsada()
    }
  }
}

object mario{
  var recoleccion = 0
  method valorRecolectado() = recoleccion
  method encontrar(elemento){
    if(elemento == castillo){
      valorRecolectado() += elemento.defensa() / 5
      elemento.recibirTrabajo()
    } else if(elemento == aurora){
      valorRecolectado() += 15
    } else if(elemento == tipa){
      valorRecolectado() += tipa.altura() *2
    }
  }
  method esFeliz(){
    if(valorRecolectado() => 50 || elemento.altura() => 10)
  }
}

///////////Armas

object ballesta{
  var municiones = 10
  method potencia() = 4
  method estaCargada() = municiones > 0
  method fueUsada(){
    municiones -= 1
  }
}

object jabalina{
  method potencia() = 30
  method estaCargada() = true
  method fueUsada() = !self.estaCargada()
}

////////Elementos

object castillo{
  var defensa = 150
  method altura() = 20
  method nivelDeDefensa() = defensa
  method sufrirAtaque(unaPotencia){
    nivelDeDefensa = nivelDeDefensa - unaPotencia
  }
  method recibirTrabajo(){
    nivelDeDefensa() = 200.min(nivelDeDefensa + 20)
  }
}

object aurora{
  var vida = true
  method altura() = 1
  method estaViva() = vida
  method sufrirAtaque(unaPotencia){
    if(unaPotencia > 10){
      estaViva = self.!estaViva()
    }
  }
  method recibirTrabajo(){}
}

object tipa{
  var metros = 8
  method altura() = metros
  method altura(nueva){
    metros = nueva
  }
  method recibirTrabajo(){
    altura() += 1
  }
}