///Paquete para la segunda práctica de CDI.
package Pract2;
///Definición del hilo que calcula la suma.
public class CalcT extends Thread
{
	///Fila operando 1
	private int[] a;
	///Fila operando 2
	private int[] b;
	///Fila resultado
	private int[] c;
	///Tamaño de la fila
	private int size;
	///Constructor del hilo CalcT.
	CalcT(int[] c, int[] a, int[] b, int size)
	{
		this.c = c;
		this.a = a;
		this.b = b;
		this.size = size;
	}
	///Conjuntos de sentencias a ejecutar por el hilo.
	@Override
	public void run()
	{
		///Cálculo de los valores de una fila
		for(int col=0; col<size; col++){ c[col] = a[col] + b[col]; }
	}
}
