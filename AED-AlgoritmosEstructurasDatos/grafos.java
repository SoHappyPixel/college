import grafo.*;
import java.util.Map;
import java.util.Vector;
import java.util.HashMap;
import java.util.Iterator;

public class Actividad_8 {
	
	//MOSTRAR CONTEDIDO DE UN #ITERADOR:
	public static <E,T> void mostrar(Iterator<Vertice<E>> i){
		while(i.hasNext()) System.out.print(i.next()+" ");
		System.out.println(" ");
	}
	
	//MOSTRAR CONTEDIDO DE UN #VECTOR:
	public static <E,T> void mostrar(Vector<Vertice<E>> v){
		for(int i=0; i<v.size(); i++) System.out.print(v.elementAt(i).getEtiqueta()+" ");
		System.out.println();
	}
	
	//MOSTRAR CONTEDIDO DE UN #MAPA:
	public static void mostrar(Map <Vertice<String>,Integer> map){
		Iterator<Integer> itr = map.values().iterator();
		while(itr.hasNext()) System.out.println(itr.next());
	}
	
	// >> EJ 1 - DEVUELVE ITERADOR SOBRE LOS PREDECESORES DE UN VERTICE:
	public static <E,T> Iterator<Vertice<E>> predecesores (Grafo<E,T> g, Vertice<E> v){
		Vector<Vertice<E>> pred= new Vector<Vertice<E>>();
		Iterator<Vertice<E>> itv= g.vertices();
		
		while (itv.hasNext()){
			Vertice<E> w=itv.next();
			Iterator<Vertice<E>> itv2= g.adyacentes(w);
			while(itv2.hasNext()) if (itv2.next().equals(v)) pred.add(w);
		}return pred.iterator();
	}
	
	// >> EJ 2 - :
	public static <E,T> boolean esSumidero (Grafo<E,T> g, Vertice<E> v){
	    int numVertices=0;
	    int gradoEntrada=0;
	    Iterator<Vertice<E>> itv = g.vertices();
	    Iterator<Vertice<E>> itp = predecesores(g, v);
		while(itv.hasNext()){
			itv.next();
			numVertices++;
		}
		while(itp.hasNext()){
			itp.next();
			gradoEntrada++;
		}
		if ((numVertices-1==gradoEntrada) && (!g.adyacentes(v).hasNext())) return true; 
		else return false;
	}
	
	// >> EJ 3 - :
	public static <E,T> boolean esRegular(Grafo<E,T> g){
		Iterator<Vertice<E>> itv = g.vertices();
		if (itv.hasNext()){
			Vertice<E> v= itv.next();
			Iterator<Vertice<E>> ita = g.adyacentes(v);
			int cont=0;
			
		    while(ita.hasNext()){
			   ita.next();
			   cont++;
		    }
		    while(itv.hasNext()){
			   int cont2=0;
			   v=itv.next();
			   ita = g.adyacentes(v);
			   while(ita.hasNext()){
				  ita.next();
				  cont2++;
			   }if(cont2!=cont) return false;
		    }return true;
	    }else return true;
	}
	
	// >> EJ 4 - CAMINO SIMPLE (NO SE REPITEN LOS VERTICES.):
	public static <E,T> boolean hayCamino (Grafo<E,T> g, Vertice<E> v, Vertice<E> w ){
		Vector<Vertice<E>> vistos=new Vector<Vertice<E>>();
		return hayCamino(g, v, w, vistos);
	}
	private static <E,T> boolean hayCamino (Grafo<E,T> g, Vertice<E> v, Vertice<E> w, Vector<Vertice<E>> vistos){
		vistos.add(v);
		Iterator<Vertice<E>> itAd = g.adyacentes(v);
		while(itAd.hasNext()){
			Vertice<E> x= itAd.next();
			if(x.equals(w)){
				return true;
			} else if (!vistos.contains(x)) return hayCamino(g, x, w, vistos);
		} return false;
		
	}
	
	// >> EJ 5 - DESCUBRIR TODOS LOS CAMINOS:
	public static <E,T> void todosCaminos(Grafo<E,T> g, Vertice<E> v, Vertice<E> w){
		Vector<Vertice<E>> vistos=new Vector<Vertice<E>>();
		todosCaminos(g, v, w, vistos);
	}
	
	private static <E,T> void todosCaminos(Grafo<E,T> g, Vertice<E> v, Vertice<E> w, Vector<Vertice<E>> vistos){
		vistos.add(v);
		if(v.equals(w))
			mostrar(vistos);
		else{
		   Iterator<Vertice<E>> itAd = g.adyacentes(v);
		   while(itAd.hasNext()){
			  Vertice<E> x= itAd.next();
			  if(!vistos.contains(x)){
				  todosCaminos(g, x, w, vistos);
			  }
		   }
	    } vistos.remove(vistos.size()-1);
	}
	
