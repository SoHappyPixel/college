package Tres;

public class Main
{
	public static void main(String[] args)
	{
		///Captura de los parametros introducidos por consola.
		int size = Integer.parseInt(args[0]);
				
		///Pila de hilos
		Thread[] aT = new Thread[size];

		//Creación de un objeto Contador.
		Contador c = new Contador();

		int total = 0;

		///Creación de los hilos
		for(int row=0; row<size; row++)
		{
			String name = String.valueOf(row);
			Thread t = new Thread(new Tl(c,total),name);

			aT[row]=t;
			t.start(); 
		}

		for(Thread t : aT)
		{ 
			try{ t.join(); }
			catch(InterruptedException e){}
		}
	}

}