import java.io.*;
import java.util.*;

public class GenerarCompostela
{
    /** RECIBE:
     * 0: Nombre_Paquete.
     * 1: KR peregrino.
     * 2: KU oficina.
    */
    public static void main(String[] args) throws Exception
    {
        //SEGURIDAD.
        BCTools bct = new BCTools();

        //INICIALIZACION.
        String PKG = args[0];
        String KRP = args[1];
        String KUO = args[2];

        //ENTRADA.
        System.out.println( "\nEntrada de datos del peregrino." );
        byte[] peregrino = getPeregrino();

        //FIRMA.
        System.out.println( "\nGenerando firma del peregrino." );
        Bloque firma = bct.genFirma( "Peregrino_Firma", KRP, peregrino );

        //DATOS. [0]=DatosDES, [1]=DES_RSA.
        System.out.println( "Generando datos y clave del peregrino." );
        Bloque[] datos = bct.genDatos(
            "Peregrino_Datos", "Peregrino_DESRSA", KUO, peregrino );

        //COMPOSTELA: Crear el paquete Compostela.
        System.out.println( "\nGenerando compostela del peregrino." );
        Paquete compostela = new Paquete();

        //COMPOSTELA: Añadir contenido al paquete.
        System.out.println( "... Añadiendo firma del peregrino." );
        compostela.anadirBloque( firma );
        System.out.println( "... Añadiendo datos del peregrino." );
        compostela.anadirBloque( datos[0] );
        System.out.println( "... Añadiendo DESRSA del peregrino." );
        compostela.anadirBloque( datos[1] );

        //COMPOSTELA: Exportar con el nombre arg[0].paquete
        System.out.println( "\n¡Guardando compostela del peregrino!" );
        PaqueteDAO.escribirPaquete( PKG+".paquete", compostela );
    }

    //ENTRADA: Datos a cubrir por el Peregrino.
    private static byte[] getPeregrino()
    {
        Scanner in = new Scanner ( System.in );
        Map<String, String> out = new HashMap<String, String>();

        System.out.print("... Nombre: ");
        String nombre = in.nextLine();
        out.put("nombre",nombre);

        System.out.print("... DNI: ");
        String dni = in.nextLine ();
        out.put("dni",dni);

        System.out.print("... Domicilio: ");
        String domicilio = in.nextLine ();
        out.put("domicilio",domicilio);

        System.out.print("... Fecha: ");
        String fecha = in.nextLine ();
        out.put("fecha",fecha);

        System.out.print("... Lugar: ");
        String lugar = in.nextLine ();
        out.put("lugar",lugar);

        System.out.print("... Motivacion: ");
        String motivacion = in.nextLine ();
        out.put("motivacion",motivacion);

        String outSTR = JSONUtils.map2json( out ); // Covertir datos a JSON.
        return outSTR.getBytes(); // Convertir String a bytes[].
    }
}
