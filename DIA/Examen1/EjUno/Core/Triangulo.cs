using System;
namespace EjUno
{
	public class Triangulo : Poligono
	{
		public int Base { get; private set; }
		public int Altura { get; private set; }

		public Triangulo(int Base, int Altura)
		{
			this.Base = Base;
			this.Altura = Altura;
		}

		public override double Area
		{
			get { return (this.Base * this.Altura) / 2; }
		}
	}
}