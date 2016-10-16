///Práctica tres de la asignatura CDI.
package CDi.Tres;
///Clase que maneja los hilos para la primera parte de la práctica.
public class T1 extends Thread
{
	///Variable para contener el objeto de la clase Cont.
	private Cont co;
	///Constructor de T1.
	T1(Cont co){ this.co = co; }
	///Método principal del hilo.
	@Override
	public void run()
	{
		///Conversion a entero del nombre del hilo.
		int n = Integer.parseInt(Thread.currentThread().getName());
		///Realiza un incremento en caso de que el número del hilo sea par.
		if(n%2==0) co.incrementar(n);
		///Realiza un decremento en caso de que el número del hilo sea impar.
		else co.decrementar(n);
		///Mustra el valor obtenido de la modificación.
		System.out.println("Hilo "+Thread.currentThread().getName()+": "+co.valor());
	}
}
