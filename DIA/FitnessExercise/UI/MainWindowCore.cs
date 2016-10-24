using System;
using FitnessExercise.Core;

namespace FitnessExercise.View
{
	public partial class MainWindow
	{
		private void OnClose() => Gtk.Application.Quit();

		private void OnSave()
		{
			string SaveName = this.EntryName.Text;
			float SaveMeters = Convert.ToSingle(this.EntryMeters.Text);
			short SaveMinutes = Convert.ToInt16(this.EntryMinutes.Text);
			var e = new Exercise(SaveName, SaveMeters, SaveMinutes);
			e.SaveXML();
		}

		private void OnEdit() { }
		private void OnDelete() { }
	}
}

//Meters = Convert.ToSingle(this.EntryMeters.Text);
//Minutes = Convert.ToInt16(this.EntryMinutes.Text);