	// >> EJ 7 - ALGORITMO DEL VIAJANTE (RECORRER TODAS LAS CIUDADES CON LA MENOR DISTANCIA TOTAL.):
    public static <E> Grafo<E, Integer> Viajante (Grafo<E, Integer> g, Vertice<E> v){
    	Vertice<E> verticeActual = v;
    	Vector<Vertice<E>> pendientesArco = new Vector<Vertice<E>>();
    	Grafo<E, Integer> solucion = new ListaAdyacencia<E, Integer>();
    	Iterator<Vertice<E>> itv=g.vertices();
    	while(itv.hasNext()){
    		Vertice<E> vert = itv.next();
    		pendientesArco.add(vert);
    	}pendientesArco.remove(verticeActual);
    	
    	while(!pendientesArco.isEmpty()){
    		Arco<E, Integer> arcoMin = minimo(verticeActual, pendientesArco, g.arcos());
    		solucion.insertarArco(arcoMin);
    		pendientesArco.remove(arcoMin.getDestino());
    		verticeActual=arcoMin.getDestino();
    	}return solucion;
    }
    
    public static<E> Arco<E,Integer> minimo (Vertice<E> actual, Vector<Vertice<E>> pendientes, Iterator<Arco<E, Integer>> arcos){
    	Arco<E,Integer> arcoMin=null;
    	int min=Integer.MAX_VALUE;
    	
    	while(arcos.hasNext()){
    		Arco<E,Integer> arc=arcos.next();
    		if(arc.getOrigen().equals(actual) && pendientes.contains(arc.getDestino())){
    			if(arc.getEtiqueta()<min){
    				min=arc.getEtiqueta();
    				arcoMin=arc;
    			}
    		}
    	}return arcoMin;
    	
    }
	
	// >> EJ 8 - PRIM:
	public static <E> Grafo<E,Integer> Prim (Grafo<E,Integer> g, Vertice<E> v){
		Vector<Vertice<E>> vistos=new Vector<Vertice<E>>();
		Vector<Vertice<E>> pendientesArco=new Vector<Vertice<E>>();
		Grafo<E, Integer> toRet = new ListaAdyacencia<E,Integer>();
		Iterator<Vertice<E>> it=g.vertices(); 
		while(it.hasNext()) pendientesArco.add(it.next()); //Incluimos todos los vertices en el vector pendientes
		pendientesArco.remove(v); //Eliminamos de pendientesArco el vertice que pasamos como par�metro
		vistos.add(v);
		
		while(!pendientesArco.isEmpty()){ //Mientras haya vertices por visitar
			Arco<E,Integer> arcoMin = minimo(g.arcos(), vistos, pendientesArco);//Escogemos el arco de m�nima distancia llamando al m�todo "minimo"
			toRet.insertarArco(arcoMin);     //Añadimos dicho arco al grafo solucion
			pendientesArco.remove(arcoMin.getDestino()); //Eliminamos el vertice destino de los pendientesArco
			vistos.add(arcoMin.getDestino());  //Y lo añadimos a los vistos
		}
		return toRet;
	}
	
	public static<E> Arco<E,Integer> minimo(Iterator<Arco<E, Integer>> arcos, Vector<Vertice<E>> visit, Vector<Vertice<E>> pendientes){
		Arco<E,Integer> arcoMin=null;
		int min=Integer.MAX_VALUE;
		
		while(arcos.hasNext()){
			Arco<E,Integer> arc=arcos.next();
			if (visit.contains(arc.getOrigen()) && pendientes.contains(arc.getDestino())){ 
					if(arc.getEtiqueta()<min) {
						min=arc.getEtiqueta();
						arcoMin=arc;
					}
			}
		}return arcoMin;
	}
	
	// >> EJ 9 - DIJKSTRA (DISTANCIA MAS CORTA DE UN VERTICE A LOS DEMAS.):
	public static <E> Map<Vertice<E>, Integer> Dijkstra(Grafo<E, Integer> g, Vertice<E> v){
		Map<Vertice<E>, Integer> toRet = new HashMap<Vertice<E>, Integer>();
		Vector<Vertice<E>> pendientesArco = new Vector<Vertice<E>>();
		Iterator<Vertice<E>> it=g.vertices();
		while(it.hasNext()){ //Inicializar el map y añadir todos los vertices del grafo a la estructura pendientesArco
			Vertice<E> v2 = it.next();
			pendientesArco.add(v2);
			if(v.equals(v2)) toRet.put(v, 0);
			else toRet.put(v2, Integer.MAX_VALUE);
		}
		
		while(!pendientesArco.isEmpty()){  //Mientras pendientesArco no esta vacio
			Vertice<E> aux = minimo(toRet, pendientesArco.iterator()); //Cogemos el vertice por visitar de minima distancia llamando al m�todo minimo
			while(g.adyacentes(aux).hasNext()){  //Calculamos sus adyacentes que faltan por visitar
				Vertice<E> ady = g.adyacentes(aux).next();
				while(g.arcos().hasNext()){  //Calculamos sus adyacentes que faltan por visitar
					Arco<E, Integer> arc = g.arcos().next();
					if(arc.getOrigen().equals(aux) && arc.getDestino().equals(ady) && pendientesArco.contains(ady)){
						Integer valor = arc.getEtiqueta()+toRet.get(aux);
						if(toRet.get(ady) > valor){
							toRet.remove(ady);
							toRet.put(aux, valor); //Actualizamos el map
						}
					}
			    }
		    }pendientesArco.remove(aux);
		}return toRet;
	}
	
