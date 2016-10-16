
public class Banca {
	
	private Baraja baraja;
	private int numCartasMano;
	private Carta [] manoBanca;
	private double monedero;
	private double caja;
	private boolean plantarse;
	private int numCartasBaraja;
	
	//constructor
	public Banca(){
		baraja=null;
		manoBanca = null;
		numCartasMano = 0;
		monedero=0;
		caja=0;
		plantarse=true;
		numCartasBaraja=0;
	}

	//getters-----------------------------------------------------------
	public int getNumCartasMano(){
		return numCartasMano;
	}
	
	public Carta[] getManoBanca() {
		return manoBanca;
	}

	public double getMonedero() {
		return monedero;
	}

	public double getCaja() {
		return caja;
	}

	public boolean getPlantarse() {
		return plantarse;
	}

	public int getNumCartasBaraja() {
		return numCartasBaraja;
	}
	
	Carta[] getCopiaMano(){
		return manoBanca;
	}
	
	public double getValorMano(){
		double valor=0;
		for(int cont=0; cont<numCartasMano; cont++){
			valor+=manoBanca[cont].getValor();
		}
		return valor;
	}

	public String getMano(){
		String m="";
		for(int cont=0; cont<numCartasMano; cont++){
			m+=("\n"+manoBanca[cont]);
		}
		return m;
	}
	

	//setters--------------------------------------------------------------
	public void setCaja(double apuesta) {
		caja += apuesta;
	}

	public void setNumCartasMano(int numCartasMano) {
		this.numCartasMano = numCartasMano;
	}
	
	public void setMonedero(double monedero) {
		this.monedero = monedero;
	}
	
	public void setPlantarse(boolean plant) {
		this.plantarse = plant;
	}
	
	//----------------------------------------------------------------------
	public Carta repartir(){ 
		numCartasBaraja--;
		return baraja.getCarta();
	}
	
	public void repartirBanca(){
		cogerCarta(baraja.getCarta());
		numCartasBaraja--;
	}

	public void reinicio() { //Reiniciamos la baraja
		baraja = new Baraja ();
		manoBanca = new Carta[14];
		numCartasMano = 0;
		plantarse=true;
		numCartasBaraja=40;
	}

	public String gestionApuestas(Jugador Jug){
		double valorManoJug = Jug.getValorMano();
		double valorBanca=0;
		double apuesta = Jug.getApuesta();
		for(int i=0; i<numCartasMano; i++){
			valorBanca+=manoBanca[i].getValor();
		}
		if(valorBanca==7.5 || valorBanca==valorManoJug || valorManoJug>7.5 || (valorManoJug<valorBanca && valorBanca<7.5)){ //Casos en los que pierde el jugador.
			Jug.pierdeApuesta();
			monedero+=apuesta;
			caja-=apuesta*2;
			return ("\nMano de "+Jug.getNomJug()+":\n"+Jug.getMano()+"\n\nMano de banca:\n"+getMano()+"\n\n"+Jug.getNomJug()+
					" ha perdido\n"+"Dinero perdido: "+apuesta+"\nDinero restante: "+Jug.getDinero()+"\n");
		//Casos en los que el jugador gana.
		}else if (valorManoJug==7.5){
			Jug.ganaApuesta(apuesta*2);
			monedero-=(apuesta*2);
			caja-=apuesta*2;
			return ("\nMano de "+Jug.getNomJug()+":\n"+Jug.getMano()+"\n\nMano de banca:\n"+getMano()+"\n\n"+"Felicidades "+Jug.getNomJug()+
					" has conseguido siete y media!\n"+"Ganancias: "+apuesta*2+"€\nDinero restante: "+Jug.getDinero()+"€\n");
		}else{
			Jug.ganaApuesta(apuesta);
			monedero-=apuesta;
			caja-=apuesta*2;
			return ("\nMano de "+Jug.getNomJug()+":\n"+Jug.getMano()+"\n\nMano de banca:\n"+getMano()+"\n\n"+"Enhorabuena "+Jug.getNomJug()+
					" has ganado tu apuesta con la banca!\n"+"Ganancias: "+apuesta+"€\nDinero restante: "+Jug.getDinero()+"€\n");
		}
		
	}

	public void cogerCarta(Carta c){	
		manoBanca[numCartasMano++] = c;
	}
	
	public String toString(){
		return("\nTurno de Banca\n\nMano:"+getMano()+"\n\nValor de la mano: "+getValorMano());
	}

}