
import java.util.Scanner;

public class ES {
	 public static Scanner leer= new Scanner(System.in);
	
	 public static String pideCadena(String mensaje){
	 
	 //Poner el mensaje
	 System.out.print (mensaje);
	 //Pedir
	 return leer.nextLine();
	}
	public static int pideNumero(String mensaje){
			System.out.print(mensaje);
			
			//pedir
			return Integer.parseInt(leer.nextLine());
	}
	
	

}
