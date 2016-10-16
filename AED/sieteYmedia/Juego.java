public class Juego {
	private static int numJugs=0; //Personas(Humano)
	private static int numMaqs=0; //Jugadores controlados por la maquina(CPU)
	
	public static int getNumJugs() {
		return numJugs;
	}
	
	public static int getNumMaqs() {
		return numMaqs;
	}
	
	public static void setNumJugs(int numJugs) {
		Juego.numJugs = numJugs;
	}
	
	public static void setNumMaqs(int numMaqs) {
		Juego.numMaqs = numMaqs;
	}
	
	public static void main(String []args){
		System.out.println("BIENVENIDO AL JUEGO DE LAS SIETE Y MEDIA:\n\nMinimo: 2 Jugadores\nMaximo: 8 Jugadores\n" +
				"\n-La banca ser�� un jugador de tipo Humano, es decir, controlado por una persona.\n");
		
		setNumJugs((int) ES.pedirNumero("\nIntroduce el numero de jugadores totales de la partida(incluyendo Humanos, CPUs y Banca): ", "Numero de jugadores", 2, 8, true));//Pedimos el n��mero de jugadores entre 2 y 8.
		setNumMaqs((int) ES.pedirNumero("\n��Cuantos de ellos ser��n controlados por la maquina? ", "Numero de jugadores CPU", 0, numJugs-1, true));
		System.out.println("\nNumero de jugadores: " + numJugs );
		
		//Creamos los jugadores y la banca
		Jugador [] jugadores = new Jugador [numJugs];
		
		System.out.println("Existir� un jugador pr�ctica? S�: 0 / No: 1.");
		int i= (int) ES.pedirNumero("\n", "Opic�n:",0 ,1, true);
		if (i==0){
			jugadores[i]=new Principiante();
			jugadores[i].setNomJug("Principiante");
			jugadores[i].setDinero(99999.9999);
			
			i++;
		}
		else
			i=0;
		while(i<numJugs-1){
			if(i<numJugs-numMaqs-1){
				System.out.println("\nInscribiendo jugador Humano en la partida..");
				jugadores[i]=new Humano();
			}else{
				System.out.println("\nInscribiendo jugador CPU en la partida..");
				jugadores[i]=new Maquina();
			}
			jugadores[i].setNomJug(ES.pedirCadena("\nIntroduce el nombre del jugador n��mero "+(i+1)+": "));
			jugadores[i].setDinero(ES.pedirNumero("Introduce una cantidad de dinero para "+jugadores[i].getNomJug()+" (entre 5 y 2000 ���): ", "Dinero disponible del jugador", 5 , 2000, true));
			i++;
		}
	
		Banca banca = new Banca();
		int op= (int) ES.pedirNumero("\n��Quiere que la banca juegue con la cantidad predeterminada de dinero ("+(2*5*numJugs)+"���)?\nSi: Pulse 1\nNo: Pulse 2\n\nElecci��n: ","Si: 1\nNo: 2\n\nElecci��n: ", 1, 2, false);
		
		if(op==2){
			banca.setMonedero(ES.pedirNumero("\nIntroducir cantidad de dinero de la Banca (m��nimo "+(2*5*numJugs)+"���, m��ximo "+(2*2000*numJugs)+"���): ", "Dinero disponible de la banca", (5*(numJugs-1)*2), (2000*(numJugs-1)*2), true));
		}else{
			banca.setMonedero(2*5*numJugs);
		}
		//Llamamos a juego para comenzar una partida
		juego(jugadores, banca);
		
	}
	
	public static void juego(Jugador[] jugadores, Banca banca){
		
		banca.reinicio(); //Creamos baraja
		for(int i=0; i<getNumJugs()-1; i++){ 
			jugadores[i].newMano(); //Creamos las manos de los jugadores. En caso de reinicio, las vaciamos.
		}
		for(int i=0; i<getNumJugs()-1; i++){
			jugadores[i].cogeCarta(banca.repartir());
		}
		banca.repartirBanca();
		
		for(int i=0; i<numJugs-1; i++){ //Cada iteraci��n de este bucle es un turno de un jugador en el que apuesta y juega.
			jugadores[i].apostar(banca, numJugs, i);
			jugadores[i].jugar(banca);
		}
		
		
		while (banca.getPlantarse()){
			verMesa(jugadores,banca);
			System.out.println(banca.toString());
			System.out.println("Plantarse: pulse 1 \nPedir carta: pulse 2");
			int op=(int)ES.pedirNumero("Banca, seleccione una opci��n: ", "Plantarse: 1 \nPedir carta: 2\n\nOpci��n: ", 1, 2, false);
							
			
			if(op==2){ //Coge carta.
				banca.repartirBanca();
			}else{
				System.out.println("\nLa banca se planta");
				banca.setPlantarse(false);
			}
		}
		
		for(int i=0; i<numJugs-1; i++){
			System.out.println(banca.gestionApuestas(jugadores[i]));//Llamamos a gestionApuestas para actualizar los saldos y mostrar por pantalla los resultados de la partida.
			
		}
		System.out.println("\n----------------------------------------------------------------------------------------------------\n");
		System.out.println("Saldo actual de los jugadores: \n");
		for(int i=0; i<numJugs-1; i++){
			
			System.out.println(jugadores[i].getNomJug()+" tiene: "+jugadores[i].getDinero()+"���");
			if(jugadores[i].getDinero()<5){ //Comprobamos que el jugador puede seguir jugando.
				System.out.println("\n"+jugadores[i].getNomJug()+", no tienes suficiente dinero para jugar otra ronda");
				System.out.println(jugadores[i].getNomJug()+" abandon�� la partida.");
				numJugs=eliminarJugadores(jugadores, i);
				i--;
			}
		}
		System.out.println("Saldo de la banca: "+banca.getMonedero()+"���\n");
		if(banca.getMonedero()<(2*5*numJugs)){ 	//Comprobamos que la banca puede seguir jugando.
			System.out.println("La banca no dispone de fondos para continuar la partida.\nGAME OVER\n");
			System.out.println("Gracias por jugar, hasta la proxima!");
			System.exit(0);
		}
		
		System.out.println("\n----------------------------------------------------------------------------------------------------\n"+
							"\nBanca");
		System.out.println("Fondos restantes: "+banca.getMonedero());
		for(int i=0; i<numJugs-1; i++){//se pregunta si se desea volver a jugar a cada jugador
			int op=0;
			if(jugadores[i] instanceof Maquina){
				op=1;
			}else{
				op=(int)ES.pedirNumero("\n----------------------------------------------------------------------------------------------------\n"
						+"��"+jugadores[i].getNomJug()+", quieres jugar de nuevo?\nSi: 1\nNo: 2\nOpci��n: ", "Si: 1\nNo: 2\n\nOpci��n: ", 1, 2, false);
				
			}
			if(op==2){ //Se elimina al jugador.
				System.out.println(jugadores[i].getNomJug()+" se ha ido de la partida");
				numJugs=eliminarJugadores(jugadores, i);
				i--;
			}
		}
		juego(jugadores, banca); //Se vuelve a jugar.
	}
	public static int eliminarJugadores(Jugador[] jugadores, int i){
		if ((numJugs-1)>1){
			numJugs--;
			if(jugadores[i] instanceof Maquina){
				numMaqs--;
			}
			while(i<numJugs-1){
				jugadores[i]=jugadores[i+1];
				i++;
			}
			jugadores[i]=null;
			setNumJugs(numJugs--);
		}else{
			jugadores[i]=null;
			System.out.println("No hay jugadores suficientes\nGAME OVER\n\nHasta la pr��xima!");
			System.exit(0);
		}
		return numJugs;
	}
	public static void verMesa(Jugador[]jugador, Banca banca){//muestra todos las cartas que estan en la mesa
		int numMaxCartas=0;
		int numChar;
		String mesa="-------------------------------------------------------------------------------------------------------\n\nMesa:\n\n";
		for(int cont=0; cont<getNumJugs()-1; cont++){
			mesa += "Mano de "+jugador[cont].getNomJug()+": ";
			numChar=18-jugador[cont].getNomJug().length();
			for(int contNumEspa=0; contNumEspa<numChar; contNumEspa++){
				mesa+=" ";
			}
			if(numMaxCartas<jugador[cont].getNumCartasMano()){//selecciona el mayor n��mero de cartas comprobando con banca
				numMaxCartas=jugador[cont].getNumCartasMano();
			}
		}
		if(numMaxCartas<banca.getNumCartasMano()){//selecciona el mayor n��mero de cartas comprobando con banca
			numMaxCartas=banca.getNumCartasMano();
		}
		mesa += "Mano de Banca: ";
		for(int i=0; i<numMaxCartas; i++){
			mesa+="\n";
			for(int j=0; j<numJugs-1 ; j++){
				
				if(i<jugador[j].getNumCartasMano()){
					mesa += jugador[j].getCopiaMano()[i];
					numChar=28-jugador[j].getCopiaMano()[i].toString().length();
					for(int contNumEspa=0; contNumEspa<numChar; contNumEspa++){
						mesa+=" ";
					}
				}else{
					numChar=28;
					for(int contNumEspa=0; contNumEspa<numChar; contNumEspa++){
						mesa+=" ";
					}
				}
			}
			if(i<banca.getNumCartasMano()){
				mesa +=banca.getManoBanca()[i];
			}
		}
		System.out.print(mesa+"\n");
	}
}
				
