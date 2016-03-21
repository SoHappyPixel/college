package CDi.Tres;

///Clase principal para la ejecución del programa.
public class Main2
{
	///Primer método que se ejecuta del programa.
	public static void main(String[] args) throws InterruptedException
	{
		///Captura de los parametros introducidos por consola.
		int size = Integer.parseInt(args[0]);

		///Pila de hilos
		Thread[] aT = new Thread[size];

		///Pila de objetos de `B`.
		B[] aB = new B[size];

		//Creación de un objeto Contador.
		A objA = new A();

		///Creación de objetos de la clase B.
		for(int contB=0; contB<size; contB++)
		{
			B objB = new B(objA);
			aB[contB] = objB;
		}


		///Creación de los hilos
		for(int contT=0; contT<size; contT++)
		{
			///Nombre del hilo.
			String name = String.valueOf(contT);
			///Creación del hilo.
			Thread t = new Thread(aB[contT],name);
			///Almacenaje del hilo en la pila.
			aT[contT]=t;
			///Arranque del hilo.
			t.start();
		}

		///Sincronización de los hijos en el padre.
		for(Thread t : aT){ t.join(); }
	}
}
