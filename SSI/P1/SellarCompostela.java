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

    // Recibe Compostela, ID_Albergue y Ficheros_K
    public static void main(String[] args) throws Exception
    {

        // SEGURIDAD ...

        // Carga el provider BC.
        Security.addProvider(new BouncyCastleProvider());


        // Crea el generador RSA.
        KeyFactory genRSA = KeyFactory.getInstance( "RSA", "BC" );

        // Crea el cifrador RSA.
        Cipher cipherRSA = Cipher.getInstance( "RSA", "BC" );


        // Crea el generador DES.
        KeyGenerator genDES = KeyGenerator.getInstance( "DES" );

        // Lo establece a 56bits.
        genDES.init( 56 );

        // Crea el cifrador DES.
        Cipher cipherDES = Cipher.getInstance( "DES/ECB/PKCS5Padding" );



        // ENTRADA ...

        byte[] albergue;

        // Solicitud de Datos.
        try
        (
            // Flujo de entrada de datos.
            Scanner in = new Scanner ( System.in );
        )
        {
            // Map para JSON.
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

            // Covertir datos a JSON.
            String outSTR = JSONUtils.map2json( out );

            // Convertir String a bytes[].
            albergue = outSTR.getBytes();
        }



        // FIRMA_A ...

        // Genera la spec de la clave privada.
        PKCS8EncodedKeySpec specKRA = new PKCS8EncodedKeySpec( f2b(args[2]) );

        // Genera KR del Peregrino en base a la spec.
        PrivateKey KRA = genRSA.generatePrivate( specKRA );

        // Inicia cifrador RSA a Encriptar con KR_P.
        cipherRSA.init( Cipher.ENCRYPT_MODE, KRA );


        // Instancia el generador de resumenes.
        MessageDigest sha = MessageDigest.getInstance( "SHA" );

        // Introduce los datos en la pila del SHA.
        sha.update( albergue, 0, albergue.length );


        // Crea bloque con datos resumidos encriptados con RSA.
        Bloque bFirma =
            new Bloque( args[1]+"_Firma", cipherRSA.doFinal( sha.digest() ) );



        // DATOS_A ...

        // Crea la clave secreta DES.
        SecretKey skDES = genDES.generateKey();

        // Guarda la clave como bytes.
        byte[] keyDES = skDES.getEncoded();


        // Inicia cifrador DES en Encriptado.
        cipherDES.init( Cipher.ENCRYPT_MODE, skDES );

        // Encripta con DES.
        cipherDES.update( albergue, 0, albergue.length );


        // Crea bloque con los Datos encriptados con DES.
        Bloque bDatos =
            new Bloque( args[1]+"_Datos", cipherDES.doFinal() );



        // RSA_DES_A ...

        // Genera spec de la clave publica.
        X509EncodedKeySpec specKUO = new X509EncodedKeySpec( f2b(args[3]) );

        // Genera KU de la oficina en base a la spec.
        PublicKey KUO = genRSA.generatePublic( specKUO );

        // Inicia el RSA a encriptar con KU_oficina.
        cipherRSA.init( Cipher.ENCRYPT_MODE, KUO );


        // Crea bloque con clave DES encriptada con RSA.
        Bloque bDesKUO =
            new Bloque( args[1]+"_DESRSA", cipherRSA.doFinal( keyDES ) );



        //  PAQUETE ...

        // Lee la compostela del peregrino.
        Paquete compostela = PaqueteDAO.leerPaquete( args[0] );

        compostela.anadirBloque( bFirma );
        compostela.anadirBloque( bDatos );
        compostela.anadirBloque( bDesKUO );

        PaqueteDAO.escribirPaquete( args[0], compostela );


    }


    // Conversor de archivos a bytes.
    private static byte[] f2b (String file) throws Exception
    {
        // Obten el path en base a la string.
        Path path = Paths.get( file );

        // Lee en bytes en base al path.
        return Files.readAllBytes( path );
    }

}
