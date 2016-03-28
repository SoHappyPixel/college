///Práctica tres de la asignatura CDI.
package CDi.Tres;
//Clase que sólo se instanciará una vez para ser usada por instancias de B.
public class A
{
	///Método básico de espera con un saludo y una despedida.
	public synchronized void EnterAndWait() throws InterruptedException
	{
		///El hilo dice hola.
		System.out.println("Inicio hilo: "+Thread.currentThread().getName());
		///El hilo duerme.
		Thread.currentThread().sleep(1000);
		///El hilo dice adiós.
		System.out.println("Final hilo: "+Thread.currentThread().getName());
	}
}
