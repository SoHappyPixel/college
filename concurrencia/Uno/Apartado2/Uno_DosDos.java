package Apartado2;

public class Uno_DosDos extends Thread
{

	private long timeI;

	public void set_time(long timeI)
	{
		this.timeI = timeI;
	}

	@Override
	public void run()
	{
		System.out.println("Hello, I’m thread number " + Thread.currentThread().getName());
		System.out.println("Bye, this was thread number " + Thread.currentThread().getName());
	}	

	public static void main(String[] args)
	{
		Uno_DosDos main = new Uno_DosDos();
		main.set_time(System.currentTimeMillis());
		int howMany = Integer.parseInt(args[0]);

		Thread[] aT = new Thread[howMany];

		for(int i=0; i<howMany; i++)
		{
			String name = String.valueOf(i);
			
			Thread t = new Thread(new Uno_DosDos(),name);
			t.start();

			aT[i] = t;
		}

		for (Thread t : aT)
		{
			try{ t.join(); }
			catch(InterruptedException e){}
		}

		System.out.println("\nThreads: " + howMany);
		System.out.println("Total time: " + (System.currentTimeMillis() - main.timeI));
	}
}
