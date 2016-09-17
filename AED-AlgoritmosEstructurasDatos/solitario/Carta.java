
public class Carta {
	//Variables
		private String palo;
		private int numero;

	//Cosntructor( numero y palo)
		public Carta(int num, String pal){
			palo=pal;
			numero=num;
			
		}
	//getters
		public String getPalo(){
			return palo;
		}
		public int getNumero(){
			return numero;
		}
		
	//setters
		//las cartas no se modifican
	//toString
		public String toString(){
			return "[" + getNumero() + "]" + "["+ getPalo() + "]";
		}
	
	

}
