using System;
using Fitness.Core;

namespace Fitness.View
{
	public partial class MainWindow : Gtk.Window
	{
		private Gtk.Entry EntryName;
		private Gtk.Entry EntryMeters;
		private Gtk.Entry EntryMinutes;
		private Gtk.TreeView Exercises;
		private Gtk.ListStore ExeModel;

		private Gtk.VBox ViewBox = new Gtk.VBox(false, 5);
		private Gtk.VBox TreeAddView = new Gtk.VBox(false, 5);
		//private Gtk.VBox TreeModView = new Gtk.VBox(false, 5);

		public MainWindow() : base(Gtk.WindowType.Toplevel) { this.Build(); this.OnInit(); }

		private void Build()
		{
			// ----------------------TAMANHO------------------------

			this.SetGeometryHints(
				this, new Gdk.Geometry() { MinWidth = 300, MinHeight = 300 }, Gdk.WindowHints.MinSize);

			// ----------------------EVENTOS------------------------

			this.DeleteEvent += (o, args) => this.OnClose();

			// ------------------INICIALIZACION---------------------

			// Labels.
			var SectionTitle = new Gtk.Label("<b>EXERCISES</b>");
			SectionTitle.UseMarkup = true;

			// Tree.
			this.Exercises = new Gtk.TreeView();
			// Tree Model.
			this.ExeModel = new Gtk.ListStore(typeof(string), typeof(string), typeof(string), typeof(string));
			this.Exercises.RowActivated += new Gtk.RowActivatedHandler(this.OnSelect);

			// Boxes Creation.
			var TreeScroll = new Gtk.ScrolledWindow();
			var TreeSpace = new Gtk.HBox(false, 5);

			// -------------------COMPOSICION------------------------

			// Tree.
			this.Exercises.Model = ExeModel;
			// Tree Columns Append.
			this.Exercises.AppendColumn("Name", new Gtk.CellRendererText(), "text", 0);
			this.Exercises.AppendColumn("Meters", new Gtk.CellRendererText(), "text", 1);
			this.Exercises.AppendColumn("Minutes", new Gtk.CellRendererText(), "text", 2);
			this.Exercises.AppendColumn("Date", new Gtk.CellRendererText(), "text", 3);

			// Fill Boxes.
			TreeScroll.Add(this.Exercises);
			TreeSpace.Add(TreeScroll);

			ViewBox.Add(SectionTitle);
			ViewBox.Add(TreeSpace);

			this.Add(ViewBox);
			this.BuildAddView();
		}

		private void BuildAddView()
		{
			//ViewBox.Remove(TreeModView);

			// ------------------INICIALIZACION---------------------

			// Entrys.
			this.EntryName = new Gtk.Entry("");
			this.EntryMeters = new Gtk.Entry("");
			this.EntryMinutes = new Gtk.Entry("");

			// Entrys Properties.
			this.EntryName.Alignment = 0.5f;
			this.EntryMeters.Alignment = 0.5f;
			this.EntryMinutes.Alignment = 0.5f;

			// Labels.
			var NameLabel = new Gtk.Label("Name:");
			var MetersLabel = new Gtk.Label("Meters:");
			var MinutesLabel = new Gtk.Label("Minutes:");

			// Buttons.
			var SaveButton = new Gtk.Button("ADD");
			SaveButton.Clicked += (o, args) => this.OnAdd();

			// VBoxs.
			var ItemNameBlock = new Gtk.HBox(false, 5);
			var ItemMetersBlock = new Gtk.HBox(false, 5);
			var ItemMinutesBlock = new Gtk.HBox(false, 5);

			// HBoxs.
			var NewItemSpace = new Gtk.VBox(false, 5);
			var ButtonSaveSpace = new Gtk.HBox(false, 5);

			// -------------------COMPOSICION------------------------

			// Fill vboxs.
			ItemNameBlock.Add(NameLabel);
			ItemNameBlock.Add(this.EntryName);

			ItemMetersBlock.Add(MetersLabel);
			ItemMetersBlock.Add(this.EntryMeters);

			ItemMinutesBlock.Add(MinutesLabel);
			ItemMinutesBlock.Add(this.EntryMinutes);

			// Fill hboxs.
			NewItemSpace.Add(ItemNameBlock);
			NewItemSpace.Add(ItemMetersBlock);
			NewItemSpace.Add(ItemMinutesBlock);
			ButtonSaveSpace.Add(SaveButton);

			// Compose main vBox.
			TreeAddView.PackStart(NewItemSpace, true, true, 5);
			TreeAddView.PackStart(ButtonSaveSpace, true, true, 5);

			// Add main box to the window
			ViewBox.Add(TreeAddView);
		}

		//private void BuildModView(int ActiveRow)
		//{
		//	ViewBox.Remove(TreeAddView);

		//	// ------------------INICIALIZACION---------------------

		//	// Entrys.
		//	this.EntryName = new Gtk.Entry("adf");
		//	this.EntryMeters = new Gtk.Entry("");
		//	this.EntryMinutes = new Gtk.Entry("");

		//	// Entrys Properties.
		//	this.EntryName.Alignment = 0.5f;
		//	this.EntryMeters.Alignment = 0.5f;
		//	this.EntryMinutes.Alignment = 0.5f;

		//	// Labels.
		//	var NameLabel = new Gtk.Label("Nome:");
		//	var MetersLabel = new Gtk.Label("Meters:");
		//	var MinutesLabel = new Gtk.Label("Minutes:");

		//	// Buttons.
		//	var SaveButton = new Gtk.Button("ADD");
		//	SaveButton.Clicked += (o, args) => this.OnAdd();

		//	// VBoxs.
		//	var ItemNameBlock = new Gtk.HBox(false, 5);
		//	var ItemMetersBlock = new Gtk.HBox(false, 5);
		//	var ItemMinutesBlock = new Gtk.HBox(false, 5);

		//	// HBoxs.
		//	var NewItemSpace = new Gtk.VBox(false, 5);
		//	var ButtonSaveSpace = new Gtk.HBox(false, 5);

		//	// -------------------COMPOSICION------------------------

		//	// Fill vboxs.
		//	ItemNameBlock.Add(NameLabel);
		//	ItemNameBlock.Add(this.EntryName);

		//	ItemMetersBlock.Add(MetersLabel);
		//	ItemMetersBlock.Add(this.EntryMeters);

		//	ItemMinutesBlock.Add(MinutesLabel);
		//	ItemMinutesBlock.Add(this.EntryMinutes);

		//	// Fill hboxs.
		//	NewItemSpace.Add(ItemNameBlock);
		//	NewItemSpace.Add(ItemMetersBlock);
		//	NewItemSpace.Add(ItemMinutesBlock);
		//	ButtonSaveSpace.Add(SaveButton);

		//	// Compose main vBox.
		//	TreeModView.PackStart(NewItemSpace, true, true, 5);
		//	TreeModView.PackStart(ButtonSaveSpace, true, true, 5);

		//	// Add main box to the window
		//	ViewBox.PackStart(TreeModView, false, false, 5);
		//}
	}
}