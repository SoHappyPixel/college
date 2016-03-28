///Práctica tres de la asignatura CDI.
package CDi.Tres;
///Clase que aumentará o decrementará la variable a obtener.
class Cont
{
	///Variable interna a modificar.
	private int c = 0;
	///Método para incrementar la variable privada `c`.
	public void incrementar(int n){ c+=n; }
	///Método para decrementar la variable privada `c`.
	public void decrementar(int n){ c-=n; }
	///Método para obtener el valor de la variable privada `c`.
	public int valor(){ return c; }
}
