package Dos;

public class MatrixS
{

	private int size = 0;
	private int[][] m;

	MatrixS(int size, int type)
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
	public void sumM(MatrixS mA, MatrixS mB)
	{
		for(int i=0; i<size; i++)
			for(int j=0; j<size; j++)
				this.m[i][j] = mA.m[i][j] + mB.m[i][j];
	}
	///Mostrar la matriz.
	public void showM()
	{
		for(int i=0; i<size; i++)
		{
			for(int j=0; j<size; j++)
			{
				System.out.print(this.m[i][j]+".");
			}
			System.out.println();
		}
	}

	///Rellenar la matriz.
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
	public void equalM()
	{
		for(int i=0; i<size; i++)
			for(int j=0; j<size; j++)
				this.m[i][j] = size;
	}
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
