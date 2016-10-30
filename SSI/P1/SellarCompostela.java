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


public class SellarCompostela {

    // Recibe: Compostela, ID_Albergue, KR_Albergue, KU_Oficina.
    public static void main(String[] args) throws Exception
    {
        //SEGURIDAD.
        BCTools bct = new BCTools();

        //INICIALIZACION.
        String PKG = args[0];
        String AID = args[1];
        String KRA = args[2];
        String KUO = args[3];

        //ENTRADA.
        byte[] albergue = getAlbergue();

        //FIRMA.
        Bloque firma = bct.genFirma( AID+"_Firma", KRA, albergue );

        //DATOS. [0]=DatosDES, [1]=DES_RSA.
        Bloque[] datos = bct.genDatos( AID+"_Datos", KUO, albergue );

        //COMPOSTELA: Lee el paquete Compostela.
        Paquete compostela = PaqueteDAO.leerPaquete( PKG );

        //COMPOSTELA: Añadir contenido al paquete.
        compostela.anadirBloque( firma );
        compostela.anadirBloque( datos[0] );
        compostela.anadirBloque( datos[1] );

        //COMPOSTELA: Exportar con el nombre arg[0].paquete
        PaqueteDAO.escribirPaquete( PKG, compostela );

    }

    // Datos a cubrir por el Albergue.
    private static byte[] getAlbergue()
    {
        Scanner in = new Scanner ( System.in );
        Map<String, String> out = new HashMap<String, String>();

        System.out.print("Nombre: ");
        String nombre = in.nextLine ();
        out.put("nombre",nombre);

        System.out.print("Fecha: ");
        String fecha = in.nextLine ();
        out.put("fecha",fecha);

        System.out.print("Lugar: ");
        String lugar = in.nextLine ();
        out.put("lugar",lugar);

        System.out.print("Incidencias: ");
        String incidencia = in.nextLine ();
        out.put("incidencia",incidencia);

        String outSTR = JSONUtils.map2json( out ); // Covertir datos a JSON.
        return outSTR.getBytes(); // Convertir String a bytes[].
    }
}
