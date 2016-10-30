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
    public static Cipher cipherRSA;
    public static Cipher cipherDES;
    public static KeyFactory genRSA;
    public static KeyGenerator genDES;

    BCTools() throws Exception
    {
        Security.addProvider(new BouncyCastleProvider());
        cipherRSA = Cipher.getInstance( "RSA", "BC" );
        cipherDES = Cipher.getInstance( "DES/ECB/PKCS5Padding" );
        genRSA = KeyFactory.getInstance( "RSA", "BC" );
        genDES = KeyGenerator.getInstance( "DES" ); genDES.init( 56 );
    }


    //GENERADOR: Firma de alguien concreto.
    public static Bloque genFirma(
        String block, String kr, byte[] data ) throws Exception
    {
        byte[] hashData = genHash( data );
        cipherRSA.init( Cipher.ENCRYPT_MODE, getKR( getFileInfo ( kr ) ) );
        return new Bloque( block, cipherRSA.doFinal( hashData ) );
    }

    //GENERADOR: Datos de alguien concreto y RSA de la clave DES usasda.
    public static Bloque[] genDatos(
        String block1, String block2, String ku, byte[] data ) throws Exception
    {
        Bloque[] toret = new Bloque[2];

        SecretKey secretDES = genDES.generateKey();
        byte[] bytesDES = secretDES.getEncoded();

        cipherDES.init( Cipher.ENCRYPT_MODE, secretDES );
        cipherDES.update( data, 0, data.length );
        toret[0] = new Bloque( block1, cipherDES.doFinal() );

        cipherRSA.init( Cipher.ENCRYPT_MODE, getKU( getFileInfo( ku ) ) );
        toret[1] = new Bloque( block2, cipherRSA.doFinal( bytesDES ) );

        return toret;
    }

    //GENERADOR: Resumen de datos.
    public static byte[] genHash( byte[] data ) throws Exception
    {
        MessageDigest sha = MessageDigest.getInstance( "SHA" ); // New SHA.
        sha.update( data, 0, data.length ); // Datos a la pila.
        return sha.digest();
    }


    //RECOLECTOR: Firma de alguien concreto en una compostela dada.
    public static byte[] getFirma(
        Paquete pack, String block, String k ) throws Exception
    {
        byte[] eData = pack.getContenidoBloque( block );
        cipherRSA.init( Cipher.DECRYPT_MODE, getKU( getFileInfo( k ) ) );
        return cipherRSA.doFinal( eData );
    }

    //RECOLECTOR: Datos de alguien concreto en una compostela dada.
    public static byte[] getDatos(
        Paquete pack, String block, byte[] k ) throws Exception
    {
        byte[] eData = pack.getContenidoBloque( block );
        SecretKey secretKey = new SecretKeySpec(k, 0, k.length, "DES");
        cipherDES.init( Cipher.DECRYPT_MODE, secretKey );
        cipherDES.update( eData, 0, eData.length);
        return cipherDES.doFinal();
    }

    //RECOLECTOR: DESRSA de alguien concreto en una compostela dada.
    public static byte[] getDESRSA(
        Paquete pack, String block, String k ) throws Exception
    {
        byte[] eData = pack.getContenidoBloque( block );
        cipherRSA.init( Cipher.DECRYPT_MODE, getKR( getFileInfo( k ) ) );
        return cipherRSA.doFinal( eData );
    }


    //CONVERSOR: De Byte[] a PrivateKey.
    public static PrivateKey getKR( byte[] k ) throws Exception
    {
        PKCS8EncodedKeySpec spec = new PKCS8EncodedKeySpec( k );
        return genRSA.generatePrivate( spec );
    }

    //CONVERSOR: De Byte[] a PublicKey.
    public static PublicKey getKU( byte[] k ) throws Exception
    {
        X509EncodedKeySpec spec = new X509EncodedKeySpec( k );
        return genRSA.generatePublic( spec );
    }

    //CONVERSOR: De Archivos a Bytes.
    public static byte[] getFileInfo(String file) throws Exception
    {
        Path path = Paths.get( file );
        return Files.readAllBytes( path );
    }
}
