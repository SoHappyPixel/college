using System;
using System.Collections.Generic;

namespace Dups
{
	class Program
	{
		static void Main(string[] args)
		{
			var Splitted = new HashSet<string>(args[0].Split(',','-',' '));

			foreach(var item in Splitted)
			{
				Console.Write(item.ToString() + " ");
			}
		}
	}
}
