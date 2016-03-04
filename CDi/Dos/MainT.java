package Dos;

public class MainT
{
	public static void main(String[] args) 
	{
		///Registro del tiempo inicial
		long time = System.currentTimeMillis();

		int size = Integer.parseInt(args[0]);
		int type = Integer.parseInt(args[1]);

		///Creación de las 3 Matrices con las que trabajaremos.
		MatrixT m1 = new MatrixT(size,type);
		MatrixT m2 = new MatrixT(size,type);
		MatrixT m3 = new MatrixT(size,type);

		///Llamada al método que suma.
		m3.sumM(m1,m2);

		///Volcado del tiempo total.
		System.out.println("\nT. de ejecución: "+(System.currentTimeMillis()-time));
	}
}
