package CDI.Cinco;

import java.net.*;
import java.io.*;

public class Slave implements Runnable
{
	final int PUERTO=5000;
	final String HOST = "localhost";
	
	Socket socket;
	DataInputStream entrada;
	DataOutputStream mensaje;
	
	Slave (int name)
	{
		t = new Thread(this, ""+name+"");
		Manager.aT[name] = t;
		//t.start();
	}

	//Cliente
	public void initClient()
	{
		try
		{
			socket = new Socket( HOST , PUERTO );
			//creamos el flujo de datos por el que se enviara un mensaje
			mensaje = new DataOutputStream(socket.getOutputStream());
			//enviamos el mensaje
			mensaje.writeUTF("hola que tal!!");
			//cerramos la conexión
			socket.close();
		}
		catch(Exception e ) { System.out.println("Error: "+e.getMessage()); }
	}
}