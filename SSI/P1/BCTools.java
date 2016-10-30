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


/**
* @author dclamas
*/

public class BCTools
{
    private KeyFactory genRSA;
    private Cipher cipherRSA;
    private KeyGenerator genDES;
    private Cipher cipherDES;

    BCTools()
    {
        Security.addProvider(new BouncyCastleProvider());
        Cipher cipherRSA = Cipher.getInstance( "RSA", "BC" );
        Cipher cipherDES = Cipher.getInstance( "DES/ECB/PKCS5Padding" );
        KeyFactory genRSA = KeyFactory.getInstance( "RSA", "BC" );
        KeyGenerator genDES = KeyGenerator.getInstance( "DES" );
        genDES.init( 56 );
    }


    //GENERADOR: Firma de alguien concreto.
    public static Bloque genFirma( String block, String kr, byte[] data )
    {
        byte[] hashData = genHash( data );
        cipherRSA.init( Cipher.ENCRYPT_MODE, genKR( F2B( kr ) ) );
        return new Bloque( block, cipherRSA.doFinal( hashData ) );
    }

    //GENERADOR: Datos de alguien concreto y RSA de la clave DES usasda.
    public static Bloque[] genDatos( String block, String ku, byte[] data )
    {
        Bloque[] toret;

        SecretKey secretDES = genDES.generateKey();
        byte[] bytesDES = secretDES.getEncoded();

        cipherDES.init( Cipher.ENCRYPT_MODE, secretDES );
        cipherDES.update( data, 0, data.length );
        Bloque[0] = new Bloque( block, cipherDES.doFinal() );

        cipherRSA.init( Cipher.ENCRYPT_MODE, genKU( F2B( ku ) ) );
        Bloque[1] = new Bloque( block, cipherRSA.doFinal( bytesDES ))

        return toret;
    }

    //GENERADOR: Resumen de datos.
    public static byte[] genHash( byte[] data )
    {
        MessageDigest sha = MessageDigest.getInstance( "SHA" ); // New SHA.
        sha.update( data, 0, data.length ); // Datos a la pila.
        return sha.digest();
    }


    //RECOLECTOR: Bloque de alguien concreto en una compostela dada.
    public static byte[] getRSA( Paquete pack, String block, String k )
    {
        byte[] eData = PaqueteDAO.leerBloque( pack.getBloque( block ) );
        cipherRSA.init( Cipher.DECRYPT_MODE, genKR( F2B( k ) ) );
        return cipherRSA.doFinal( eData );
    }

    //RECOLECTOR: Bloque de alguien concreto en una compostela dada.
    public static byte[] getDES( Paquete pack, String block, String k )
    {
        byte[] eData = PaqueteDAO.leerBloque( pack.getBloque( block ) );
        cipherDES.init( Cipher.DECRYPT_MODE, genKR( F2B( k ) ) );
        cipherDES.update( eData, 0, eData.length);
        return cipherDES.doFinal();
    }


    //CONVERSOR: De Byte[] a PrivateKey.
    public static PrivateKey genKR( byte[] kr )
    {
        PKCS8EncodedKeySpec specKR = new PKCS8EncodedKeySpec( kr );
        return genRSA.generatePrivate( specKR );
    }

    //CONVERSOR: De Byte[] a PublicKey.
    public static PublicKey genKU( byte[] ku )
    {
        X509EncodedKeySpec specKU = new X509EncodedKeySpec( ku );
        return genRSA.generatePublic( specKU );
    }

    //CONVERSOR: Archivos a Bytes.
    public static byte[] F2B(String file) throws Exception
    {
        Path path = Paths.get( file );
        return Files.readAllBytes( path );
    }
}
