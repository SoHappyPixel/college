programa quicksort;

cabecera "entrada_estandar.cab";
cabecera "math.cab";

# tipos usados en el programa
tipos
  tabla es array entero;
fin

# contantes declaradas en el programa
constantes
  uno es caracter = 'c';
  prueba es hash hash entero = ('cero' => ('uno' => 1, 'dos' => 2), 'tres' => ());
fin

# variables declaradas en el programa
variables
  entrada,salida : tabla;
  num_elems,i : entero;
fin

#*****************************************************************
#  obtener_entrada: llena el array de entrada con números aleatorios
#      entrada: array que va a ser rellenado
#      num_elems: numero de elementos del array
#*****************************************************************
funcion obtener_entrada(entrada: ref tabla; num_elems : entero) -> nada
  variables
    indice : entero;
  fin
  principio
    indice = 1;
    mientras (indice <= num_elems)
      entrada->[indice] = aleatorio();
  fin

#*****************************************************************
#  ordenar: realizar el ordenamiento del array de entrada usando
#      el algoritmo quicksort
#      entrada: array que va a ser ordenado
#      num_elems: numero de elementos del array
#*****************************************************************
funcion ordenar(entrada : tabla; num_elems : entero) -> nada
  
  # funciones usadas para el ordenamiento
  funcion intercambio (entrada : tabla; i,j : entero) -> nada
    variables
      k : entero;
    fin
    principio
      k = i;
      entrada->[i] = j;
      entrada->[j] = k;
    fin

  funcion dividir(entrada : ref tabla; comienzo,final : entero) -> entero
    variables
      i,j : entero;
    fin
    principio
      pivote = entrada->[comienzo];
      i = comienzo+1;
      j = final;
      
      mientras (i <= j) principio
        mientras (i <= final && tabla[i] < pivote)
          i += 1;
        mientras (j > comienzo && tabla[j] >= pivote)
          j -= 1;
        si (i < j)
          intercambio(entrada,i,j);
          fin
        fin
          
      intercambio(entrada,comienzo,final);
      
      devolver j;
    fin
    
  funcion quicksort(entrada : ref tabla; comienzo,final : entero) -> nada
    variables
      indice : entero;
    fin
    principio
      si (comienzo < final) principio
        indice = dividir(comienzo,final);
        quicksort(entrada,comienzo,indice-1);
        quicksort(entrada,indice+1,final);
        fin
      fin
    fin
  
  # ordenamos el array de entrada
  principio
    quicksort(entrada,1,num_elems);
  fin

# programa principal
principio

  num_elems = 50;
  obtener_entrada(\entrada, num_elems);
  ordenar(entrada,num_elems);

  para_cada elemento (entrada)
    linea_consola(entrada);

fin