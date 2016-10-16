import java.util.Scanner;

public class ES {
	
	public static Scanner Leer = new Scanner(System.in);

	public static String pedirCadena(String mensPeticion){
		// Muestra el mensaje que pide la cadena
		System.out.print(mensPeticion);
		//Lee la cadena
		return Leer.nextLine();

	}
	
	public static double pedirNumero(String mens, String mens2,  double min, double max, boolean b){ //Pedimos un numero y no lo leemos hasta saber que es valido.
		System.out.print(mens);
		String aux=Leer.nextLine();
		while (!esNumero(aux) || !numValido(aux, min, max)){
			if(!b){
				System.out.print("\n"+aux+" no es válido, por favor introduzca una opción válida.\n\n");
				System.out.print(mens2);
			}else if(b){
				System.out.print("\n"+aux+" no es válido, por favor introduzca un número válido.\n\n");
				System.out.print(mens2+" (de "+(int)min+" a "+(int)max+"): ");
			}
			aux=Leer.nextLine();
		}
		return Double.parseDouble(aux);
	}
	//Comprobamos que se ha introducido un número válido
	private static boolean numValido(String mens, double min, double max){
		double aux = Double.parseDouble(mens);
		return !(aux<min || aux>max);
	}
	
	private static boolean esNumero(String mens){ //Aquí comprobamos que se inserta un número. Usamos "." para las cantidades con decimales.
		if(mens.length()==0 || mens.startsWith(".") || mens.endsWith(".")){
			return false;
		}
		int i=0;
		int numPuntos=0;
		//Recorremos la cadena y devolvemos falso si no hay un número ni un "." o hay más de un carácter ".".
		while (i<mens.length()){
			if(mens.charAt(i)=='.'){
				numPuntos++;
			}
			if((mens.charAt(i)<'0' || mens.charAt(i)>'9') && mens.charAt(i)!='.' || numPuntos > 1){
				return false;
			}
			i++;
		}
		return true;
	}
}