//ARBOLES GENERALES:
private NodoGeneral2 <E> raiz = null;
public EAG(){raiz=null;}
private EAG(NodoGeneral2 <E> raiz){this.raiz=raiz;} @SafeVarargs
public EAG(E raiz, ArbolGeneral<E> ...hijos) throws NullPointerException{
	if(hijos==null) throw new NullPointerException();
	else if(hijos.length==0) this.raiz = new NodoGeneral2<E>(raiz,null,null,false);
	else{
		for(int i=0; i<hijos.length-1; i++) ((EAG<E>)hijos[i]).raiz.setHer(((EAG<E>)hijos[i+1]).raiz);
		this.raiz = new NodoGeneral2<E>(raiz,((EAG<E>)hijos[0]).raiz,null,false);
	}
}

public void setHijo(ArbolGeneral<E> hijo) throws ArbolVacioExcepcion, NullPointerException{
	if(esVacio()) throw new ArbolVacioExcepcion("No hay raiz");
	if(hijo.esVacio()) throw new NullPointerException();
	NodoGeneral2<E> aux = raiz.getHijo();
	while(aux.getHer()!=null) aux = aux.getHer();
	aux.setHer(((EAG<E>)hijo).raiz);
}

public static <E> void preorden(ArbolGeneral<E> a){
    if (!a.esVacio()){
        System.out.print(" "+a.raiz());
        ArbolGeneral<E> aux=a.hijoMasIzq();
        while (!aux.esVacio()){
            preorden(aux);
            aux=aux.hermanoDer();
        }
    }
}
public static <E> void inorden(ArbolGeneral<E> a){
    if (!a.esVacio()){
        ArbolGeneral<E> aux=a.hijoMasIzq();
        inorden (aux);
        System.out.print(" "+a.raiz());
        if (!aux.esVacio()){
            aux=aux.hermanoDer();
            while (!aux.esVacio()){
                inorden(aux);
                aux=aux.hermanoDer();
            }
        }
    }
}

public static <E> void anchura(ArbolGeneral<E> a){
    Cola<ArbolGeneral<E>> c = new EnlazadaCola<ArbolGeneral<E>>();
    c.insertar(a);
    do {
        a = c.suprimir();
        if (!a.esVacio()){
            System.out.print(a.raiz() + " ");
            ArbolGeneral<E> hijo=a.hijoMasIzq();
            while (!hijo.esVacio()){
                c.insertar(hijo);
                hijo=hijo.hermanoDer();
            }
       	}
    } while (!c.esVacio());
}

public static <E> int altura(ArbolGeneral<E> a){
    if (a.esVacio()) return 0;
    int cont =0;
    int maxGrado=0;
    ArbolGeneral<E> hijo = a.hijoMasIzq();
   	//if(!hijo.esVacio())cont=1;
    while (!hijo.esVacio()){
        cont = altura(hijo);
        if (cont>maxGrado)maxGrado=cont;
        hijo = hijo.hermanoDer();
    } return maxGrado+1;
}

public static int numNodosPares (ArbolGeneral<Integer> a){
  	if (a.esVacio()) return 0;
   	else {
        int cont=0;
        if (a.raiz()%2==0) cont++;
        ArbolGeneral<Integer> hijo = a.hijoMasIzq();
        while (!hijo.esVacio()){
            cont+=numNodosPares(hijo);
            hijo=hijo.hermanoDer();
        } return cont;
    }
}

public static <E> boolean igualEstructura(ArbolGeneral<E> a, ArbolGeneral<E> b){
    if (a.esVacio() && b.esVacio()) return true;
    if (a.esVacio() || b.esVacio()) return false;
    ArbolGeneral<E> ha = a.hijoMasIzq();
    ArbolGeneral<E> hb = b.hijoMasIzq();
    while (!ha.esVacio() && !hb.esVacio()){
        if (!igualEstructura(ha,hb)) return false;
        ha = ha.hermanoDer();
        hb=hb.hermanoDer();
    } return ha.esVacio() && hb.esVacio();                    
}


public static <E> int subArboles(ArbolGeneral<E> a){
    if (a.esVacio()) return 0;
    else{
        int cont = 0;
        ArbolGeneral<E> hijo = a.hijoMasIzq();
        while (!hijo.esVacio()){
            cont++;
            hijo = hijo.hermanoDer();
        } return cont;
 	}
}


