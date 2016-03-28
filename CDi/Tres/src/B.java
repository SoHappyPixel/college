///Práctica tres de la asignatura CDI.
package CDi.Tres;
///Clase B para interfaz Runnable.
public class B implements Runnable
{
	///Objeto de la clase A.
	A obj;
	///Constructor de la clase B donde recibimos un objeto de la clase A.
	B(A obj){ this.obj = obj; }
	///Método a lanzar en la invocación del hilo.
	public void run()
	{
		///Lanzamiento del método de espera.
		try{ obj.EnterAndWait(); }
		///Recogida de excpciones ya que el mentodo RUN no permite throws.
		catch(InterruptedException e) {}
	}
}
