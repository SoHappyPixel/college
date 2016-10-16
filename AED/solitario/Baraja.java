

public class Baraja extends Monton {
	// inicializamos la variable al maximo de cartas ee la baraja
	private int numElem = 48;

	// creamos el array para almacenar las cartas
	// private Carta[] baraja;

	// Constructor
	public Baraja() {

		for (int i = 1; i <= 12; i++) {
			insertarCarta((new Carta(i, "oros")));
			insertarCarta(new Carta(i, "copas"));
			insertarCarta(new Carta(i, "espadas"));
			insertarCarta(new Carta(i, "bastos"));
		}
		barajar();

	}
	public void insertarCarta(Carta c){
		cartas.push(c);
	}

	public void barajar() {
		Carta[] auxiliar;
		auxiliar = new Carta[numElem];
		int pos = 0;
		while (!cartas.esVacio()) {
			auxiliar[pos] = cartas.pop();
			pos++;
		}
		int i = 0;
		while (i < numElem) {
			Carta aux = auxiliar[i];
			int aleatorio =  (int) (Math.random() * numElem);
			auxiliar[i] = auxiliar[aleatorio];
			auxiliar[aleatorio] = aux;
			i++;
		}
		for (int j = 0; j < numElem; j++) {
			cartas.push(auxiliar[j]);
		}

	}
	public boolean puedoInsertar(Carta c){
		return true;
	}



	public void volcar(MontonDescarte descarte) {
		while (!descarte.isEmpty()) {
			insertarCarta(descarte.sacarCarta());
		}
	}


	public String toString() {

		return "B";
	}

}
