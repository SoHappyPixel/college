package Apartado2;

public class Uno_DosUno extends Thread
{
	@Override
	public void run()
	{
		System.out.println("Hello, I’m thread number " + Thread.currentThread().getName());
		try{ Thread.currentThread().sleep(1000); }
		catch(InterruptedException e){}
		System.out.println("Bye, this was thread number " + Thread.currentThread().getName());
	}	

	public static void main(String[] args)
	{
		int howMany = Integer.parseInt(args[0]);

		for(int i=0; i<howMany; i++)
		{
			String name = String.valueOf(i);
			
			Thread t = new Thread(new Uno_DosUno(),name);
			t.start();
		}
	}
}
