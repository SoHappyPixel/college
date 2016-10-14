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

        // Pedir datos.
        Map<String, String> json_datos = new HashMap<String, String>();
        Scanner scan = new Scanner (System.in);

        System.out.print("Nombre: ");
        String nombre = scan.nextLine ();
        json_datos.put("nombre",nombre);

        System.out.print("DNI: ");
        String dni = scan.nextLine ();
        json_datos.put("dni",dni);

        System.out.print("Domicilio: ");
        String domicilio = scan.nextLine ();
        json_datos.put("domicilio",domicilio);

        System.out.print("Fecha: ");
        String fecha = scan.nextLine ();
        json_datos.put("fecha",fecha);

        System.out.print("Lugar: ");
        String lugar = scan.nextLine ();
        json_datos.put("lugar",lugar);

        System.out.print("Motivacion: ");
        String motivacion = scan.nextLine ();
        json_datos.put("motivacion",motivacion);

        scan.close();


        // Covertir datos a JSON.
        String json_peregrino = JSONUtils.map2json( json_datos );

        // Convertir
        byte[] bytes_peregrino = json_peregrino.getBytes();


        //--------------------------------------------------------

        // BC como provider.
        Security.addProvider(new BouncyCastleProvider());

        // SHA para el hash.
        MessageDigest hasher = MessageDigest.getInstance("SHA");
		hasher.update(bytes_peregrino, 0, bytes_peregrino.length);
        byte[] hash_peregrino = hasher.digest();


        // Leer las claves ...
        KeyFactory keyFactoryRSA = KeyFactory.getInstance("RSA", "BC");

        // Clave privada peregrino.
        Path path_kr_p = Paths.get(args[1]);
        byte[] kr_p = Files.readAllBytes(path_kr_p);
        PKCS8EncodedKeySpec kr_p_spec = new PKCS8EncodedKeySpec( kr_p );
        PrivateKey kr_p_rsa = keyFactoryRSA.generatePrivate(kr_p_spec);

        // Clave publica oficina.
        Path path_ku_o = Paths.get(args[2]);
        byte[] ku_o = Files.readAllBytes(path_ku_o);
        X509EncodedKeySpec ku_o_spec = new X509EncodedKeySpec( ku_o );
        PublicKey ku_o_rsa = keyFactoryRSA.generatePublic(ku_o_spec);


        // Cifrado con RSA del hash.
        Cipher rsa = Cipher.getInstance("RSA", "BC");
        rsa.init(Cipher.ENCRYPT_MODE, kr_p_rsa);
        byte[] rsa_hash_peregrino = rsa.doFinal(hash_peregrino);


        // Crea el bloque de la Firma.
        Bloque firma_p = new Bloque("firma_p",rsa_hash_peregrino);

        //--------------------------------------------------------


        // // Crear bloque con los datos JSON.
        // Bloque datos_p = new Bloque("datos_p",);
        // Bloque des_p = new Bloque("des_p",);
        //
        //
        // // Crear paquete (Compostela).
        // Paquete compostela = new Paquete();

        // Añadir bloque a la Compostela.


    }
}
