using System;
using System.IO;
using System.Text;
using System.Xml.Linq;
using System.Collections.Generic;

namespace FitnessExercises.core
{
	public class Storage
	{
		public List<Exercise> exercises = new List<Exercise>();

		public void Addexercise(Exercise exercise)
		{
			short Minutes = exercise.Minutes;
			this.exercises.Add(exercise);
		}

		public void SaveXml()
		{
			var xmlFile = new XmlTextWriter("exercises.xml", Encoding.UTF8);
			xmlFile.Formatting = Formatting.Indented;

			xmlFile.WriteStartDocument();
			xmlFile.WriteStartElement("exs");

			foreach (Exercise ex in exercises)
			{
				xmlFile.WriteStartElement("Exercise");

				xmlFile.WriteStartAttribute("Name");
				xmlFile.WriteString(ex.Name);
				xmlFile.WriteEndAttribute();

				xmlFile.WriteStartAttribute("Meters");
				xmlFile.WriteString(ex.Meters);
				xmlFile.WriteEndAttribute();

				xmlFile.WriteStartAttribute("Minutes");
				xmlFile.WriteString(ex.Minutes);
				xmlFile.WriteEndAttribute();

				xmlFile.WriteEndElement();
			}

			xmlFile.WriteEndElement();
			xmlFile.WriteEndDocument();
			xmlFile.Close();
		}

	}
}
