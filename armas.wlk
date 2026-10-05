class Arma {
    method poder()
}

class ArmaDeFilo inherits Arma {
    var filo
    const longitud

    method cambiarFilo(nuevoFilo) {
        filo = nuevoFilo
    }

    override method poder() {
        return filo * longitud
    }
}

class ArmaContundente inherits Arma {
    const peso

    override method poder() {
        return peso
    }
}

class Armadura {
    method puntos(unGladiador)
}

class Casco inherits Armadura {
    override method puntos(unGladiador) = 10
}

class Escudo inherits Armadura {
    override method puntos(unGladiador) {
        return 5 + unGladiador.destreza() * 0.1
    }
}