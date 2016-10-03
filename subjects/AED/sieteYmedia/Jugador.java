
public abstract class Jugador {
	private int numCartasMano;
	private double apuesta;
	private double dinero;
	private Carta [] mano;
	private String nomJug;
	private boolean plantarse;
	
	//constructor
	public Jugador(){
		mano = null;
		numCartasMano = 0;
		apuesta = 0;
		dinero = 0;
		nomJug = null;
		plantarse=true;
	}
	
	//getters-------------------------------
	public int getNumCartasMano(){
		return numCartasMano;
	}
	
	public double getApuesta(){
		return apuesta;
	}
	
	public double getDinero() {
		return dinero;
	}
	
	public String getMano(){
		String m="";
		for(int cont=0; cont<numCartasMano; cont++){
			m+=("\n"+mano[cont]);
		}
		return m;
	}
	
	public Carta[] getCopiaMano(){
		return mano;
	}
	
	public double getValorMano(){
		double valor=0;
		for(int cont=0; cont<numCartasMano; cont++){
			valor+=mano[cont].getValor();
		}
		return valor;
	}
	
	public String getNomJug(){
		return nomJug;
	}

	public boolean getPlantarse() {
		return plantarse;
	}
	
	//setters---------------------------------
	public void setApuesta(double ap){
		apuesta=ap;
	}
	
	public void setDinero(double d) {
		this.dinero = d;
	}
	
	public void setNomJug(String nombre){
		nomJug=nombre;
	}
	
	public void setPlantarse(boolean plant) {
		this.plantarse = plant;
	}
	//-----------------------------------------
	public void ganaApuesta(double ganancia){
		dinero+=ganancia;
	}
	
	public void pierdeApuesta(){
		dinero-=apuesta;
	}
	
	public void newMano() {
		mano = new Carta[14];
		numCartasMano=0;
		plantarse=true;
	}
	public void cogeCarta(Carta c){	
		mano[numCartasMano++] = c;
	}
	
	public String toString(){
		return("\n---------------\nTurno de "+
				getNomJug()+"\n---------------\nMano:\n"+getMano()+"\n\nValor de la mano: "+getValorMano()) +"\n\nApuesta actual: "+getApuesta()+"\n\n";	
	}
	
	public abstract void apostar(Banca banca, int numJugs, int cont);
	public abstract void jugar(Banca banca);
	public void subirApuesta(double pedirNumero){
		System.out.println("\nIntroduzaca el valor a a�adir:");
		apuesta=getApuesta()+pedirNumero;
	}
}
