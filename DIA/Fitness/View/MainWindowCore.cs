using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using System.Collections.Generic;

using Fitness.Core;

namespace Fitness.View
{
	public partial class MainWindow
	{
		private void OnClose() => Gtk.Application.Quit();

		private void FillTreeView()
		{
			var LoadedExercises = ListEXE();
			foreach (var le in LoadedExercises)
			{
				this.ExercisesModel.AppendValues(
					le.Name, le.Meters.ToString(), le.Minutes.ToString(), le.Date.ToString());
			}
		}

		private List<Exercise> ListEXE()
		{
			var fromXML = new List<Exercise>();
			if (File.Exists("exercises.xml"))
			{
				var Root = XElement.Load("exercises.xml");

				var LoadExercises = from e in Root.Elements("Exercise") select e.Attributes();

				foreach (var e in LoadExercises)
				{
					var Name = e.ElementAt(0).Value;
					var Meters = Convert.ToSingle(e.ElementAt(1).Value);
					var Minutes = Convert.ToInt16(e.ElementAt(2).Value);
					DateTime Date = Convert.ToDateTime(e.ElementAt(3).Value);

					var LoadedEXE = new Exercise(Name, Meters, Minutes, Date);
					fromXML.Add(LoadedEXE);
				}
			}
			return fromXML;
		}

		private void SaveEXE()
		{
			var Name = this.EntryName.Text;
			var Meters = Convert.ToSingle(this.EntryMeters.Text);
			var Minutes = Convert.ToInt16(this.EntryMinutes.Text);

			var e = new Exercise(Name, Meters, Minutes);
			e.Save2XML();
			this.FillTreeView();
		}

		private void EditEXE() { }
		private void DeleteEXE() { }
	}
}