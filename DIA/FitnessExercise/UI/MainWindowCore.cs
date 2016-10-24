using System;
using System.IO;
using System.Linq;
using System.Xml.Linq;
using FitnessExercise.Core;

namespace FitnessExercise.View
{
	public partial class MainWindow
	{
		private void OnClose() => Gtk.Application.Quit();

		public void ListEXE()
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

		private void SaveEXE()
		{
			string SaveName = this.EntryName.Text;
			float SaveMeters = Convert.ToSingle(this.EntryMeters.Text);
			short SaveMinutes = Convert.ToInt16(this.EntryMinutes.Text);
			var e = new Exercise(SaveName, SaveMeters, SaveMinutes);
			e.Save2XML();
		}

		private void EditEXE() { }
		private void DeleteEXE() { }
	}
}