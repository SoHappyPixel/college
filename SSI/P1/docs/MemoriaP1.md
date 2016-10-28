# SSI - CompostelaVirtual - Práctica1.

## Enunciado principal.
- Los **(P)eregrinos** podrán generar su *Compostela Virtual*.
- Será sellada por los **(A)lbergues** por donde pase.
- La **(O)ficina** podrá validar la *Compostela Virtual*.
  - Extraer los datos del peregrino.
  - Validar los *sellos* de los albergues.

### Aclaraciones.
- Los 3 actores tendrán clave pública y privada.
- Pre y Post encriptado los datos serán strings JSON.
- Se omiten los mecanismos de distribución de clave pública.
- Si en **O** falla alguna comprobación, se indicarán los sellos o información fallida; si todo es correcto se mostrará la totalidad de la *Compostela*.

### Accesos.
- **P** <- *Ku* de **O**.
- **A** <- *Ku* de **O** y **P** (al sellar).
- **O** <- *Ku* de **A's** y **P** (al validar).

### Requisitos.
- Confidencialidad datos de **P**, sólo **O** podrá leerlos.
  - Confidencialidad datos de **A**, sólo legibles por **O**.
- Que **O** tenga la seguridad de que el **P** que presenta la *Compostela* sea el **P** dueño de la *Compostela*.
- Asesgurar que no haya información modificada en el paquete.
- Evitar que **P** o **A** puedan repudiar la info añadida por ellos.
- Evitar que **O** pueda realizar cambios en el contenido de la *Compostela*.
- Mecanismo de *Sellado de tiempo* para **A**.
- *Minimo coste computacional* y uso de *asiméticos*.

### Desarrollo.
- **GenerarClaves <ID>** (Ya implementado).
  - Usado al inicio por los 3 actores.
  - Genera: ID.publica, ID.privada.
- **GenerarCompostela <Nombre_Paquete> <Ficheros_K>**
  - Usado por **P**. (<Ficheros_K> depende de la estrategia)
  - Solicita (como Strings): *Nombre, DNI, domicilio, fecha y lugar de creación, motivaciones.*
  - Genera <Nombre_Paquete>.paquete, empaquetando los datos solicitados (en un bloque dentro del paquete).
- **SellarCompostela <P_Paquete> <ID_Albergue> <Ficheros_K>**
  - Usado por **A**.
  - Los bloques se bautizarán como <ID_Albergue_NombreBloque>
  - Al <P_Paquete> le añade el/los bloques del <ID_Albergue>.
    - Los bloques contienen la siguiente información (como String): *Nombre completo del albergue, fecha y lugar de creación, incidencias.*
  - Devuelve la *Compostela* (<P_Paquete>) con el nuevo sello.
- **DesempaquetarCompostela <P_Paquete> <Num_Albergues> <ID_Albergue_N> <KU_Albergue_N> <Otros_Ficheros_Ku>**
  - Usado por **O**.
  - Verifica que la *Compostela* pertenezca a quien la presenta.
  - Verifica que ningun dato haya sido modificiado.
  - Verificará los sellos.
    - Si todos son correctos, se mostrarán por pantalla.
    - Si hay errores, se muestran los sello de conflicto.



## Memoria de la práctica.

### Descripción breve de la práctica.



### Descripción y justificación de las estrategias criptográficas empleadas para asegurar los requisitos básicos exigidos, junto con los pasos que se siguen en el empaquetado, sellado y desempaquetado.

z

### Descripción del formato/estructura del "paquete" resultante.



### Descripción breve de la implementación: clases y métodos más importantes.



### Instrucciones de compilación y ejemplos de uso.



### Breve comentario sobre las simplificaciones realizadas (apartado 2.1) y sus consecuencias en una aplicación real.



### Resultados obtenidos y conclusiones.
