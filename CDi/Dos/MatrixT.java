///Paquete para la segunda práctica de CDI.
package Dos;

///Definición de la matrix para ejecución con hilos.
public class MatrixT
{
	private int[][] m;
	private int size = 0;

	///Constructor de la matriz para hilos que recibe los datos enviados por consola.
	MatrixT(int size, int type)
	{
		this.size = size;
		this.m = new int[size][size];

		switch (type) 
		{
			case 0: randM(); break;
			case 1: equalM(); break;
			case 2: identityM(); break;
		}
	}

	///Operar la matriz.
	public void sumM(MatrixT a, MatrixT b)
	{
		Thread[] aT = new Thread[size];

		for(int row=0; row<size; row++)
		{
			String name = String.valueOf(row);
			CalcT ct = new CalcT(this.m[row],a.m[row],b.m[row],size);
			Thread t = new Thread(ct,name);
			aT[row]=t; t.start(); 
		}

		for(Thread t : aT)
		{ 
			try{ t.join(); }
			catch(InterruptedException e){}
		}
	}
	///Rellenar la matriz con numeros aleatorios.
	public void randM()
	{
		int rand = 0;
		for(int i=0; i<size; i++)
			for(int j=0; j<size; j++)
			{
				rand = (int)(Math.random()*100);
				this.m[i][j] = rand;
			}
	}
	///Rellenar la matriz con un número igual al tamaño.
	public void equalM()
	{
		for(int i=0; i<size; i++)
			for(int j=0; j<size; j++)
				this.m[i][j] = size;
	}
	///Rellenar la matriz para que sea la matriz identidad.
	public void identityM()
	{
		for(int i=0; i<size; i++)
			for(int j=0; j<size; j++)
			{
				if(i==j) this.m[i][j] = 1;
				else this.m[i][j] = 0;
			}
	}
}