//ARBOLES BINARIOS:
public static <E> void preorden(ArbolBinario<E> a){
    if (!a.esVacio()){
        System.out.print(a.raiz() + " ");
        preorden(a.hijoIzq());
        preorden(a.hijoDer());
    }
}    
public static <E> void inorden(ArbolBinario<E> a){
    if (!a.esVacio()){
        inorden(a.hijoIzq());
        System.out.print(a.raiz() + " ");
        inorden(a.hijoDer());
    }
}   
public static <E> void postorden(ArbolBinario<E> a){
    if (!a.esVacio()){
        postorden(a.hijoIzq());
        postorden(a.hijoDer());
        System.out.print(a.raiz() + " ");
    }
}

public static <E> void visualizarNivel(ArbolBinario<E> a, int nivel){
    if (!a.esVacio()){
        if (nivel == 0)
            System.out.print(a.raiz()+" ");
        else {
            visualizarNivel(a.hijoIzq(), nivel-1);
            visualizarNivel(a.hijoDer(), nivel-1);
        }
    }
}

public static <E> boolean esCamino(ArbolBinario<E> arbol, String camino){
    return esCamino(arbol, camino, 0);
}
private static <E> boolean esCamino(ArbolBinario<E> arbol, String camino, int i){
    if (camino.length() == 0 || i == camino.length()) return true;
    if (arbol.esVacio()) return false;
    if (arbol.raiz().equals(camino.charAt(i)))
        return esCamino(arbol.hijoIzq(), camino, i+1) || esCamino(arbol.hijoDer(), camino, i+1);
    else return false;
}

public static <E> ArbolBinario<E> podar(ArbolBinario<E> a){
    if (a.esVacio()) return new EnlazadoArbolBinario<E>();
    else{
        if (a.hijoIzq().esVacio() || a.hijoDer().esVacio()) 
            return new EnlazadoArbolBinario<E>(a.raiz(), new EnlazadoArbolBinario<E>(), new EnlazadoArbolBinario<E>()) ;
        else
        	return new EnlazadoArbolBinario<E>(a.raiz(),podar (a.hijoIzq()), podar(a.hijoDer()));
    }
}

public static <E> ArbolBinario<E> eliminarHojas(ArbolBinario<E> arbol){
	if (arbol.esVacio()) return new EnlazadoArbolBinario<E>(); 
	else if (arbol.hijoIzq().esVacio() && arbol.hijoDer().esVacio())
		return new EnlazadoArbolBinario<E>();
	else return new EnlazadoArbolBinario<E>(arbol.raiz(), eliminarHojas(arbol.hijoIzq()),eliminarHojas(arbol.hijoDer()));
}


//GRAFOS:
//EJ1: PREDECESORES. 
/* Produce: devuelve un iterador sobre los predecesores del vértice v en el grafo g.
Se dice que w es predecesor del vértice v si existe un arco que tenga por origen w y por destino v,
es decir, el arco (w,v) pertenece al conjunto de arcos del grafo. */
public static <E,T> Iterator<Vertice<E>> predecesores(Grafo <E,T> g, Vertice<E> v){
	//Guardar los elementos anteriores al vertice dado V.
	Vector<Vertice<E>> predecesores = new Vector<Vertice<E>>();
	//Iterador sobre los arcos del grafo.
	Iterator<Arco<E, T>> itArcos = g.arcos();
	
	//Guardo el Origen de todos los Arcos cuyo Destino sea el vertice dado V.
	while(itArcos.hasNext()){
		//Creo un auxiliar para el arco actual.
		Arco<E, T> arco =  itArcos.next();
		//Si dicho arco tiene como destino el vertice dado V, guardo su origen como Predecesor.
		if(arco.getDestino().equals(v)) predecesores.add(arco.getOrigen());
	}
	//Retorno un iterador sobre los Predecesores del vertice dado V.
	return predecesores.iterator();
}

//EJ2: ES SUMIDERO.
/* Un vértice se dice Sumidero si su grado de entrada es n-1 y su grado de salida es 0.
 'n' es el número de vértices del grafo. */
