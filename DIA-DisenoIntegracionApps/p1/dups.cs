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

			var dups = splt.GroupBy(x => x)
				.Where(g => g.Count() > 1)
				.Select(g => g.Key)
				.ToList();

			foreach(var item in dups)
			{
				Console.Write(item.ToString() + " ");
			}
		}
	}
}
