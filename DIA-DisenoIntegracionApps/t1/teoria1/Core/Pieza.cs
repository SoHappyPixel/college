using System;
namespace teoria1.Core
{
	public class Pieza
	{

		public Pieza()
		{
			this.Codigo = 0;
			this.Nombre = "";
			this.Existencias = 0;
		}

		public int Codigo { get; private set; }
		public string Nombre { get; private set; }
		public int Existencias { get; private set; }
	}
}
