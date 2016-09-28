using System;
using System.Linq;
using System.Collections.Generic;

namespace Dups
{
	class Program
	{
		static void Main(string[] args)
		{
			var splt = new List<string>(args[0].Split(',','-',' '));

			var dups = splt.GroupBy(s => s)
				.SelectMany(grp => grp.Skip(1))
				.Distinct();

			foreach(var item in dups)
				Console.Write(item.ToString() + " ");
		}
	}
}
