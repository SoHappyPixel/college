package CDI.Cinco;

public class Manager
{
    static Thread[] aT;
    static Slave[] aS;
    static int MAX;
    
    public static void main(String[] args)
    {
        //Leer parametros de entrada.
        Manager.MAX = Integer.parseInt(args[0]);
        
        /// Se Crea el Master.
        Servidor s = new Servidor();
        
        // COMO RUNNABLE!!!
        /// Bucle para generar tantos clientes como hayamos indicado por consola.
        /// Lanzamiento de los hilos pertinentes por cliente LOS CUALES ESTARÁN A LA ESPERA DE UNA SOLICITUD DEL !MASTER!.
        Cliente c1 = new Cliente();
        Cliente c2 = new Cliente();
        Cliente c3 = new Cliente();
        Cliente c4 = new Cliente();
        Cliente c5 = new Cliente();
    }
}
