package Apartado2;



public class Uno_DosCuatro extends Thread
{

	public static long fullTime = 0;
	private long timeI;

	Uno_DosCuatro()
	{
		timeI = System.currentTimeMillis();
	}

	@Override
	public void run()
	{
		long threadTime = System.currentTimeMillis();
		System.out.println("Hello, I’m thread number " + Thread.currentThread().getName());
		System.out.println("Bye, this was thread number " + Thread.currentThread().getName());
		fullTime += (System.currentTimeMillis() - this.timeI);
	}	

	public static void main(String[] args)
	{
		Uno_DosCuatro main = new Uno_DosCuatro();

		int howMany = Integer.parseInt(args[0]);
		for(int i=0; i<howMany; i++)
		{
			String name = String.valueOf(i);
			
			Thread t = new Thread(new Uno_DosCuatro(),name);
			t.start();
			try{ t.join(); }
			catch(InterruptedException e){}
		}
		System.out.println("\nThreads: " + howMany);
		System.out.println("Total time: " + (System.currentTimeMillis() - main.timeI));
		System.out.println("Threads time: " + fullTime);
	}
}
