// A correct implementation of a producer and consumer.
package CDI.Cuatro;
///Clase que representa al árbitro.
public class Master
{
	///Numero total de jugadores.
	public static int all;
	///Control del turno actual.
	public static int turn = 0;
	///Conteo de golpes a la pelota.
	public static int value = 0;
	///Para por tiempo.
	public static long stop = 300;
	///Bandera de fin de juego.
	public static boolean end = false;
	///Bandera de semáforo.
	public static boolean flag = false;
	///Acceso principal al programa.
	public static void main(String args[])
	{
		///Medicioón inicial del tiempo.
		long time = System.currentTimeMillis();
		///Captura parametros introducidos por consola.
		int pN = Integer.parseInt(args[0]);
		Master.all = pN;
		///Contenedor para jugadores.
		Player[] aP = new Player[Master.all];
		///Creación y guardado de jugadores.
		for(int i=0; i<pN; i++)
		{
			Player p = new Player(i);
			aP[i]=p;
		}
		///Creación de la pelota.
		Ball b = new Ball(aP);
		///Evaluación del estado del juego.
		while(true)
		{
			///Control de tiempo por instante.
			//DESCOMENTAR para activar parada por tiempo.
			// long now = System.currentTimeMillis()-time;
			///Parada por número de toques.
			if(Master.value >= 600)
			{
				for(Player p : aP) p.end();
			}
			///Parada por tiempo transcurrido.
			//DESCOMENTAR para activar parada por tiempo.
			// else if(now>Master.stop)
			// {
				// for(Player p : aP) p.end();
			// }
			///Parada de la pelota.
			b.end();
			///Si se activa la bandera de fin de juego abandonamos el bucle para dar por temrinado el programa.
			if(Master.end) break;
		}
		///Calculo del tiempo total de ejecución.
		long now = System.currentTimeMillis()-time;
		System.out.println(">> Ha tardado: "+now);
	}
}
