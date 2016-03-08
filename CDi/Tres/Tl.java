package Tres;
import java.util.Random;

public class Tl extends Thread
{
    int total;
    private Contador c;
    private Random rand = new Random();
    
    Tl(Contador c, int total)
    {
    	this.c = c;	
    	this.total = total;
    }

    @Override
    public void run()
    {
  //   	int r = rand.nextInt(50) + 1;
  //   	try{ Thread.currentThread().sleep(r); }
		// catch(InterruptedException e){}

    	int n = Integer.parseInt(Thread.currentThread().getName());
		
		int toRet = c.Incrementar(n);
		System.out.println("Hilo "+Thread.currentThread().getName()+": "+toRet);
    }
}
