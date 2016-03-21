package CDi.Tres;

public class B implements Runnable
{
	///Objeto de la clase A.
	A obj;

	///Constructor de la clase B donde recibimos un objeto de la clase A.
	B(A obj){ this.obj = obj; }

	///Método a lanzar en la invocación del hilo.
	public void run()
	{
		try{ obj.EnterAndWait(); }
		catch(InterruptedException e){}
	}
}