public static <E,T> boolean esSumidero(Grafo<E,T> g, Vertice<E> v){
	//Auxiliar control numero de vertices.
	int contVert=0;
	//Iterador sobre los vertices del grafo.
	Iterator<Vertice<E>> itVertices = g.vertices();
	//Mientras haya vertices incremento el contador de estos.
	while(itVertices.hasNext()){
		contVert++;
		itVertices.next();
	}
	
	//Auxiliar control numero de predecesores.
	int contPred=0;
	//Iterador sobre los predecesores del vertice dado V.
	Iterator<Vertice<E>> itPredecesores = predecesores(g,v);
	//Mientra haya predecesores incremento el contador de estos.
	while(itPredecesores.hasNext()){
		contPred++;
		itPredecesores.next();
	}
	
	//Si el numero de Predecesores es 1 menos que el total de vertices y carece de Adyacentes, ES Sumidero.
	if(contPred==contVert-1 && !g.adyacentes(v).hasNext()) return true;
	//Si no... NO lo es.
	else return false;
	
}

//EJ3: ES REGULAR.
/* Un grafo es regular si todos sus vértices tienen el mismo número de vértices adyacentes. */
public static <E,T> boolean esRegular(Grafo<E,T> g){
	//Auxiliar control numero de Adyacentes.
	int contAdy=0;
	//Auxiliar control de Igualdad en el numero de Adyacentes.
	int contIgual=0;
	//Flag para controlar si es la primera vuelta.
	boolean flag = true;
	
	//Iterador sobre los vertices del grafo.
	Iterator<Vertice<E>> itVertices = g.vertices();
	//Mientras haya vertices.
	while(itVertices.hasNext()){
		//Creo un auxiliar para el vertice actual.
		Vertice<E> vertice = itVertices.next();
		//Si dicho vertice tiene adyacentes...
		if(g.adyacentes(vertice).hasNext()){
			//Iterador sobre los Adyacentes del vertice actual.
			Iterator<Vertice<E>> itAdyacentes = g.adyacentes(vertice);
			//Cuento el numero de adyacentes.
			while(itAdyacentes.hasNext()){
				contAdy++;
				itAdyacentes.next();
			}
		} 
		//Si esta activado el Flag, es 1ªvuelta y se guarda el valor para comparar que en las demas sea igual.
		if(flag) contIgual=contAdy;
		//Si esta desactivado el Flag, no es 1ª vuelta y se comprueba que el nº de Adyacentes sea igual.
		else if(contIgual!=contAdy) return false;
	}
	//Retorna que el grafo si es regular.
	return true;
}

//EJ4: CAMINO SIMPLE.
/* No se repite ningun vértice. */
public static <E,T> boolean caminoSimple(Grafo <E,T> g, Vertice<E> v, Vertice<E> w){
	//Guardar los vertices por los que ya has pasadado, ya que no pueden repetirse.
	Vector<Vertice<E>> visitados = new Vector<Vertice<E>>();
	//Llamamos al metodo privado al que le pasamos a mayores el vector Visitados recien creado.
	return caminoSimple(g,v,w,visitados);
}
private static <E,T> boolean caminoSimple(Grafo <E,T> g, Vertice<E> v, Vertice<E> w, Vector<Vertice<E>> visitados){
	//Añadimos el vertice en el que nos encontramos a los Visitados.
	visitados.add(v);
	//Iteramos sobre los Adyacentes del vertice al que nos encontramos.
	Iterator<Vertice<E>> itAdyacentes = g.adyacentes(v);
	
	//Mientras haya Adyacentes...
	while(itAdyacentes.hasNext()){
		//Creo un auxiliar para el vertice actual.
		Vertice<E> vertice = itAdyacentes.next();
		//Si dicho vertice es nuestro Destino W, retornamos Verdadero ya que hemos llegado.
		if(vertice.equals(w)) return true;
		//Si no... Si dicho vertice no ha sido vistado llamamos al metodo ubicandonos en dicho vértice.
		else if(!visitados.contains(vertice)) return caminoSimple(g,vertice,w,visitados);
	} return false;
}

