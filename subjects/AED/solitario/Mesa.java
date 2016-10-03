public class Mesa {
	// Atributos
	private MontonFinal[] arrayMF;
	private MontonIntermedio[] arrayMI;
	private MontonDescarte descarte;
	private Baraja baraja;

	// getters
	public MontonFinal getArrayMF(int i) {
		return arrayMF[i];
	}

	public MontonIntermedio getArrayMI(int i) {
		return arrayMI[i];
	}

	public MontonDescarte getDescarte() {
		return descarte;
	}

	public Baraja getBaraja() {
		return baraja;
	}

	// constructor
	public Mesa() {
		baraja = new Baraja();
		arrayMF = new MontonFinal[4];
		arrayMI = new MontonIntermedio[4];
		for (int i = 0; i < 4; i++) {
			arrayMI[i] = new MontonIntermedio();
			arrayMF[i] = new MontonFinal();
		}
		descarte = new MontonDescarte();
	}

	public String toString() {
		String toret = " ";
		toret += baraja.toString();
		for (int i = 0; i < 4; i++) {
			toret += "\n\nMonton Final " + i + ":";
			Carta c = arrayMF[i].getCarta();
			toret += c != null ? c : " monton vacio ";
		}
		for (int i = 0; i < 4; i++) {
			toret += "\n\nMonton Intermedio " + i + ":";
			Carta c = arrayMI[i].getCarta();
			toret += c != null ? c : " monton vacio ";

		}

		toret += "\n\nDescarte: " + descarte.toString();

		System.out.println(toret);
		return toret;
	}

}
