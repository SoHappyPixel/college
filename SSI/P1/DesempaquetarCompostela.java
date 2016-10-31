import java.io.*;
import java.util.*;

public class DesempaquetarCompostela
{
    /** RECIBE:
     * 0: Compostela.
     * 1: Num_Albergues.
     * 2+(2*Num_Albergues): ID_Albergue.
     * 3+(2*Num_Albergues): KU_ID_Albergue.
     * length-2: KU_Peregrino.
     * length-1: KR_Oficina.
    */

    public static void main(String[] args) throws Exception
    {
        //INICIALIZACION.
        int AID = 2;
        int KUA = 3;
        int MAX = Integer.parseInt(args[1]);
        String PKG = args[0];
        String KUP = args[ args.length - 2 ];
        String KRO = args[ args.length - 1 ];

        //COMPOSTELA: Lee el paquete Compostela.
        System.out.println( "\nPROCESANDO LA COMPOSTELA..." );
        Paquete compostela = PaqueteDAO.leerPaquete( PKG );

        // Verifica al peregrino.
        verify( compostela, "Peregrino", KRO, KUP);

        // Verifica a los albergues.
        for ( int i=1; i <= MAX; i++)
        {
            verify( compostela, args[AID], KRO, args[KUA] );
            AID += 2;
            KUA += 2;
        }
    }

    //COMPROBACION: Veracidaz de los datos de cada bloque.
    private static void verify(
        Paquete pack, String id, String kr, String ku ) throws Exception
    {
        BCTools bct = new BCTools();
        System.out.println( "\nObteniendo bloque del "+id+"." );

        // Desempaquetar CLAVE-DES.
        System.out.println( "... Obteniendo DESRSA del "+id+"." );
        byte[] dataKey = bct.getDESRSA( pack, id+"_DESRSA", kr );

        // Desempaquetar DATOS.
        System.out.println( "... Obteniendo datos del "+id+"." );
        byte[] datos = bct.getDatos( pack, id+"_Datos", dataKey );

        // Desempaquetar FIRMA.
        System.out.println( "... Obteniendo firma del "+id+"." );
        byte[] pHash = bct.getFirma( pack, id+"_Firma", ku );

        // Crear hash para comparar.
        System.out.println( "... Creando hash para comparar con el "+id+"." );
        byte[] oHash = bct.genHash( datos );

        // Verificacion de autenticidad.
        if( ! oHash.equals( pHash ) )
        {
            System.out.write(datos, 0, datos.length);
        }
        else{ System.out.println( "Mentiroso..." ); }
    }
}
