using System;

namespace Fitness.View
{
	public partial class MainWindow : Gtk.Window
	{
		private Gtk.Entry EntryName;
		private Gtk.Entry EntryMeters;
		private Gtk.Entry EntryMinutes;
		private Gtk.TreeView Exercises;
		private Gtk.ListStore ExercisesModel;

		public MainWindow() : base(Gtk.WindowType.Toplevel) { this.Build(); }

		[GLib.ConnectBeforeAttribute]
		protected void OnClick(object sender, Gtk.ButtonPressEventArgs e)
		{
			if (e.Event.Button == 3) /* right click */
			{
				Gtk.Menu m = new Gtk.Menu();
				Gtk.MenuItem deleteItem = new Gtk.MenuItem("Delete this item");
				deleteItem.ButtonPressEvent += (o, args) => this.DeleteEXE();
				m.Add(deleteItem);
				m.ShowAll();
				m.Popup();
			}
		}


		private void Build()
		{
			// EVENTS
			this.DeleteEvent += (o, args) => this.OnClose();


			// WIDGETS

			// ... Initializations

			// ... ... Tree
			this.Exercises = new Gtk.TreeView();

			// ... ... ... Tree model
			ExercisesModel = new Gtk.ListStore(typeof(string), typeof(string), typeof(string), typeof(string));
			Exercises.ButtonPressEvent += new Gtk.ButtonPressEventHandler(OnClick);

			// ... ... Entrys
			this.EntryName = new Gtk.Entry("");
			this.EntryMeters = new Gtk.Entry("");
			this.EntryMinutes = new Gtk.Entry("");

			// ... ... ... Entrys properties
			this.EntryName.Alignment = 0.5f;
			this.EntryMeters.Alignment = 0.5f;
			this.EntryMinutes.Alignment = 0.5f;

			// ... ... Labels
			var Title = new Gtk.Label("<b>EXERCISES</b>");
			Title.UseMarkup = true;
			var NameLabel = new Gtk.Label("Name:");
			var MetersLabel = new Gtk.Label("Meters:");
			var MinutesLabel = new Gtk.Label("Minutes:");

			// ... ... Buttons
			var SaveButton = new Gtk.Button("SAVE");
			SaveButton.Clicked += (o, args) => this.SaveEXE();

			// ... ... Main box
			var vbMain = new Gtk.VBox(false, 5);
			var TreeScroll = new Gtk.ScrolledWindow();

			// ... ... VBoxs
			var ItemNameBlock = new Gtk.HBox(false, 5);
			var ItemMetersBlock = new Gtk.HBox(false, 5);
			var ItemMinutesBlock = new Gtk.HBox(false, 5);

			// ... ... HBoxs
			var TreeSpace = new Gtk.HBox(false, 5);
			var NewItemSpace = new Gtk.VBox(false, 5);
			var ButtonSaveSpace = new Gtk.HBox(false, 5);



			// ... Compose them

			// ... ... Tree 

			// ... ... ...  Tree append columns
			this.Exercises.AppendColumn("Name", new Gtk.CellRendererText(), "text", 0);
			this.Exercises.AppendColumn("Meters", new Gtk.CellRendererText(), "text", 1);
			this.Exercises.AppendColumn("Minutes", new Gtk.CellRendererText(), "text", 2);
			this.Exercises.AppendColumn("Date", new Gtk.CellRendererText(), "text", 3);

			// ... ... ...  Tree rows format 
			this.Exercises.Model = ExercisesModel;

			// ... ... ... Tree load data
			this.FillTreeView();

			// ... ... Fill vboxs
			ItemNameBlock.Add(NameLabel);
			ItemNameBlock.Add(this.EntryName);

			ItemMetersBlock.Add(MetersLabel);
			ItemMetersBlock.Add(this.EntryMeters);

			ItemMinutesBlock.Add(MinutesLabel);
			ItemMinutesBlock.Add(this.EntryMinutes);

			// ... ... Fill hboxs
			TreeScroll.Add(this.Exercises);
			TreeSpace.Add(TreeScroll);

			NewItemSpace.Add(ItemNameBlock);
			NewItemSpace.Add(ItemMetersBlock);
			NewItemSpace.Add(ItemMinutesBlock);

			ButtonSaveSpace.Add(SaveButton);

			// ... ... Compose main vBox
			vbMain.PackStart(Title, true, true, 5);
			vbMain.PackStart(TreeSpace, true, true, 5);
			vbMain.PackStart(NewItemSpace, true, true, 5);
			vbMain.PackStart(ButtonSaveSpace, true, true, 5);


			// ... ... Add main box to the window
			this.Add(vbMain);
		}
	}
}