
	import pila.EnlazadaPila;
	import pila.Pila;


	public abstract class Monton {
		protected Pila<Carta> cartas;
		
		public Monton(){
			cartas=new EnlazadaPila<Carta>();
			
		}
		public Carta getCarta(){
			if (isEmpty()){
				return null;
			}
			return cartas.top();
		}
		public Carta sacarCarta(){
			return cartas.pop();
		}
		public int getNumElem(){
			return cartas.tamaño();
		}
		public boolean isEmpty(){
			return cartas.esVacio();
		}
		public String toString(){
			if(cartas.esVacio()){
			return "Monton vacio";
		}else{
			return getCarta().toString();
		}
		}
		public void insertarCarta(Carta c){
			cartas.push(c);
		}
		
		public abstract boolean puedoInsertar(Carta c);

	}

