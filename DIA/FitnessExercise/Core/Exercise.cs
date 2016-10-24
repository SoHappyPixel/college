using System;
using System.IO;
using System.Text;
using System.Linq;
using System.Xml.Linq;

namespace FitnessExercise.Core
{
	public class Exercise
	{
		public string Name { get; private set; }
		public float  Meters { get; private set; }
		public short  Minutes { get; private set; }
		public DateTime Date { get; private set; }

		public Exercise( string Name, float Meters, short Minutes)
		{
			this.Name = Name;
			this.Meters = Meters;
			this.Minutes = Minutes;
			this.Date = DateTime.Now;
		}

		public void SaveXML()
		{
			var NewRoot = new XElement("Exercise");

			NewRoot.Add(new XAttribute("Name", this.Name));
			NewRoot.Add(new XAttribute("Meters", this.Meters));
			NewRoot.Add(new XAttribute("Minutes", this.Minutes));
			NewRoot.Add(new XAttribute("Date", this.Date.ToString()));

			if (File.Exists("exercises.xml"))
			{
				var OldRoot = XElement.Load("exercises.xml");
				OldRoot.Add(NewRoot);
				OldRoot.Save("exercises.xml"); // Update...
			}
			else {
				NewRoot.Save("exercises.xml"); // Create new...
			}
		}

		public void LoadXML()
		{
			if (File.Exists("exercises.xml"))
			{
				var root = XElement.Load("exercises.xml");

				var ex = from e in
					root.Elements("Exercise")
						 select e.Attributes();

				foreach (var e in ex)
				{
					foreach (var a in e)
					{
						Console.Write(a + " ");
					}
					Console.WriteLine();
				}
			}
		}

	}
}
