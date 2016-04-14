package Apartado1;

public class Uno_UnoDosT extends Thread
{
    public void run()
    {
        System.out.println("Hello world, I’m a java thread.");
    }

    public static void main(String args[])
    {
        (new Uno_UnoDosT()).start();
    }
}
