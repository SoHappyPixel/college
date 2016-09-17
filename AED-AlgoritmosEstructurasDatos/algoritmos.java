import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

public class Actividad9 {

	// MO-CHILA!
	public static Map<String, Integer> llenarMochila(int volumenMaximo, Map<String, Integer> cantidades, Map<String, Integer> volumenes) {
		Map<String, Integer> S = new TreeMap<String, Integer>();
		Set<String> objetosUtilizados = new TreeSet<String>();

		int volumenOcupado = 0;
		int k = 0;

		while (volumenOcupado < volumenMaximo) {
			String obj = mayor(volumenMaximo - volumenOcupado, volumenes, objetosUtilizados);
			
			if (obj != null) {
				objetosUtilizados.add(obj);
				int vol = volumenes.get(obj);

				k = (volumenMaximo - volumenOcupado) / vol;
				int totalCan = cantidades.get(obj);

				if (k > totalCan) k = totalCan;
				
				S.put(obj, k);
				cantidades.put(obj, totalCan - k);
				volumenOcupado += vol * k;

			} else return new TreeMap<String, Integer>();
		}return S;
	}
	
	private static String mayor(int espacioDisponible, Map<String, Integer> volumen, Set<String> utilizadas) {
		String max = null;
		int maxVolumen = 0;

		Iterator<String> objeto = volumen.keySet().iterator();

		while (objeto.hasNext()) {
			String mayor = objeto.next();
			int vol = volumen.get(mayor);

			if ((!utilizadas.contains(mayor)) && (vol > maxVolumen) && (vol <= espacioDisponible)) {
				maxVolumen = vol;
				max = mayor;
			}
		} return max;
	}

	// DAR CAMBIO.
	public static boolean darCambio(int importeDevolver, Map<Integer, Integer> C, Map<Integer, Integer> S){
		int devuelto = 0;
		boolean objetivo = false;
		Iterator<Integer> mon = C.keySet().iterator();

		while (mon.hasNext() && !objetivo) {
			int moneda = mon.next();

			if (C.get(moneda) > 0 && importeDevolver - devuelto >= moneda){
				devuelto += moneda;
				C.put(moneda, C.get(moneda) - 1);
			}

			if (devuelto == importeDevolver) {
				S.put(moneda, S.get(moneda) + 1);
				objetivo = true;
			} else {
				objetivo = darCambio(importeDevolver - devuelto, C, S);
				if (objetivo) S.put(moneda, S.get(moneda) + 1);
				else {
					C.put(moneda, C.get(moneda) + 1);
					devuelto -= moneda;
				}
			}
		}return objetivo;
	}
}
