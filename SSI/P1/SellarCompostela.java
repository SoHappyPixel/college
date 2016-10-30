import java.io.*;
import java.util.*;

public class SellarCompostela
{
    /** RECIBE:
     * 0: Compostela.
     * 1: ID_Albergue.
     * 2: KR_Albergue.
     * 3: KU_Oficina.
    */
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
        System.out.println( "\nEntrada de datos del albergue." );
        byte[] albergue = getAlbergue();

        //FIRMA.
        System.out.println( "\nGenerando firma del peregrino." );
        Bloque firma = bct.genFirma( AID+"_Firma", KRA, albergue );

        //DATOS. [0]=DatosDES, [1]=DES_RSA.
        System.out.println( "Generando datos y clave del albergue." );
        Bloque[] datos = bct.genDatos(
            AID+"_Datos", AID+"_DESRSA", KUO, albergue );

        //COMPOSTELA: Lee el paquete Compostela.
        System.out.println( "\nObteniendo compostela del peregrino." );
        Paquete compostela = PaqueteDAO.leerPaquete( PKG );

        //COMPOSTELA: Añadir contenido al paquete.
        System.out.println( "... Añadiendo firma del albergue." );
        compostela.anadirBloque( firma );
        System.out.println( "... Añadiendo datos del albergue." );
        compostela.anadirBloque( datos[0] );
        System.out.println( "... Añadiendo DESRSA del albergue." );
        compostela.anadirBloque( datos[1] );

        //COMPOSTELA: Exportar con el nombre arg[0].paquete
        System.out.println( "\n!Guardando compostela actualizada¡" );
        PaqueteDAO.escribirPaquete( PKG, compostela );
    }

    //ENTRADA: Datos a cubrir por el Albergue.
    private static byte[] getAlbergue()
    {
        Scanner in = new Scanner ( System.in );
        Map<String, String> out = new HashMap<String, String>();

        System.out.print("... Nombre: ");
        String nombre = in.nextLine ();
        out.put("nombre",nombre);

        System.out.print("... Fecha: ");
        String fecha = in.nextLine ();
        out.put("fecha",fecha);

        System.out.print("... Lugar: ");
        String lugar = in.nextLine ();
        out.put("lugar",lugar);

        System.out.print("... Incidencias: ");
        String incidencia = in.nextLine ();
        out.put("incidencia",incidencia);

        String outSTR = JSONUtils.map2json( out ); // Covertir datos a JSON.
        return outSTR.getBytes(); // Convertir String a bytes[].
    }
}
