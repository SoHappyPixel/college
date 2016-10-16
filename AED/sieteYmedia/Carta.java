
public class Carta {

	private int num;
	private String palo;
	private double valor;
	
	//constructor
	public Carta( int n, String p, double v){
		
		num=n;
		palo=p;
		valor=v;
	}
	
	public int getNum(){
		return num;	
	}
	public String getPalo(){
		return palo;
	}
	public double getValor(){
		return valor;
	}
	
	public String toString(){
		
		return (num+" de "+palo+" :"+valor+"tantos.");
	}

}

