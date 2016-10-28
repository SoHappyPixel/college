using System;
namespace EjUno
{
	public class Rectangulo : Poligono
	{
		public int Lado1 { get; private set; }
		public int Lado2 { get; private set; }

		public Rectangulo(int Lado1, int Lado2)
		{
			this.Lado1 = Lado1;
			this.Lado2 = Lado2;
		}

		public override double Area
		{
			get { return this.Lado1 * this.Lado2; }
		}
	}
}
