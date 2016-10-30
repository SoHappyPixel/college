import java.io.*;
import java.util.*;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

import java.security.*;
import java.security.spec.*;

import javax.crypto.*;
import javax.crypto.spec.*;
import javax.crypto.interfaces.*;

import org.bouncycastle.jce.provider.BouncyCastleProvider;


public class GenerarCompostela {

    // Recibe Nombre_Paquete, KR peregrino y KU oficina
    public static void main(String[] args) throws Exception
    {
        //SEGURIDAD.
        BCTools bct = new BCTools();

        //INICIALIZACION.
        String PKG = args[0];
        String KRP = args[1];
        String KUO = args[2];

        //ENTRADA.
        byte[] peregrino = getPeregrino();

        //FIRMA.
        Bloque firma = bct.genFirma( "Peregrino_Firma", KRP, peregrino );

        //DATOS. [0]=DatosDES, [1]=DES_RSA.
        Bloque[] datos = bct.genDatos( "Peregrino_Datos", KUO, peregrino );

        //COMPOSTELA: Crear el paquete Compostela.
        Paquete compostela = new Paquete();

        //COMPOSTELA: Añadir contenido al paquete.
        compostela.anadirBloque( firma );
        compostela.anadirBloque( datos[0] );
        compostela.anadirBloque( datos[1] );

        //COMPOSTELA: Exportar con el nombre arg[0].paquete
        PaqueteDAO.escribirPaquete( PKG+".paquete", compostela );
    }

    // Datos a cubrir por el Peregrino.
    private static byte[] getPeregrino()
    {
        Scanner in = new Scanner ( System.in );
        Map<String, String> out = new HashMap<String, String>();

        System.out.print("Nombre: ");
        String nombre = in.nextLine();
        out.put("nombre",nombre);

        System.out.print("DNI: ");
        String dni = in.nextLine ();
        out.put("dni",dni);

        System.out.print("Domicilio: ");
        String domicilio = in.nextLine ();
        out.put("domicilio",domicilio);

        System.out.print("Fecha: ");
        String fecha = in.nextLine ();
        out.put("fecha",fecha);

        System.out.print("Lugar: ");
        String lugar = in.nextLine ();
        out.put("lugar",lugar);

        System.out.print("Motivacion: ");
        String motivacion = in.nextLine ();
        out.put("motivacion",motivacion);

        String outSTR = JSONUtils.map2json( out ); // Covertir datos a JSON.
        return outSTR.getBytes(); // Convertir String a bytes[].
    }
}