//EJ5: TODOS LOS CAMINOS.
public static <E,T> void todosLosCaminos(Grafo <E,T> g, Vertice<E> v, Vertice<E> w){
	//Guardar los vertices por los que ya has pasadado, ya que no pueden repetirse.
	Vector<Vertice<E>> visitados = new Vector<Vertice<E>>();
	//Llamamos al metodo privado al que le pasamos a mayores el vector Visitados recien creado.
	todosLosCaminos(g,v,w,visitados);
}
private static <E,T> void todosLosCaminos(Grafo <E,T> g, Vertice<E> v, Vertice<E> w, Vector<Vertice<E>> visitados){
	//Añadimos el vertice actual a los visitados y,
	visitados.add(v);
	//Si hemos llegado al Vertice destino W, mostramos todos los Visitados.
	if(v.equals(w)){
		Iterator<Vertice<E>> itVisitados = visitados.iterator();
		while(itVisitados.hasNext()) System.out.print(itVisitados.next());
	}
	//Si no hemos llegado al Vertice destino W, seguimos buscando.
	else{
		//Iterador sobre los adyacentes del vertice en el que me encuentro.
		Iterator<Vertice<E>> itAdyacentes = g.adyacentes(v);
		//Mientras haya adyacentes...
		while(itAdyacentes.hasNext()){
			//Creo un auxiliar para el vertice actual.
			Vertice<E> vertice = itAdyacentes.next();
			//Si dicho vertice no ha sido vistado llamamos al metodo ubicandonos en dicho vértice.
			if(!visitados.contains(vertice)) todosLosCaminos(g,vertice,w,visitados);
		}
	} //visitados.remove(visitados.size()-1); //(?)
}
	
//EJ7: VIAJANTE.
public static <E> Grafo<E, Integer> Viajante(Grafo<E, Integer> g, Vertice<E> v){
	Iterator<Vertice<E>> itVertices = g.vertices();
	Vector<Vertice<E>> pendientes = new Vector<Vertice<E>>();
	Grafo<E, Integer> toRet = new ListaAdyacencia<E, Integer>();
	//Añade todos los vertices a un vector.
	while(itVertices.hasNext()) pendientes.add(itVertices.next());
	//Quitamos de los Pendientes el propio Vertice Origen.
	pendientes.remove(v);
	//Si dicho vector no esta vacio, busca el arcoMinimo de los existentes y lo guarda en el Grafo solución.
	//Elimina el verticeDestino de dicho Arco, del vector de pendientes.
	while(!pendientes.isEmpty()){
		Arco<E, Integer> arcoMin = minimo(v, pendientes, g.arcos());
		toRet.insertarArco(arcoMin);
		pendientes.remove(arcoMin.getDestino());
	} return toRet;
}
private static<E> Arco<E,Integer> minimo(Vertice<E> actual, Vector<Vertice<E>> pendientes, Iterator<Arco<E, Integer>> arcos){
	Arco<E,Integer> arcoMin = null;
	int min = Integer.MAX_VALUE;
	//Buscamos el Arco con menos valor en su Etiqueta...
	//Cuyo Origen sea nuestro Vertice actual V y su Destino pertenezca al vector de Pendientes.
	while(arcos.hasNext()){
		Arco<E,Integer> arco = arcos.next();
		if(arco.getOrigen().equals(actual) && pendientes.contains(arco.getDestino())){
			if(arco.getEtiqueta() < min){
				min = arco.getEtiqueta();
				arcoMin = arco;
			}
		}
	} return arcoMin;
}

//EJ8: PRIM.
public static <E> Grafo<E,Integer> Prim (Grafo<E,Integer> g, Vertice<E> v){
	Iterator<Vertice<E>> itVertices = g.vertices();
	Vector<Vertice<E>> visitados=new Vector<Vertice<E>>();
	Vector<Vertice<E>> pendientes = new Vector<Vertice<E>>();
	Grafo<E, Integer> toRet = new ListaAdyacencia<E, Integer>();
	//Añade todos los vertices a un vector.
	while(itVertices.hasNext()) pendientes.add(itVertices.next());
	//Quitamos de los Pendientes el propio Vertice Origen.
	pendientes.remove(v);
	//Añadimos V a los ya visitados.
	visitados.add(v);
	//Si dicho vector no esta vacio, busca el arcoMinimo de los existentes y lo guarda en el Grafo solución.
	//Elimina el verticeDestino de dicho Arco, del vector de Pendientes. Y lo añade al de Vistos.
	while(!pendientes.isEmpty()){
		Arco<E,Integer> arcoMinimo = minimo(g.arcos(), visitados, pendientes);
		toRet.insertarArco(arcoMinimo);
		pendientes.remove(arcoMinimo.getDestino());
		visitados.add(arcoMinimo.getDestino());
	} return toRet;
}
private static<E> Arco<E,Integer> minimo(Iterator<Arco<E, Integer>> arcos, Vector<Vertice<E>> visitados, Vector<Vertice<E>> pendientes){
	Arco<E,Integer> arcoMin=null;
	int min=Integer.MAX_VALUE;
	//Buscamos el Arco con menos valor en su Etiqueta...
	//Cuyo Origen pertenezca al vetor de Visitados y su Destino pertenezca al vector de Pendientes.
	while(arcos.hasNext()){
		Arco<E,Integer> arc=arcos.next();
		if (visitados.contains(arc.getOrigen()) && pendientes.contains(arc.getDestino())){ 
			if(arc.getEtiqueta()<min) {
				min=arc.getEtiqueta();
				arcoMin=arc;
			}
		}
	} return arcoMin;
}

