using System;
using System.Collections.Generic;

namespace Dups
{
	class Program
	{
		// Leer string de consola
		// Hacer un split de la cadena con los delimitadores
		// Guardar la cadena en una lista y usar contains en un
		// for para comprobar si hay más de uno.
		static void Main(string[] args)
		{
			string nums = args[0];

			var SplitedNums = nums.Split(' ');
			/* SplitedNums = SplitedNums.Split(','); */
			/* SplitedNums = SplitedNums.Split('-'); */

			Console.WriteLine(SplitedNums);

			/* var save = new List<int>(); */

			/* for ( i = 0; i < nums.Length; i++) */
			/* { */
			/* // guardar en la lista */
			/* } */

			/* for (int i = 0; i < lista1.Count; i++) */
			/* { */
			/*     if (!(listaNueva.Contains(lista1[i]))) */
			/*     { */
			/*         listaNueva.Add(lista1[i]); */
			/*     } */
			/* } */
		}
	}
}
