using System;
namespace EjTres.Core
{

	/* Uando Composición. (MEJOR)
	 * Perdemos un poco de eficiencia pero ganamos en lógica,
	 * por lo cual el comportamiento del código resulta más sencillo de entender,
	 * ya que para crear un punto 3D de esta manera, seguimos creando un punto 2D,
	 * pero si eliminasemos el punto 3D el punto 2D moriría con él, ya que pertenece al ámbito de éste.
	 */

	public class Punto3D_c
	{
		public Punto2D d { get; private set; }
		public int z { get; private set; }

		public Punto3D_c(int x, int y, int z)
		{
			this.d = new Punto2D(x,y);
			this.z = z;
		}


	}
}
