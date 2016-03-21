package CDi.Tres;

///Clase principal para la ejecución del programa.
public class Main1
{
	///Primer método que se ejecuta del programa.
	public static void main(String[] args) throws InterruptedException
	{
		///Captura de los parametros introducidos por consola.
		int size = Integer.parseInt(args[0]);

		///Pila de hilos
		Thread[] aT = new Thread[size];

		//Creación de un objeto Contador.
		Cont co = new Cont();

		///Creación de los hilos
		for(int row=0; row<size; row++)
		{
			///Nombre del hilo.
			String name = String.valueOf(row);
			///Creación del hilo.
			Thread t = new Thread(new T1(co),name);
			///Almacenaje del hilo en la pila.
			aT[row]=t;
			///Arranque del hilo.
			t.start();
		}

		///Sincronización de los hijos en el padre.
		for(Thread t : aT){ t.join(); }
	}
}
