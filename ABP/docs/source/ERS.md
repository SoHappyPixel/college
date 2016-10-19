#1. Introduccion
Siguiendo el modelo IEEE 830, procedemos a definir el proyecto de una aplicación para gestión de gimnasios.

##1.1. Proposito
En este documento serán tratados aspectos importantes del proyecto, especificaciones, resctricciones, funcionalidades del producto a desarrollar, tipos de usuarios... Y demás factores que afecten al desarrollo del proyecto. Por lo que el cliente es un activo importante en el desarrolo del presente documento.

##1.2. Ambito del Sistema
La aplicación resultante del proyecto será bautizada como *OurGym*.
Se pretende realizar una aplicación que permita que un gimnasio gestione a sus usuarios (según dos categorías), de forma que los entrenadores puedan asignarles tablas de ejercicio según sus necesidades y los usuarios puedan monitorizar sus entrenamientos y compartir en las redes sus estadísticas.
No se requiere  que la aplicación deba controlar el acceso al gimnasio ni efectos de verificación similares, para ello están las tarjetas de cada usuario.
Las ventajas serían la dinamización de las tablas de ejercicios, la inclusión del factor social en el gimnasio y reducción de la huella ecológica al consumir menos cantidad de papel.

##1.3. Definiciones, Acronimos y Abreviaturas
- Definiciones

- Acrónimos
  - **PEF:** tarjeta Ponte En Forma, plan cuatrimestral de ejercicio físico diseñado en función del estado físico actual y los objetivos de cada persona.
  - **TDU:** Tarjeta Deportiva Universitaria, abono que permite la realización de actividades de cardio-fitness en las instalaciones deportivas de la Universidad.


- Abreviaturas
  - **RFxxx:** estándar seguido para la especificación del identificador de cada requisito funcional (xxx representa la numeración que identifica al requisito).
  - **RIxxx:** estándar seguido para la especificación del identificador de cada requisito de interfaz (xxx representa la numeración que identifica al requisito).
  - **RNFxxx:** estándar seguido para la especificación del identificador de cada requisito no funcional (xxx representa la numeración que identifica al requisito).

##1.4. Referencias
- **ABP:** *Especificación de Requisitos según el estándar de IEEE 830.*
- **IEEE:** *Recommended Practice for Software Requirements Specifications*

##1.5. Vision General del Documento
El presente documento se divide en:
1. Introducción, *ERS según el estándar IEEE 830*.
2. Descripción general del sistema, *funcionalidades y restricciones*.


#2. Descripcion General
A continuación se realizará un esbozo de la aplicación, especificando sus funcionalidades y lo que se requiere para las mismas.

##2.1. Perspectiva del Producto
Será una aplicación independiente, que funcionará siguiendo la arquitectura cliente-servidor….

##2.2. Funciones del Producto
- Mostrar información pública. ( Ver info sobre el gimnasio sin estar logueado)

- Gestión de actividades deportivas.
  - Colectivas.
  - Individuales.
- Asignar horario, y plazas para dichas actividades.
  - Reserva de plazas.
  - Control de asistencia.
  - Notificaciones. ( Vía mail )
- Gestión de entrenamientos.
  - Muscular.
  - Cardio.

##2.3. Caracterısticas de los Usuarios
- Diferenciar entre tres tipos de usuario:
  - Administradores ( manejan todos los datos de la app ).
  - Entrenadores ( Manejan las tablas de los deportistas y actividades ).
  - Usuarios ( Manejan su perfil y acceden a tablas y actividades ).
    - **PEF**: Aquellos que hayan pagado el plan *Ponte en forma*
    - **TDU**: Simplemente tienen acceso a tablas estándar.

##2.4. Restricciones
Obligatoriedad de:
- Conexión a internet para visualizar cambios en las tablas, reserva de plaza o similares.
- Perfil de usuario, con clave recuperable vía mail.
- Notificaciones via mail, ya que al ser una web no puede utilizar las
  notificaciones nativas de un dispositivo móvil.

##2.5. Suposiciones y Dependencias
Php para el backend, Mysql para la base de datos y Html5 + Css3 (y + JS si fuera necesario) para el frontend.
Soporte básico en cualquier navegador, posibles fallos de intefaz en algunos detalles y gráficos de estadísticas si el navegador no soportase las últimas versiones de html5 o css3.
Probablemente se use MailChimp para gestionar las notificaciones vía mail.

##2.6. Requisitos Futuros
Escalabilidad para otros gimnasios, no simplemente el universitario de Ourense. Lo cual implica multidioma y la posibilidad de convertir el sistema en un CMS cuyo instalador permita configurar diferentes factores como el nombre y ubicación del gimnasio que procediera a utilizarlo.

#3. Requisitos Especıficos
Todos ellos esenciales por lo que el producto final debe cumplir, por lo menos con los requisitos aquí presentes.

##3.1. Interfaces Externas
La Interfaz del Usuario será definida utilizando un *framework* para frontend,
ampliamente conocido como es **Bootstrap**.
Las interactuaciones con el servidor serán mediante una estructura MVC, lo cual
será transparente al usuario.

##3.2. Funciones
- **Funcionales**
	- Acceso a información detallada.
	- Gestión de asistencia.
	- Gestión usuarios / perfil.
	- Gestión de entrenamientos.
	- Historial y estadísticas personales.
- **No Funcionales**
	- Sencillez.
	- Seguridad.
	- Accesibilidad.
	- Multiplataforma.

##3.3. Requisitos de Rendimiento
Se espera un alto volumen de usuarios pero en horarios dispersos por lo cual la carga del sistema debería ser soportada por una configuración básica de un servidor LAMP.

##3.4. Restricciones de Diseno
No se ha detallado ninguna restricción en este aspecto, se evaluaron las limitaciones de hardware en base a la carga activa supuesta, pero no consideramos que se precise una gran inversión para el montaje del servidor al que los clientes accederán.

##3.5. Atributos del Sistema
- Al tratarse de un sistema web su *fiabilidad* y *mantenibilidad* están al alcance de cualquier técnico con unos conocimientos medios.
- Sistema *portable*, ya que es accesible desde cualquier tipo de dispositivo con conexión a internet.
- Con *control de acceso*, mediante el login y una división en tres tipos de usuario con diferentes privilegios.

##3.6. Otros Requisitos
Se da a entender que el resto de secciones han cubierto cualquier factor a tener
en cuenta para el existoso desarrollo de la aplicación.

#4. Apendices
[ ... ]