//EJ9: DIJKSTRA. (ESTO ES PUTA MIERDA...) :D
public static <E> Map<Vertice<E>, Integer> Dijkstra(Grafo<E, Integer> g, Vertice<E> v){
	Iterator<Vertice<E>> itVertices = g.vertices();
	Vector<Vertice<E>> pendientes = new Vector<Vertice<E>>();
	Map<Vertice<E>, Integer> toRet = new HashMap<Vertice<E>, Integer>();
	while(itVertices.hasNext()){
		//Añade todos los vertices a Pendientes
		Vertice<E> vertice = itVertices.next();
		pendientes.add(vertice);
		//Guarda dichos Vertices en el Map con una distancia asociada,
		//0 para V y el maximo valor de Int para el reto.
		if(v.equals(vertice)) toRet.put(v, 0);
		else toRet.put(vertice, Integer.MAX_VALUE);
	}
	//Mientras el vector Pendientes no este vacio.
	while(!pendientes.isEmpty()){
		//Cogemos el vertice Pendiente que se encuentre a menor distancia.
		Vertice<E> vertice = minimo(toRet, pendientes.iterator());
		//Calculamos sus adyacentes Pendientes.
		while(g.adyacentes(vertice).hasNext()){
			Vertice<E> ady = g.adyacentes(vertice).next();
			while(g.arcos().hasNext()){
				Arco<E, Integer> arc = g.arcos().next();
				//Si el Origen es el vertice a menor distancia, su destino es adyacente a dicho vertice
				//Y dicho Adyacente pertenece a Pendientes...
				if(arc.getOrigen().equals(vertice) && arc.getDestino().equals(ady) && pendientes.contains(ady)){
					Integer valor = arc.getEtiqueta()+toRet.get(vertice);
					if(toRet.get(ady) > valor){
						toRet.remove(ady);
						toRet.put(vertice, valor); //Actualizamos el map
					}
				}
		    }
	    } pendientes.remove(vertice);
	} return toRet;
}
private static <E> Vertice<E> minimo (Map<Vertice<E>, Integer> distancias, Iterator<Vertice<E>> pendientes){
	Vertice<E> vertMin=null;
	int min=Integer.MAX_VALUE;
	//Recorre Pendientes y escoge el Vertice que se encuentra a menor distancia.
	while (pendientes.hasNext()){
		Vertice<E> v= pendientes.next();
		if (distancias.get(v)< min) vertMin= v;
	}return vertMin;
}


