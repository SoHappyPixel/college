using System;

namespace Pal
{
	class Program
	{
		static void Main(string[] args)
		{
			string Pal = "";
			string InvPal = "";
			string Words = args[0];

			for ( int i = 0; i < Words.Length; i++ )
			{
				if (Char.IsLetter(Words[i]))
				{
					Pal += Words[i];
				}
			}
			Console.Write("Pal:  ");
			Console.WriteLine(Pal);

			for ( int i = Pal.Length-1; i >= 0; i-- )
			{
				InvPal += Pal[i];
			}
			Console.Write("InvPal:  ");
			Console.WriteLine(InvPal);

			if ( Pal.Equals(InvPal) )
			{
				Console.WriteLine("Es un palíndromo.");
			}
			else
			{
				Console.WriteLine("No es un palíndromo.");
			}

		}
	}
}
