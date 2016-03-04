package Apartado3;
import java.util.Scanner;

public class Uno_TresTres extends Thread
{
	private long timeI;
	public static long flagTime = 0;
	public static long midTime = 5*1000;

	Uno_TresTres()
	{
		timeI = System.currentTimeMillis();
	}

	@Override
	public void run()
	{
		System.out.println("Hello!");

		for(int i=0; i<10; i++)
		{
			try
			{
				Thread.currentThread().sleep(1000);
				System.out.println("Mensaje" + i);
			}
			catch(InterruptedException e)
			{
				System.out.println("He sido interrumpido.");
				if(flagTime>midTime) break;
			}
		}

		System.out.println("Bye!");
	}	

	public static void main(String[] args)
	{
		Scanner flag = new Scanner(System.in);
		Uno_TresTres main = new Uno_TresTres();
		Thread t = new Thread(new Uno_TresTres(),"ForeverAlone");

		t.start();

		while(!t.isInterrupted())
		{
			String toInterrupt = flag.next();
			if(toInterrupt != "")
			{
				flagTime = (System.currentTimeMillis() - main.timeI);
				System.out.println("\nEsperado: " + flagTime);
				t.interrupt();
			}
		}
	}
}
