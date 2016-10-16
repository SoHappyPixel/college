package CDI.Cuatro;
///Clase que representa a los jugadores.
public class Player implements Runnable
{
	Thread t;
	///Constructor del jugador.
	Player (int name)
	{
		t = new Thread(this, ""+name+"");
		t.start();
	}
	///Ejecución del hilo.
	public void run()
	{
		///Ejecución constante excepto que se cumpla la bandera.
		try{ while(!Master.end) this.get(); }
		///Finalización del hilo en base a condiciones.
		catch(InterruptedException e) { Master.end = true;  }
	}
	synchronized void get() throws InterruptedException
	{
		///Obtención del nombre del hilo.
		int me = Integer.parseInt(Thread.currentThread().getName());
		///Bandera de semaforo.
		if(!Master.flag) wait();
		///Bandera de turno.
		if(Master.turn!=me) wait();
		///Muestra jugada.
		System.out.println("\t[ P-> "+me+" | T-> "+Master.turn+" | G-> "+Master.value+" ].");
		///Bajada de semáforo.
		Master.flag = false;
		///Bucle y posibilidad de jugar en solitario.
		notify();
	}
	///Metodo a invocar cuando se finaliza el juego.
	public void end() { t.interrupt(); }
}
