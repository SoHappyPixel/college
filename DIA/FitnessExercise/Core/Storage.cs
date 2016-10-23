using System;
using System.IO;
using System.Text;
using System.Xml.Linq;
using System.Collections.Generic;

namespace FitnessExercise.core
{
	public class Storage
	{
		public List<Exercise> exercises = new List<Exercise>();

		public void AddExercise(Exercise exercise) => this.exercises.Add(exercise);

		public void SaveXml()
		{
			var root = new XElement("Exercises");

			foreach (Exercise ex in exercises)
			{
				var child = new XElement("Exercise");

				child.Add(new XAttribute("Name", ex.Name));
				child.Add(new XAttribute("Meters", ex.Meters));
				child.Add(new XAttribute("Minutes", ex.Minutes));
				child.Add(new XAttribute("Date", ex.Date.ToString()));

				root.Add(child);
			}

			root.Save("exercises.xml");
		}

	}
}
