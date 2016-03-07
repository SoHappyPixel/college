///Paquete para la segunda práctica de CDI
package Dos;

///Definición de la matriz para ejecución secuencial.
public class MatrixS
{

	private int[][] m;
	private int size = 0;

	///Constructor de la matriz para secuencial que recibe los datos enviados por consola.
	MatrixS(int size, int type)
	{
		this.size = size;
		this.m = new int[size][size];
		///Si el segundo parametro enviado por consola es 0=random, 1=tamaño, 2=identidad.
		switch (type) 
		{
			case 0: randM(); break;
			case 1: equalM(); break;
			case 2: identityM(); break;
		}
	}

	///Operar la matriz.
	public void sumM(MatrixS mA, MatrixS mB)
	{
		for(int i=0; i<size; i++)
			for(int j=0; j<size; j++)
				this.m[i][j] = mA.m[i][j] + mB.m[i][j];
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
