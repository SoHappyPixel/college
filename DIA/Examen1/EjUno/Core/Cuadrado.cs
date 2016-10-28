using System;
namespace EjUno
{
	public class Cuadrado : Poligono
	{
		public int Lado { get; private set; }

		public Cuadrado(int Lado)
		{
			this.Lado = Lado;
		}

		public override double Area
		{
			get { return this.Lado * this.Lado; }
		}
	}
}