//ESQUEMAS ALGORITMICOS:
//EJ1: MO-CHILA. (VORAZ)
public static Map<String, Integer> llenarMochila(int volMAX, Map<String, Integer> cantidades, Map<String, Integer> volumenes){
	//Guardado de la solución, en relacion <Objetos,Cantidad>.
	Map<String, Integer> solucion = new TreeMap<String, Integer>();
	//Lista de objetos ya utilizados y que por lo tanto no han de ser revisados.
	Set<String> usados = new TreeSet<String>();

	//Axiliar para controlar el numero de Objetos a meter de un determinado Volumen.
	int numEls = 0;
	//Auxiliar para controlar el volumen que llevo ocupado en la mochila.
	int volumenOcupado = 0;

	//Mientras tengo hueco...
	while (volumenOcupado < volMAX){
		//Busco el objeto de mayor volumen.
		String objeto = mayor(volMAX - volumenOcupado, volumenes, usados);
		
		if (objeto != null){
			//Lo añado a la lista de usados y,
			usados.add(objeto);
			//Guardo el valor de su volumen.
			int volumenObjeto = volumenes.get(objeto);

			//Divido el volumen Disponible entre el volumen del objeto para saber cuantos puedo añadir.
			numEls = (volMAX - volumenOcupado) / volumenObjeto;
			//Averiguo cuantos objetos hay de ese Volumen y,
			int totalCan = cantidades.get(objeto);
			//Si puedo meter una cantidad mayor que la disponible, meto todas las disponibles.
			if (numEls > totalCan) numEls = totalCan;
			
			//Guardo en el objeto y cuantos puedo meter en el Map de solución.
			solucion.put(objeto, numEls);
			//Actualizo el mapa para saber cuantos objetos me quedan de ese tipo.
			cantidades.put(objeto, totalCan - numEls);
			//Actualizo el volumenOcupado con el volumen del Objeto y el numero de ellos que se ha añadido.
			volumenOcupado += volumenObjeto * numEls;

		}
		//Si no hay objetos devuelvo un arbol vacio ya que si no hay objetos que añadir, la mochila ira vacia.
		else return new TreeMap<String, Integer>(); 
	}
	//Retorno el Map con la solución, en relacion <Objetos,Cantidad>.
	return solucion;
}

private static String mayor(int espacioDisponible, Map<String, Integer> volumenes, Set<String> usados){
	//Guardar el objeto de mayor volumen de los revisados que esten disponibles.
	String maximo = null;
	//Guardar el mayor volumen de los revisados que esten disponibles..
	int volMayor = 0;
	//Iterador sobre los objetos(claves) del Map volumenes.
	Iterator<String> objeto = volumenes.keySet().iterator();

	//Mientras dicho iterador tenga contenido...
	while (objeto.hasNext()) {
		//Creo un auxiliar para el objeto actual.
		String actual = objeto.next();
		//Creo un auxiliar para guardar el volumen del objeto actual.
		int volActual = volumenes.get(actual);

		//Si el objeto actual, NO se encuentra en el Set de usados, es mayor que el VolumenMayor y dicho volumen es menor o igual al espacioDisponible.
		if (!usados.contains(actual) && volActual > volMayor && volActual <= espacioDisponible) {
			//Actualizo el volumenMayor y,
			volMayor = volActual;
			//Actualizo el objeto de mayor volumen.
			maximo = actual;
		}
	}
	//Retornamos el objeto de mayor volumen.
	return maximo;
}


//EJ2: DAR CAMBIO. (VUELTA ATRÁS)
public static boolean darCambio(int aDevolver, Map<Integer, Integer> caja, Map<Integer, Integer> vuelta){
	//Cuanto se devuelve.
	int devuelto = 0;
	//Si puede resolverse.
	boolean objetivo = false;
	//Iterador sobre el dinero que tenemos
	Iterator<Integer> dinero = caja.keySet().iterator();

	//Mientras halla billetes y su valor no sea el objetivo.
	while(dinero.hasNext() && !objetivo){
		//Guardamos el valor del siguiente billete del mapa.
		int valor = dinero.next();

		//Si en caja tenemos al menos un billete de ese valor y ese valor es menor o igual al estado del Cambio,
		if(caja.get(valor) > 0 && aDevolver - devuelto >= valor){
			//Añadimos dicho valor a lo devuelto.
			devuelto += valor;
			//Actualizamos la caja restando uno a la cantidad de billetes que tenemos con dicho valor.
			caja.put(valor, caja.get(valor) - 1);
		}

		//Si lo devuelto es igual a lo que se deberia devolver.
		if(devuelto == aDevolver){
			//(?).
			vuelta.put(valor, vuelta.get(valor) + 1);
			//Activamos el Flag de Exito.
			objetivo = true;
		}
		
		//Si no...
		else {
			//Volvemos llamar al metodo con el estado actual de los Maps.
			objetivo = darCambio(aDevolver - devuelto, caja, vuelta);
			//Si el Flag de Exito esta activo... (?).
			if(objetivo) vuelta.put(valor, vuelta.get(valor) + 1);
			
			//Si no...
			else {
				//Volvemos a meter el billete en la caja.
				caja.put(valor, caja.get(valor) + 1);
				//Y decrementamos de lo devuelto el valor de dicho billete.
				devuelto -= valor;
			}
		}
	}
	//Retornamos si hubo o no exito.
	return objetivo;
}