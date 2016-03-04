package Apartado2;

public class Uno_DosSeis extends Thread
{
	private long timeI;
	public static int mode = 0;
	public static long exeTime = 0;
	public static long joinTime = 0;
	public static long startTime = 0;

	Uno_DosSeis()
	{
		timeI = System.currentTimeMillis();
	}

	@Override
	public void run()
	{
		if(mode == 0)
		{
			System.out.println("Hello, I’m thread number " 
			                   + Thread.currentThread().getName());
			System.out.println("Bye, this was thread number " 
			                   + Thread.currentThread().getName());
		}
		if(mode == 1)
		{
			int basePotencia = 20;
			double pot = Math.pow(basePotencia, 50);
			double div = pot / (pot/2);
		}
		if(mode == 2)
		{
			int basePotencia = 20;
			double pot = Math.pow(basePotencia, 50);
			System.out.println("\nPotencia\n" + pot);
		}
		if(mode == 3)
		{
			//Empty...
		}
		exeTime += (System.currentTimeMillis() - this.timeI);
	}	

	public static void main(String[] args)
	{
		Uno_DosSeis main = new Uno_DosSeis();

		mode = Integer.parseInt(args[1]);

		long timeS = 0, timeJ = 0;
		int howMany = Integer.parseInt(args[0]);
		Thread[] aT = new Thread[howMany];

		for(int i=0; i<howMany; i++)
		{
			String name = String.valueOf(i);
			Thread t = new Thread(new Uno_DosSeis(),name);

			timeS = System.currentTimeMillis();
			t.start();
			startTime += System.currentTimeMillis() - timeS;
			
			aT[i] = t;
		}

		for (Thread t : aT)
		{
			timeJ = System.currentTimeMillis();
			try{ t.join(); }
			catch(InterruptedException e){}
			joinTime += System.currentTimeMillis() - timeJ;
		}

		System.out.println("\n------\nThreads: " + howMany + "\n------");
		System.out.println("S time: " + startTime);
		System.out.println("E time: " + exeTime);
		System.out.println("J time: " + joinTime);
		System.out.println("TOTAL time: " + (System.currentTimeMillis() - main.timeI) + "\n------\n");
	}
}
