using System;
using System.IO;
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

		public void Save2XML()
		{
			var Child = new XElement("Exercise");

			Child.Add(new XAttribute("Name", this.Name));
			Child.Add(new XAttribute("Meters", this.Meters));
			Child.Add(new XAttribute("Minutes", this.Minutes));
			Child.Add(new XAttribute("Date", this.Date.ToString()));

			if (File.Exists("exercises.xml")) // Update..
			{
				var Root = XElement.Load("exercises.xml");
				Root.Add(Child);
				Root.Save("exercises.xml");
			}
			else { // Creat new ...
				var Root = new XElement("Exercises");
				Root.Add(Child);
				Root.Save("exercises.xml");
			}
		}
	}
}
