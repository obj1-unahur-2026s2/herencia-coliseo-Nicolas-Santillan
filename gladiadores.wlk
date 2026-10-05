class Gladiador {
    var vida = 100

    method defensa()

    method defenderse() 

    method puedePelear() {
        return vida > 0
    }

    method atacar(otroGladiador)

    method pelearCon(unGladiador) {
        self.atacar(unGladiador)
        if(unGladiador.puedePelear()) {
            unGladiador.atacar(self)
        }
    }

    method curar(unValor) {
        vida += unValor
    }

    method crearGrupoCon(unGladiador)
}

class Mirmillon inherits Gladiador {
    const arma
    var armadura
    var fuerza

    method destreza() = 15

    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }

    method poderDeAtaque() {
        return arma.poder() + fuerza
    }

    override method atacar(otroGladiador) {
        return otroGladiador.defensa() - self.poderDeAtaque()
    }

    override method defensa() {
        return armadura.puntos() + self.destreza()
    }
}

class Dimachaerus inherits Gladiador {
    const armas = []
    var destreza

    method fuerza() = 10

    method poderDeAtaque() {
        return self.fuerza() + armas.sum({a => a.poder()})
    }

    override method atacar(otroGladiador) {
        return otroGladiador.defensa() - self.poderDeAtaque() destreza += 1
    }

    override method defensa() {
        return destreza / 2
    }

    method agregarArma(nuevaArma) {
        armas.add(nuevaArma)
    }

    method sacarArma(arma) {
        armas.remove(arma)
    }

    override method crearGrupoCon(otroGladiador) {
        return new Grupo ()
    }

}

class Grupo {
    const miembros = []
    var peleas = 0

    method agregarMiembro(unGladiador) {
        miembros.add(unGladiador)
    }

    method sacarMiembro(unGladiador) {
        miembros.remove(unGladiador)
    }

    method miembrosQuePuedenPelear() {
        return miembros.filter({m => m.puedePelear()})
    }

    method elegirCampeon() {
        return self.miembrosQuePuedenPelear().max({m =>m.poderDeAtaque()})
    }
}
