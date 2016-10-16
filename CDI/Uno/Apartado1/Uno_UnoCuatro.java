package Apartado1;
public class Uno_UnoCuatro extends Thread
{
	@Override
	public void run()
	{
		System.out.println("Número de hilos: "+Thread.activeCount());
		Thread.currentThread().getThreadGroup().list();
	}
    public static void main(String args[])
    {
    	Thread t = new Thread(new Uno_UnoCuatro(),"yo");
    	t.start();
    }
}
