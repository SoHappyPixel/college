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

    BCTools() throws Exception
    {
        Security.addProvider(new BouncyCastleProvider());
        Cipher cipherRSA = Cipher.getInstance( "RSA", "BC" );
        Cipher cipherDES = Cipher.getInstance( "DES/ECB/PKCS5Padding" );
        KeyFactory genRSA = KeyFactory.getInstance( "RSA", "BC" );
        KeyGenerator genDES = KeyGenerator.getInstance( "DES" );
        genDES.init( 56 );
    }


    //GENERADOR: Firma de alguien concreto.
    public Bloque genFirma( String block, String kr, byte[] data ) throws Exception
    {
        byte[] hashData = genHash( data );
        cipherRSA.init( Cipher.ENCRYPT_MODE, genKR( F2B( kr ) ) );
        return new Bloque( block, cipherRSA.doFinal( hashData ) );
    }

    //GENERADOR: Datos de alguien concreto y RSA de la clave DES usasda.
    public Bloque[] genDatos( String block, String ku, byte[] data ) throws Exception
    {
        Bloque[] toret = new Bloque[2];

        SecretKey secretDES = genDES.generateKey();
        byte[] bytesDES = secretDES.getEncoded();

        cipherDES.init( Cipher.ENCRYPT_MODE, secretDES );
        cipherDES.update( data, 0, data.length );
        toret[0] = new Bloque( block, cipherDES.doFinal() );

        cipherRSA.init( Cipher.ENCRYPT_MODE, genKU( F2B( ku ) ) );
        toret[1] = new Bloque( block, cipherRSA.doFinal( bytesDES ) );

        return toret;
    }

    //GENERADOR: Resumen de datos.
    public byte[] genHash( byte[] data ) throws Exception
    {
        MessageDigest sha = MessageDigest.getInstance( "SHA" ); // New SHA.
        sha.update( data, 0, data.length ); // Datos a la pila.
        return sha.digest();
    }


    //RECOLECTOR: Bloque de alguien concreto en una compostela dada.
    public byte[] getRSA( Paquete pack, String block, String k ) throws Exception
    {
        byte[] eData = pack.getContenidoBloque( block );
        cipherRSA.init( Cipher.DECRYPT_MODE, genKR( F2B( k ) ) );
        return cipherRSA.doFinal( eData );
    }

    //RECOLECTOR: Bloque de alguien concreto en una compostela dada.
    public byte[] getDES( Paquete pack, String block, byte[] k ) throws Exception
    {
        byte[] eData = pack.getContenidoBloque( block );
        cipherDES.init( Cipher.DECRYPT_MODE, genKR( k ) );
        cipherDES.update( eData, 0, eData.length);
        return cipherDES.doFinal();
    }


    //CONVERSOR: De Byte[] a PrivateKey.
    public PrivateKey genKR( byte[] kr ) throws Exception
    {
        PKCS8EncodedKeySpec specKR = new PKCS8EncodedKeySpec( kr );
        return genRSA.generatePrivate( specKR );
    }

    //CONVERSOR: De Byte[] a PublicKey.
    public PublicKey genKU( byte[] ku ) throws Exception
    {
        X509EncodedKeySpec specKU = new X509EncodedKeySpec( ku );
        return genRSA.generatePublic( specKU );
    }

    //CONVERSOR: Archivos a Bytes.
    public byte[] F2B(String file) throws Exception
    {
        Path path = Paths.get( file );
        return Files.readAllBytes( path );
    }
}
