package Dos;

public class MainS
{
	public static void main(String[] args)
	{
		///Registro del tiempo inicial
		long time = System.currentTimeMillis();

		int size = Integer.parseInt(args[0]);
		int type = Integer.parseInt(args[1]);

		///Creación de las 3 Matrices con las que trabajaremos.
		MatrixS m1 = new MatrixS(size,type);
		MatrixS m2 = new MatrixS(size,type);
		MatrixS m3 = new MatrixS(size,type);

		///Llamada al método que suma.
		m3.sumM(m1,m2);

		///Volcado del tiempo total.
		System.out.println("\nT. de ejecución: "+(System.currentTimeMillis()-time));
	}
}
