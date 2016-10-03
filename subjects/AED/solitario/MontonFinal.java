

public class MontonFinal extends Monton {

	
	// metodo para añadir de baraja a descarte
	public boolean puedoInsertar(Carta c) {
		if (isEmpty()) {
			return (c.getNumero() == 1);
		} else {
			if (c.getNumero() == (getCarta().getNumero() + 1) && c.getPalo().equals(getCarta().getPalo())) {
				return true;
			} else {
				return false;
			}
		}
	}








}
