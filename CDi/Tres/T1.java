package CDi.Tres;

public class T1 extends Thread
{
	private Cont co;

	T1(Cont co){ this.co = co; }

	@Override
	public void run()
	{
		int n = Integer.parseInt(Thread.currentThread().getName());
		
		if(n%2==0) co.incrementar(n);
		else co.decrementar(n);

		System.out.println("Hilo "+Thread.currentThread().getName()+": "+co.valor());
	}
}
