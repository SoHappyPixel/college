package CDI.Cuatro;
import java.util.*;

class Ball {}

class Player implements Runnable
{
	Thread t;
	int name;
	Player (int name)
	{
		this.name = name;
		t = new Thread(this, ""+name+"");
		M.threads.add(t);
		t.start();
	}
	public void run()
	{
		try
		{
			if(M.turn==name) this.play();
			else
				while(!M.end) no_play();
		}
		catch(InterruptedException e) { M.end = true;  }
	}
	synchronized void play() throws InterruptedException
	{
		System.out.println("-----");
		System.out.println("Jugando = "+t.getName());
		System.out.println("Nombre = "+this.name);
		System.out.println("Turno = "+M.turn);
		System.out.println("-----");

		int next = M.turn + 1;
		if(next >= M.all) next = 0;
		System.out.println("Siguiente = "+next);

		M.turn = next;
		M.players.get(M.turn).notify();
		System.out.println("Notificado: "+M.players.get(M.turn).name+"-----\n");
	}
	synchronized void no_play() throws InterruptedException
	{
		wait();
	}
	void end() { t.interrupt(); }
}

class M
{
	static int all;
	static int turn = 0;
	static boolean end = false;
	static ArrayList<Thread> threads = new ArrayList<Thread>();
	static ArrayList<Player> players = new ArrayList<Player>();

	public static void main(String args[])
	{

		M.all = Integer.parseInt(args[0]);
		Ball b = new Ball();

		System.out.println(b.toString());

		for(int i=0; i<M.all; i++)
		{
			Player p = new Player(i);
			M.players.add(p);
		}

		// while(true)
		// {
		// 	if(M.end) break;
		// 	if(M.turn == M.all)
		// 		for(Player p : M.players) p.end();
		// }
	}

}
