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


public class DesempaquetarCompostela {

    // Recibe: Compostela, Num_Albergues,
    // ID_Albergue(1), KU_ID_Albergue(1)
    // ID_Albergue(...), KU_ID_Albergue(...)
    // ID_Albergue(Num_Albergues), KU_ID_Albergue(Num_Albergues)
    // KU_Peregrino, KR_Oficina.
    public static void main(String[] args) throws Exception
    {
        //SEGURIDAD.
        BCTools bct = new BCTools();

        //INICIALIZACION.
        int AID = 0;
        int KUA = 0;
        String PKG = args[0];
        String NUM = args[1];
        String KUP = args[ args.length - 1 ];
        String KRO = args[ args.length - 2 ];

        //COMPOSTELA: Lee el paquete Compostela.
        Paquete compostela = PaqueteDAO.leerPaquete( PKG );

        //DATOS, CLAVE-DES: Desempaquetada del peregrino.
        byte[] dataKey = bct.getRSA( compostela, "Peregrino_DESRSA", KRO );

        //DATOS: Desempaquetados del peregrino.
        byte[] datos = bct.getDES( compostela, "Peregrino_Datos", dataKey );

        //FIRMA: Desempaquetada del peregrino.
        byte[] pHash = bct.getRSA( compostela, "Peregrino_Firma", KUP );
        byte[] oHash = bct.genHash( datos );

        // Verifica autenticidad del usuario.
        if( ! oHash.equals(pHash) )
        {
            //1.- Printa datos peregrino.
            //2.- Repite el proceso con los albergues.
        }
        else{ System.out.println( "Mentiroso..." ); }
    }
}
