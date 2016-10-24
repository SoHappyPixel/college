using System;

namespace FitnessExercise.View
{
	public partial class MainWindow : Gtk.Window
	{
		private Gtk.Entry EntryName;
		private Gtk.Entry EntryMeters;
		private Gtk.Entry EntryMinutes;

		public MainWindow() : base(Gtk.WindowType.Toplevel) { this.Build(); }

		private void Build()
		{
			var vBox = new Gtk.VBox(false, 5);

			// Events
			this.DeleteEvent += (o, args) => this.OnClose(); // Close the window to close the app

			// Buttons
			var SaveButton = new Gtk.Button("SAVE");
			SaveButton.Clicked += (sender, e) => this.OnSave();

			// Widgets
			var lbl = new Gtk.Label("<b>Fitness Exercises</b>");
			lbl.UseMarkup = true;

			this.EntryName = new Gtk.Entry("0");
			this.EntryName.Alignment = 1;
			this.EntryMeters = new Gtk.Entry("0");
			this.EntryMeters.Alignment = 1;
			this.EntryMinutes = new Gtk.Entry("0");
			this.EntryMinutes.Alignment = 1;

			// VBox
			vBox.PackStart(lbl, true, false, 5);
			vBox.PackStart(this.EntryName, true, false, 5);
			vBox.PackStart(this.EntryMeters, true, false, 5);
			vBox.PackStart(this.EntryMinutes, true, false, 5);
			vBox.PackStart(SaveButton, true, false, 5);

			// Add the VBox
			this.Add(vBox);
		}
	}
}