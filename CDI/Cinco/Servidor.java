package CDI.Cinco;

import java.net.*;
import java.io.*;

public class Master
{
    Socket socket;
    ServerSocket server;
    final int PUERTO=5000
    
    DataOutputStream salida;
    BufferedReader entrada;
    String mensajeRecibido;

    //SERVIDOR
    public void initServer()
    {
        try
        {
            sc = new ServerSocket(PUERTO);
            //so = new Socket();
            //so = sc.accept();

            //Canales de entrada y salida de datos
            entrada = new BufferedReader(new InputStreamReader(so.getInputStream()));
            salida = new DataOutputStream(so.getOutputStream());
            System.out.println("Confirmando conexion al cliente....");
            salida.writeUTF("Conexión exitosa...n envia un mensaje :D");

            //Recepcion de mensaje
            mensajeRecibido = entrada.readLine();
            System.out.println(mensajeRecibido);
            salida.writeUTF("Se recibio tu mensaje.n Terminando conexion...");
            salida.writeUTF("Gracias por conectarte, adios!");
            System.out.println("Cerrando conexión...");
            sc.close();//Aqui se cierra la conexión con el cliente

        }
        catch(Exception e ) { System.out.println("Error: "+e.getMessage()); }

    }
    
    public void Mandel(Cliente c)
    {
        
    }

}
