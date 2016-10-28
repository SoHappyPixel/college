using System;
namespace EjTres.Core
{
	public class Punto2D
	{
		public int x { get; private set; }
		public int y { get; private set; }

		public Punto2D(int x, int y)
		{
			this.x = x;
			this.y = y;
		}
	}
}
