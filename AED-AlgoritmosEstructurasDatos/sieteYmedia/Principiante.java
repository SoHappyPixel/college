
public class Principiante extends Jugador{
	public Principiante(){}
	public void apostar(Banca banca, int numJugs, int i){
		System.out.println(toString());
		System.out.println("\nSe aceptan cantidades con decimales en las apuestas.\nLa apuesta m�nima es de 5�");
		 
		double maximaAp=0; //Establecemos una cantidad como apuesta m��xima dependiendo del numero de jugadores y su dinero para que todos puedan realizar apuestas.
			maximaAp=getDinero();
		System.out.println("Apuesta m�xima: "+maximaAp+"�");
		setApuesta(ES.pedirNumero("Introduzca la cantidad que desea apostar: ", "Apuesta",5 ,maximaAp, true));
		
		banca.setCaja((getApuesta())*2); //Aseguramos que la banca tiene fondos para pagarle al jugador si gana.
		
	}
	public void jugar(Banca banca){ //Turno de un jugador Humano en la partida.
		int i=0;
		while(getPlantarse()==true){
			System.out.println(toString());
			System.out.println("Plantarse: 1 \nPedir carta: 2");
			int op=(int)ES.pedirNumero(getNomJug()+", por favor Seleccione una opci�n: ", "Plantarse: Pulse 1 \nPedir carta: Pulse 2\n\nOpci�n: ", 1, 2, false);
			
			if(op==2){
				cogeCarta(banca.repartir()); //El jugador coge una carta
				System.out.println("\nTu mano:");
				System.out.println(getMano());
				System.out.println("\nValor de tu mano:");
				System.out.println(getValorMano());
				System.out.println("\nApuesta actual:");
				System.out.println(getApuesta());
				//Descarte.
				if (getValorMano()>7.5){
					if (i>0){
						System.out.println("No tienes más oportunidades"); setPlantarse(false);
						}
					else{
						banca.reinicio();
						setDinero(99999.9999);
						setApuesta(0);
						newMano();
						cogeCarta(banca.repartir());
						System.out.println("UY! Te has excedido... Aprovecha esta segunda oportunidad:");
						i++;
					}
				}
				else{
					//Incemento.
					System.out.println("\nMen� de incremento de apuesta:\n�Marque la cantidad a incrementar.\n�En caso de no querer incrementarla marque 0.");
					double cantidad=ES.pedirNumero("\n","Sube:",0 ,getDinero(), true);
					if (cantidad!=0)
					subirApuesta(cantidad);
					else
						System.out.println("Su apuesta no se ha modificado...");
					//FinIncremento.
				}
				//FinDesacarte.
				
			}else{
				System.out.println("\n"+getNomJug()+" se ha plantado"); //Avisamos por pantalla de que el jugador se planta
				setPlantarse(false);
			}
		}
	}
}
