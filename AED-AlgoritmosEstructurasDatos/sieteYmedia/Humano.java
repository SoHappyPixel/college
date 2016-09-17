
public class Humano extends Jugador{
	public Humano(){}
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
		while(getPlantarse()==true){
			System.out.println(toString());
			System.out.println("Plantarse: 1 \nPedir carta: 2");
			int op=(int)ES.pedirNumero(getNomJug()+", por favor Seleccione una opci�n: ", "Plantarse: Pulse 1 \nPedir carta: Pulse 2\n\nOpci�n: ", 1, 2, false);

			if(op==2){
				cogeCarta(banca.repartir()); //El jugador coge una carta
				System.out.println("\nTu mano:");
				System.out.println(getMano());
				//Inremento apuesta.
				System.out.println("\nMen� de incremento de apuesta:\n�Marque la cantidad a incrementar.\n�En caso de no querer incrementarla marque 0.");
				double cantidad=ES.pedirNumero("\n","Sube:",0 ,getDinero(), true);
				if (cantidad!=0)
				subirApuesta(cantidad);
				else
					System.out.println("Su apuesta no se ha modificado...");
				//Fin Incremento apuesta.
			}else{
				System.out.println("\n"+getNomJug()+" se ha plantado"); //Avisamos por pantalla de que el jugador se planta
				setPlantarse(false);
			}
		}
	}
}
