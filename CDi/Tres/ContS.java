package CDi.Tres;

///Clase que aumentará o decrementará la variable a obtener.
public class ContS
{
	///Variable interna a modificar.
	private int c = 0;

	///Método para incrementar la variable privada `c`.
	public synchronized void incrementar(int n){ c+=n; }
	///Método para decrementar la variable privada `c`.
	public synchronized void decrementar(int n){ c-=n; }
	///Método para obtener el valor de la variable privada `c`.
	public synchronized int valor(){ return c; }
}
