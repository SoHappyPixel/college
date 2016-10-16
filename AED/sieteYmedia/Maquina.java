
public class Maquina extends Jugador{
	


	public Maquina(){}
	public void apostar(Banca banca, int numJugs, int i) {
		System.out.println(toString());
		
		double maximaAp=0; //Establecemos una cantidad como apuesta máxima dependiendo del numero de jugadores y su dinero para que todos puedan realizar apuestas.
		if((banca.getMonedero()-banca.getCaja())/2<getDinero()){
			maximaAp=(banca.getMonedero()-banca.getCaja())/((numJugs-1-i)*2);
		}else{
			maximaAp=getDinero();
		}
		System.out.print(getNomJug()+" está realizando su apuesta...\n");
		setApuesta(maximaAp);
			
		banca.setCaja((getApuesta())*2); //Aseguramos que la banca tiene fondos para pagarle al jugador CPU si gana.
	}
	public void jugar(Banca banca){ //Turno de un jugador CPU en la partida.
		while(getPlantarse()==true){
			System.out.println(toString()); //Muestra los datos del jugador
			System.out.println("Plantarse: Pulse 1 \nPedir carta: Pulse 2");
			System.out.print(getNomJug()+", por favor Seleccione una opción: \nPlantarse: Pulse 1 \nPedir carta: Pulse 2\n\nOpción: ");
			int op=0;
			if(getValorMano()<7.5){
				op=2; //Mientras no llegue a 7.5, seguirá pidiendo cartas.
				System.out.print("2\n");
			}else{
				op=1; //Sus tantos son 7.5 o más, se planta.
				System.out.print("1\n");
			}					
			
			if(op==2){
				cogeCarta(banca.repartir());
				System.out.println(getMano());
				System.out.print("Repartiendo carta...\n");
				
			}else{
				System.out.println("\n"+getNomJug()+" se planta");
				setPlantarse(false);
			}
		}
	}
	
}
