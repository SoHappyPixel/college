package Dos;

public class CalcT extends Thread
{
	private int[] a;
	private int[] b;
	private int[] c;
	private int size;
	private int[] aux;

	CalcT(int[] c, int[] a, int[] b, int size)
	{
		this.c = c;
		this.a = a;
		this.b = b;
		this.size = size;
	}

	@Override
	public void run()
	{
		///Cálculo de los valores de una fila
		for(int col=0; col<size; col++){ c[col] = a[col] + b[col]; }
	}
}