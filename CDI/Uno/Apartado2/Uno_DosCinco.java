package Apartado2;



public class Uno_DosCinco extends Thread
{

	public static long exeTime = 0;
	public static long joinTime = 0;
	public static long startTime = 0;
	private long timeI;

	Uno_DosCinco()
	{
		timeI = System.currentTimeMillis();
	}

	@Override
	public void run()
	{
		System.out.println("Hello, I’m thread number " + Thread.currentThread().getName());
		System.out.println("Bye, this was thread number " + Thread.currentThread().getName());
		exeTime += (System.currentTimeMillis() - this.timeI);
	}	

	public static void main(String[] args)
	{
		Uno_DosCinco main = new Uno_DosCinco();
		
		long timeS = 0, timeJ = 0;
		int howMany = Integer.parseInt(args[0]);

		for(int i=0; i<howMany; i++)
		{
			String name = String.valueOf(i);
			Thread t = new Thread(new Uno_DosCinco(),name);

			timeS = System.currentTimeMillis();
			t.start();
			startTime += System.currentTimeMillis() - timeS;
			
			timeJ = System.currentTimeMillis();
			try{ t.join(); }
			catch(InterruptedException e){}
			joinTime += System.currentTimeMillis() - timeJ;
		}

		System.out.println("\nThreads: " + howMany);
		System.out.println("Total time: " + (System.currentTimeMillis() - main.timeI));
		System.out.println("\nCreation time: " + startTime);
		System.out.println("Exe time: " + exeTime);
		System.out.println("Join time: " + joinTime);
	}
}
