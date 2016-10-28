using System;
using System.Text;
using System.Collections.Generic;

namespace EjUno
{
	public class Poligono
	{

		private List<Punto> puntos = new List<Punto>();

		public Poligono(Punto[] pts)
		{
			this.AddRange(pts);
		}

		public void Add(Punto p)
		{
			this.puntos.Add(p);
		}

		public void AddRange(Punto p)
		{
			this.puntos.AddRange(p);
		}

		public Punto[] Puntos
		{
			get { return this.puntos.ToArray(); }
			set
			{
				this.puntos.Clear();
				this.puntos.AddRange(value);
			}
		}

		public int Count
		{
			get { return this.puntos.Count; }
		}

		public override string ToString()
		{
			var toret = new StringBuilder();
			foreach (var p in this.puntos)
			{
				toret.Append(p.ToString());
			}
			return toret.ToString();
		}
	}
}
