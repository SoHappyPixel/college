using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace Fitness.Core
{
	public class Exercise
	{
		// VARS ...
		private string name;
		private short meters;
		private short minutes;
		private DateTime date;

		// PROPS ...
		public string Name
		{
			get { return name; } 
			set { this.name = value; }
		}

		public short Meters
		{
			get { return meters; }
			set { this.meters = value; }
		}

		public short  Minutes
		{
			get { return minutes; }
			set { this.minutes = value; }
		}

		public DateTime Date
		{
			get { return date; }
			set { this.date = value; }
		}


		// CONSTRUCTOR ...

		// ... Para creación inicial.
		public Exercise(string name, short meters, short minutes)
		{
			this.Name = name;
			this.Meters = meters;
			this.Minutes = minutes;
			this.Date = DateTime.Now;
		}

		// ... Para utilizar en la carga del XML.
		public Exercise(string name, short meters, short minutes, DateTime date)
		{
			this.Name = name;
			this.Meters = meters;
			this.Minutes = minutes;
			this.Date = date;
		}

	}
}
