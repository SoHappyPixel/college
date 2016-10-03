public class Juego {

	/* 1: */public static void movercartaDescarteIntermedio(Mesa m) {

		int posmonton = ES
				.pideNumero("Introduzca el numero del monton intermedio en el que quiere insertar la carta");
		while (posmonton > 3 || posmonton<0) {
			posmonton = ES
					.pideNumero("El numero introducido es incorrecto. Introduzca otro numero");
		}
		Carta c = m.getDescarte().getCarta();

		if (c != null) {
			if (m.getArrayMI(posmonton).puedoInsertar(c)) {

				c = m.getDescarte().sacarCarta();

				m.getArrayMI(posmonton).insertarCarta(c);
			} else {
				System.out.println(" ¡¡¡ MOVIMIENTO ERRONEO !!! ");
			}
		}
	}

	/* 2: */public static void movercartaDescarteFinal(Mesa m) {

		int posmonton = ES
				.pideNumero("Introduzca el numero del monton final en el que quiere insertar la carta");
		while (posmonton > 3 || posmonton<0) {
			posmonton = ES
					.pideNumero("El numero introducido es incorrecto. Introduzca otro numero");
		}

		Carta c = m.getDescarte().getCarta();
		if (c != null) {
			if (m.getArrayMF(posmonton).puedoInsertar(c)) {

				c = m.getDescarte().sacarCarta();

				m.getArrayMF(posmonton).insertarCarta(c);
			} else {
				System.out.println(" ¡¡¡ MOVIMIENTO ERRONEO !!! ");
			}
		}
	}
	
	/* 3: */public static void movercartaIntermedioFinal(Mesa m) {

		int posmontonInt = ES
				.pideNumero("Introduzca el numero del monton intermedio del que quiere sacar la carta");
		while (posmontonInt > 3 || posmontonInt<0) {
			posmontonInt = ES
					.pideNumero("El numero introducido es incorrecto. Introduzca otro numero");
		}
		Carta c = m.getArrayMI(posmontonInt).getCarta();
		int posmontonF = ES
				.pideNumero("Introduzca el numero del monton final en el que quiere insertar la carta");
		while (posmontonF > 3  || posmontonF<0) {
			posmontonF = ES
					.pideNumero("El numero introducido es incorrecto.Introduzca otro numero");
		}
		if (c != null) {
			if (m.getArrayMF(posmontonF).puedoInsertar(c)) {

				c = m.getArrayMI(posmontonInt).sacarCarta();

				m.getArrayMF(posmontonF).insertarCarta(c);
			} else {
				System.out.println(" ¡¡¡ MOVIMIENTO ERRONEO !!! ");
			}
		}
	}

	/* 4: */public static void movercartaFinalIntermedio(Mesa m) {

		int posmontonF = ES
				.pideNumero("Introduzca el numero del monton final  del que quiere sacar la carta");
		while (posmontonF > 3  || posmontonF<0) {
			posmontonF = ES
					.pideNumero("El numero introducido es incorrecto. Introduzca otro numero");
		}
		Carta c = m.getArrayMF(posmontonF).getCarta();
		int posmontonInt = ES
				.pideNumero("Introduzca el numero del monton intermedio en el que quiere insertar la carta");
		while (posmontonInt > 3  || posmontonInt<0) {
			posmontonInt = ES
					.pideNumero("El numero introducido es incorrecto.Introduzca otro numero");
		}
		if (c != null) {
			if (m.getArrayMI(posmontonInt).puedoInsertar(c)) {

				c = m.getArrayMF(posmontonF).sacarCarta();

				m.getArrayMI(posmontonInt).insertarCarta(c);
			} else {
				System.out.println(" ¡¡¡ MOVIMIENTO ERRONEO !!! ");
			}
		}
	}

	/* 5: */public static void movercartaIntermedioIntermedio(
			Mesa m) {
		int posmontonI1 = ES
				.pideNumero("introduzca numero de monton intermedio donde quieres sacara la carta");
		while (posmontonI1 > 3  || posmontonI1<0) {
			posmontonI1 = ES.pideNumero("numero incorrecto, introduzca numero");
		}
		Carta c = m.getArrayMI(posmontonI1).getCarta();
		int posmontonI2 = ES
				.pideNumero("introduzca numero monton intermedio donde quiere insertar carta");
		while (posmontonI2 > 3  || posmontonI2<0) {
			posmontonI2 = ES.pideNumero("numero incorrecto, introduzca numero");
		}
		if (c != null) {
			if (m.getArrayMI(posmontonI2).puedoInsertar(c)) {

				c = m.getArrayMI(posmontonI1).sacarCarta();

				m.getArrayMI(posmontonI2).insertarCarta(c);
			} else {
				System.out.println(" ¡¡¡ MOVIMIENTO ERRONEO !!! ");
			}
		}
	}

	/*6: */ public static void moverCartaBarajaDescarte(Mesa m) {
		if (!m.getBaraja().isEmpty()) {
			Carta c = m.getBaraja().sacarCarta();
			m.getDescarte().insertarCarta(c);
		} else {
			m.getBaraja().volcar(m.getDescarte());
			

		}

	}

	public static void main(String[] args) {

		Mesa mesa = new Mesa();
		
		int opcion;

		do {
			
			mesa.toString();
			System.out
					.println("1.Mover Carta de Descarte a Monton Intermedio\n"
							+ "2. Mover Carta de Descarte a Monton Final\n"
							+ "3. Mover Carta de Monton Intermedio a Monton Final\n"
							+ "4. Mover Carta de Monton Final a Monton Intermedio\n"
							+ "5. Mover carta de Monton Intermedio a Intermedio\n"
							+ "6. Mover baraja descarte\n" + "0. Salir");
			opcion = ES.pideNumero("Introduzca opcion de menu");
			while(opcion<0 || opcion>6){
				opcion = ES
						.pideNumero("opcion incorrecta. Introduzca opcion de menu");
			}
			switch (opcion) {
			case 1:
				movercartaDescarteIntermedio(mesa);
				break;
			case 2:
				movercartaDescarteFinal(mesa);
				break;
			case 3:
				movercartaIntermedioFinal(mesa);
				break;
			case 4:
				movercartaFinalIntermedio(mesa);
				break;
			case 5:
				movercartaIntermedioIntermedio(mesa);
				break;
			case 6:
				moverCartaBarajaDescarte(mesa);
				break;

			}

		} while (opcion != 0);

	}

}