	// >> RECORRE TODO EL MAPA Y DEVUELVE EL VERTICE DE MINIMA DISTANCIA.
	public static <E> Vertice<E> minimo (Map<Vertice<E>, Integer> distancias, Iterator<Vertice<E>> pendientes){
		Vertice<E> vertMin=null;
		int min=Integer.MAX_VALUE;
		
		while (pendientes.hasNext()){ //Recorre pendientes y compara con distancias.
			Vertice<E> v= pendientes.next();
			if (distancias.get(v)< min) vertMin= v;
		}return vertMin;
	}
	
	//MAIN...
	public static void main(String [] args){
		Grafo<String, Integer>  Galicia = new ListaAdyacencia<String, Integer>();
		Grafo<String, Integer>  Andalucia = new ListaAdyacencia<String, Integer>();
		Grafo<String, Integer>  Regular = new ListaAdyacencia<String, Integer>();
		Grafo<String, Integer>  Regular2 = new ListaAdyacencia<String, Integer>();
		
		Vertice<String> c=new Vertice<String>("Coruña");
		Vertice<String> l=new Vertice<String>("Lugo");
		Vertice<String> o=new Vertice<String>("Ourense");
		Vertice<String> p=new Vertice<String>("Pontevedra");
		
		Vertice<String> s=new Vertice<String>("Sevilla");
		Vertice<String> m=new Vertice<String>("Malaga");
		Vertice<String> g=new Vertice<String>("Granada");
		
		Vertice<String> z=new Vertice<String>("Z");
		Vertice<String> x=new Vertice<String>("X");
		Vertice<String> w=new Vertice<String>("W");
		Vertice<String> y=new Vertice<String>("Y");

	
	    Galicia.insertarArco(new Arco<String, Integer> (o, p, 91));
		Galicia.insertarArco(new Arco<String, Integer> (c, p, 159));
		Galicia.insertarArco(new Arco<String, Integer> (l, p , 160));	
		
	    Andalucia.insertarArco(new Arco<String, Integer> (s, m, 100));
	    Andalucia.insertarArco(new Arco<String, Integer> (m, g, 202));
	    Andalucia.insertarArco(new Arco<String, Integer> (g, s, 108));
	    
	    //Grafo no dirigido
	    Regular.insertarArco(new Arco<String, Integer> (z, x, 120));
	    Regular.insertarArco(new Arco<String, Integer> (x, z, 120));
	    Regular.insertarArco(new Arco<String, Integer> (x, w, 70));
	    Regular.insertarArco(new Arco<String, Integer> (w, x, 70));
	    Regular.insertarArco(new Arco<String, Integer> (w, z, 21));
	    Regular.insertarArco(new Arco<String, Integer> (z, w, 21));
	    Regular.insertarArco(new Arco<String, Integer> (w, y, 200));
	    Regular.insertarArco(new Arco<String, Integer> (y, w, 200));
	    Regular.insertarArco(new Arco<String, Integer> (y, x, 10));
	    Regular.insertarArco(new Arco<String, Integer> (x, y, 10));
	    Regular.insertarArco(new Arco<String, Integer> (z, y, 95));
	    Regular.insertarArco(new Arco<String, Integer> (y, z, 95));
	    
	    //Grafo regular
	    Regular2.insertarArco(new Arco<String, Integer> (z, x, 90));
	    Regular2.insertarArco(new Arco<String, Integer> (x, w, 90));
	    Regular2.insertarArco(new Arco<String, Integer> (w, z, 90));
	    

        System.out.print("Predecesores de Pontevedra en Galicia: ");
	    mostrar(predecesores(Galicia, p));
	    System.out.println("Pontevedra es sumidero en Galicia?: "+ esSumidero(Galicia, p));
	    
	    System.out.print("Predecesores de Granada en Andalucia: ");
	    mostrar(predecesores(Andalucia, g));
	    System.out.println("Granada es sumidero en Andalucia?: "+ esSumidero(Andalucia, g));
	    
	    System.out.println("Es regular el grafo 'Regular2'?: " + esRegular(Regular2));
	    
	    System.out.println("Hay camino entre Ourense y Lugo en Galicia?: " + hayCamino(Galicia, o, l));
	    System.out.println("Hay camino entre Sevilla y Granada en Andalucia?: " + hayCamino(Andalucia, s, g));
	    
	   System.out.println("Todos los caminos entre z e y en Regular: ");
	   todosCaminos(Regular, z, y);
	    
	    System.out.println("Prim en Regular partiendo de y : ");
	    mostrar(Prim(Regular, y).vertices());
	    
	    System.out.println("Viajante en Regular partiendo de w : ");
	    mostrar(Viajante(Regular, w).vertices());
	    
	    System.out.println("Dijkstra en Regular partiendo de w : ");
	    mostrar(Dijkstra(Regular, w));
        System.out.println(Dijkstra(Regular, w).isEmpty());
	    
	    	 
	}
}
