using System;
namespace EjTres.Core
{

	/* Usando Herencia. (PEOR)
	 * Obtenemos eficiencia pero perdemos en lógica,
	 * ya que para crear un punto 3D, creamos un punto 2D
	 * pero si eliminasemos el punto 3D, no elminiaríamos el punto 2D
	 * ya que el punto 2D exisitiría más allá del ámbito de nuestro punto 3D.
	 */

	public class Punto3D_h : Punto2D
	{
		public int z { get; private set; }

		public Punto3D_h(int x, int y, int z) : base(x,y)
		{
			this.z = z;
		}
	}
}
