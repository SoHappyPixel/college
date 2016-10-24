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
			// Widgets

			// ... Labels
			var title = new Gtk.Label("<b>Fitness Exercises</b>");
			title.UseMarkup = true;

			// ... Entrys
			this.EntryName = new Gtk.Entry("");
			this.EntryName.Alignment = 0.5f;
			this.EntryMeters = new Gtk.Entry("");
			this.EntryMeters.Alignment = 0.5f;
			this.EntryMinutes = new Gtk.Entry("");
			this.EntryMinutes.Alignment = 0.5f;

			// ... Buttons
			var SaveButton = new Gtk.Button("SAVE");
			SaveButton.Clicked += (sender, e) => this.SaveEXE();

			var ListButton = new Gtk.Button("LIST");
			ListButton.Clicked += (sender, e) => this.ListEXE();


			// Events
			this.DeleteEvent += (o, args) => this.OnClose();


			// VBox
			var vBox = new Gtk.VBox(false, 5);

			vBox.PackStart(title, true, true, 5);
			vBox.PackStart(this.EntryName, false, false, 1);
			vBox.PackStart(this.EntryMeters, false, false, 1);
			vBox.PackStart(this.EntryMinutes, false, false, 1);
			vBox.PackStart(SaveButton, false, false, 3);
			vBox.PackStart(ListButton, false, false, 3);


			// Add the VBox
			this.Add(vBox);
		}
	}
}