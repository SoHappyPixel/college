using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace Fitness.Core
{
	public class Exercise
	{
		public string Name { get; private set; }
		public float  Meters { get; private set; }
		public short  Minutes { get; private set; }
		public DateTime Date { get; private set; }


		// Constructor para creación inicial.
		public Exercise(string Name, float Meters, short Minutes)
		{
			this.Name = Name;
			this.Meters = Meters;
			this.Minutes = Minutes;
			this.Date = DateTime.Now;
		}

		// Constructor a utilizar en la carga del XML.
		public Exercise(string Name, float Meters, short Minutes, DateTime Date)
		{
			this.Name = Name;
			this.Meters = Meters;
			this.Minutes = Minutes;
			this.Date = Date;
		}

		// Crea este objeto en un XML si el XML ya existe lo actualiza añadiendo el objetvo.
		public void Save2XML()
		{
			var Child = new XElement("Exercise");
			Child.Add(new XAttribute("Name", this.Name));
			Child.Add(new XAttribute("Meters", this.Meters));
			Child.Add(new XAttribute("Minutes", this.Minutes));
			Child.Add(new XAttribute("Date", this.Date.ToString()));

			// Update ...
			if (File.Exists("exercises.xml"))
			{
				var Root = XElement.Load("exercises.xml");
				Root.Add(Child);
				Root.Save("exercises.xml");
			}
			// Creat new ...
			else
			{
				var Root = new XElement("Exercises");
				Root.Add(Child);
				Root.Save("exercises.xml");
			}
		}

	}
}
