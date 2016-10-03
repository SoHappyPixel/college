import java.util.Random;
import java.util.Stack;

public class Baraja {

	private Stack <Carta> baraja; 	//Pila de cartas
	private int numCartas=40;
	private int numCartActuales;
	
	//constructor
	public Baraja (){
	
		baraja = new Stack <Carta> ();
		
		for (int j = 1; j <=7; j++){
			baraja.push(new Carta (j,"oros",j));
		}
		for (int j = 10; j <=12; j++){
			baraja.push(new Carta (j,"oros",0.5));
		}
		for (int j = 1; j <=7; j++){
			baraja.push(new Carta (j,"copas",j));
		}
		for (int j = 10; j <=12; j++){
			baraja.push( new Carta (j,"copas",0.5));
		}
		for (int j = 1; j <=7; j++){
			baraja.push(new Carta (j,"espadas",j));
		}
		for (int j = 10; j <=12; j++){
			baraja.push(new Carta (j,"espadas",0.5));
		}
		for (int j = 1; j <=7; j++){
			baraja.push( new Carta (j,"bastos",j));
		}
		for (int j = 10; j <=12; j++){
			baraja.push(new Carta (j,"bastos",0.5));
		}
		
		numCartActuales=numCartas;
		barajarCartas();
	
}	
	//Método para barajar las cartas de la baraja de forma aleatoria
	private void barajarCartas (){
		
		Random bc= new Random();
		Stack <Carta> cartasBarajadas=new Stack <Carta>(); //Nueva baraja para introducir las cartas barajadas
		
		for (int n= 0; n<40; n++){
			int indiceCarta=bc.nextInt(numCartActuales);	
			cartasBarajadas.push(baraja.elementAt(indiceCarta));
		
			baraja.remove(indiceCarta); //Con remove borramos la carta asignada del monton de cartas de la baraja principal
			numCartActuales--; //Restamos 1 al numero de cartas de la Baraja "baraja"
		
		}
		numCartActuales= numCartas;
		baraja=cartasBarajadas;
	
	}
	
	public Stack <Carta> getBaraja(){
		return baraja;
	}
	
	public Carta getCarta(){ 	// Sacamos una carta de la baraja
			
		if (numCartActuales!=0){
		numCartActuales--;
		return baraja.pop();
		}
		else return null;
	}
		
	
}
