

public class MontonIntermedio extends Monton {
	
	

	// metodo para a�adir de baraja a descarte
	public boolean puedoInsertar(Carta c) {
		if (isEmpty()) {
			return true;
		} else {
			if (c.getPalo() != getCarta().getPalo()
					&& c.getNumero() == (getCarta().getNumero() - 1)) {

				return true;
			} else {
				return false;
			}
		}
	}


}
