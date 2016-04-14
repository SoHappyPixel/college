package CDI.Cuatro;
///Clase pelota con la que se jugará.
public class Ball implements Runnable
{
	Player[] aP;
	Thread t;
	///Constructor de la pelota.
	Ball(Player[] aP)
	{
		t = new Thread(this, "Ball");
		this.aP = aP;
		t.start();
	}
	///Ejecución del hilo.
	public void run()
	{
		///Ejecución constante excepto que se cumpla la bandera.
		try{ while(!Master.end) this.put(); }
		///Finalización del hilo en base a condiciones.
		catch(InterruptedException e) { Master.end = true; }
	}
	///Metodo de comunicación del turno de los jugadores.
	synchronized public void put() throws InterruptedException
	{
		if(Master.flag) wait();
		///Activación semáforo.
		Master.flag = true;
		System.out.println("["+Master.value+"]B. ↘");
		///Invocación del jugador correspondiente al turno.
		while(Master.flag) synchronized(aP[Master.turn]){aP[Master.turn].notify();}
		///Avance de golpe.
		Master.value++;
		///Avance de turno.
		Master.turn++;
		///Checkeo que el turno no supere el numero de jugadores.
		if(Master.turn >= Master.all) Master.turn = 0;
		///Bucle.
		notify();
	}
	///Metodo a invocar cuando se finaliza el juego.
	public void end() { t.interrupt(); }
}
