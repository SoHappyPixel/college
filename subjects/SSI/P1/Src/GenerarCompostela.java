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

    public static void main(String[] args) throws Exception {

        // SEGURIDAD -----x-----x-----x-----x-----x-----x-----x-----x-----x

        // BC como provider.
        Security.addProvider(new BouncyCastleProvider());

        // Generador RSA.
        KeyFactory rsa = KeyFactory.getInstance( "RSA", "BC" );
        // Cifrador RSA.
        Cipher c_rsa = Cipher.getInstance( "RSA", "BC" );

        // Generador DES.
        KeyGenerator des = KeyGenerator.getInstance( "DES" );
        // Cifrador DES.
        Cipher c_des = Cipher.getInstance( "DES/ECB/PKCS5Padding" );


        // ENTRADA DATOS -----x-----x-----x-----x-----x-----x-----x-----x-----x

        // Map de strings para luego convertir a JSON.
        Map<String, String> json_datos = new HashMap<String, String>();

        // Flujo de entrada de datos.
        Scanner scan = new Scanner (System.in);
        try {
            // Pedir nombre.
            System.out.print("Nombre: ");
            String nombre = scan.nextLine ();
            json_datos.put("nombre",nombre);
            // Pedir dni.
            System.out.print("DNI: ");
            String dni = scan.nextLine ();
            json_datos.put("dni",dni);
            // Pedir domicilio.
            System.out.print("Domicilio: ");
            String domicilio = scan.nextLine ();
            json_datos.put("domicilio",domicilio);
            // Pedir fecha.
            System.out.print("Fecha: ");
            String fecha = scan.nextLine ();
            json_datos.put("fecha",fecha);
            // Pedir lugar.
            System.out.print("Lugar: ");
            String lugar = scan.nextLine ();
            json_datos.put("lugar",lugar);
            // Pedir motivacion.
            System.out.print("Motivacion: ");
            String motivacion = scan.nextLine ();
            json_datos.put("motivacion",motivacion);
        }
        finally {
            // Cerrar flujo de entrada de datos.
            scan.close();
        }

        // Covertir datos a JSON.
        String json_peregrino = JSONUtils.map2json( json_datos );
        // Convertir String a bytes[]
        byte[] bytes_peregrino = json_peregrino.getBytes();


        // FIRMA_P -----x-----x-----x-----x-----x-----x-----x-----x-----x

        // Generar resumen usando SHA para el hash ...
        // Instancia del SHA.
        MessageDigest hasher = MessageDigest.getInstance( "SHA" );
        // Introduce los datos a resumir en la pila.
        hasher.update( bytes_peregrino, 0, bytes_peregrino.length );
        // Produce el resumen del contenido de la pila.
        byte[] hash_peregrino = hasher.digest();

        // Obtiene la clave privada peregrino.
        byte[] kr_p = file2bytes( args[1] );
        // Genera la specificacion de la clave privada.
        PKCS8EncodedKeySpec kr_p_spec = new PKCS8EncodedKeySpec( kr_p );
        // Genera KR del Peregrino en base a la especificacion.
        PrivateKey kr_p_rsa = rsa.generatePrivate( kr_p_spec );

        // Inicia el cifrador RSA en modo encriptar usando la KR del peregrino.
        c_rsa.init( Cipher.ENCRYPT_MODE, kr_p_rsa );
        // Encriptado con RSA del hash de los datos.
        byte[] rsa_hash_peregrino = c_rsa.doFinal( hash_peregrino );

        // Crea el bloque de la Firma = Datos resumidos encriptados con RSA.
        Bloque firma_p = new Bloque( "firma_p",rsa_hash_peregrino );


        // DATOS_P -----x-----x-----x-----x-----x-----x-----x-----x-----x

        // Inicia el DES con 56 bits.
        des.init( 56 );
        // Genera clave DES.
        SecretKey des_k = des.generateKey();
        byte[] bytes_des_k = des_k.getEncoded();
        // Inicia el cifrador DES en modo Encriptar
        c_des.init( Cipher.ENCRYPT_MODE, des_k );

        byte[] des_peregrino;
        des_peregrino = c_des.update(bytes_peregrino,0,bytes_peregrino.length);
        des_peregrino = c_des.doFinal();

        // Crear bloque de los datos encriptados con DES.
        Bloque datos_p = new Bloque("datos_p",des_peregrino);


        // RSA_DES_P -----x-----x-----x-----x-----x-----x-----x-----x-----x

        // Obtiene la clave publica oficina.
        byte[] ku_o = file2bytes( args[2] );
        // Genera especificacion de la clave publica.
        X509EncodedKeySpec ku_o_spec = new X509EncodedKeySpec( ku_o );
        // Genera KU de la oficina en base a la especificacion.
        PublicKey ku_o_rsa = rsa.generatePublic( ku_o_spec );

        // (Re)iniciar en modo encriptado con KU_oficina.
        c_rsa.init( Cipher.ENCRYPT_MODE, ku_o_rsa );
        // byte[] con la clave generada por el DES, encriptada con RSA.
        byte [] rsa_des_k = c_rsa.doFinal( bytes_des_k );

        // Crear bloque con la clave DES encriptada con RSA.
        Bloque des_k_p = new Bloque( "des_p",rsa_des_k );


        // COMPOSTELA -----x-----x-----x-----x-----x-----x-----x-----x-----x

        // Crear el paquete Compostela.
        Paquete compostela = new Paquete();
        compostela.anadirBloque( firma_p );
        compostela.anadirBloque( datos_p );
        compostela.anadirBloque( des_k_p );

        // Exportar Compostela con el nombre pasado en arg[0] ...

    }

    public static byte[] file2bytes (String file) throws Exception
    {
        Path path = Paths.get( file );
        byte[] bytes = Files.readAllBytes( path );

        return bytes;
    }
}
