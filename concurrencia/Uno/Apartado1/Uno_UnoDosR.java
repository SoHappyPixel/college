package Apartado1;

public class Uno_UnoDosR implements Runnable
{
    public void run()
    {
    	Thread.sleep(1000);
        System.out.println("Hello world, I’m a java thread.");
    }

    public static void main(String args[])
    {
        (new Thread(new Uno_UnoDosR())).start();
    }
}
