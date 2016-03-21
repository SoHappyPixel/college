package CDi.Tres;

public class A
{
	public synchronized void EnterAndWait() throws InterruptedException
	{
		System.out.println("Inicio hilo: "+Thread.currentThread().getName());
		Thread.currentThread().sleep(1000);
		System.out.println("Final hilo: "+Thread.currentThread().getName());
	}
}
