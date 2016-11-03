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

		public MainWindow() : base(Gtk.WindowType.Toplevel)
		{
			Build();
			OnInit();
		}

		// Cerrar la aplicacion.
		private void Quit() => Gtk.Application.Quit();

		// Limpiar TreeView.
		private void ClearTreeModel()
		{
			ExeModel = new Gtk.ListStore(typeof(string), typeof(string), typeof(string), typeof(string));
			Exercises.Model = ExeModel;
		}

		// Controla cuando se hace doble-click en un ejercicio.
		[GLib.ConnectBeforeAttribute]
		protected void OnRight(object sender, Gtk.ButtonPressEventArgs e)
		{
			if(e.Event.Button == 3) // Botón derecho.
			{
				Gtk.TreePath RowPath;
				if (Exercises.GetPathAtPos(Convert.ToInt32(e.Event.X),
											Convert.ToInt32(e.Event.Y),
											out RowPath))
				{
					int ActiveRow = RowPath.Indices[0];
					Gtk.Menu m = new Gtk.Menu();
					Gtk.MenuItem DeleteExercise = new Gtk.MenuItem("Delete exercise");
					DeleteExercise.ButtonPressEvent += (o, a) => OnDelete(ActiveRow);
					m.Add(DeleteExercise);
					m.ShowAll();
					m.Popup();

				}
			}
		}

		private void Build()
		{
			// ----------------------TAMANHO------------------------

			SetGeometryHints(
				this, new Gdk.Geometry() { MinWidth = 300, MinHeight = 300 }, Gdk.WindowHints.MinSize);

			// ----------------------EVENTOS------------------------

			DeleteEvent += (o, args) => OnClose();

			// ------------------INICIALIZACION---------------------

			// Labels.
			var SectionTitle = new Gtk.Label("<b>EXERCISES</b>");
			SectionTitle.UseMarkup = true;

			// Tree.
			Exercises = new Gtk.TreeView();
			// Tree Colum.
			var NameRender = new Gtk.CellRendererText();
			NameRender.Editable = true;
			NameRender.Edited += NameRenderEdit;
			var MetersRender = new Gtk.CellRendererText();
			MetersRender.Editable = true;
			MetersRender.Edited += MetersRenderEdit;
			var MinutesRender = new Gtk.CellRendererText();
			MinutesRender.Editable = true;
			MinutesRender.Edited += MinutesRenderEdit;
			var DateRender = new Gtk.CellRendererText();
			// Tree Model.
			ExeModel = new Gtk.ListStore(typeof(string), typeof(string), typeof(string), typeof(string));
			Exercises.ButtonPressEvent += new Gtk.ButtonPressEventHandler(OnRight);

			// Boxes Creation.
			var TreeScroll = new Gtk.ScrolledWindow();
			var TreeSpace = new Gtk.HBox(false, 5);

			// -------------------COMPOSICION------------------------

			// Tree.
			Exercises.Model = ExeModel;
			// Tree Columns Append.
			Exercises.AppendColumn("Name", NameRender, "text", 0);
			Exercises.AppendColumn("Meters", MetersRender, "text", 1);
			Exercises.AppendColumn("Minutes", MinutesRender, "text", 2);
			Exercises.AppendColumn("Date", DateRender, "text", 3);

			// Fill Boxes.
			TreeScroll.Add(Exercises);
			TreeSpace.Add(TreeScroll);

			ViewBox.Add(SectionTitle);
			ViewBox.Add(TreeSpace);

			Add(ViewBox);
			BuildAddView();
		}

		private void BuildAddView()
		{
			//ViewBox.Remove(TreeModView);

			// ------------------INICIALIZACION---------------------

			// Entrys.
			EntryName = new Gtk.Entry("");
			EntryMeters = new Gtk.Entry("");
			EntryMinutes = new Gtk.Entry("");

			// Entrys Properties.
			EntryName.Alignment = 0.5f;
			EntryMeters.Alignment = 0.5f;
			EntryMinutes.Alignment = 0.5f;

			// Labels.
			var NameLabel = new Gtk.Label("Name:");
			var MetersLabel = new Gtk.Label("Meters:");
			var MinutesLabel = new Gtk.Label("Minutes:");

			// Buttons.
			var SaveButton = new Gtk.Button("ADD");
			SaveButton.Clicked += (o, args) => OnAdd();

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
			ItemNameBlock.Add(EntryName);

			ItemMetersBlock.Add(MetersLabel);
			ItemMetersBlock.Add(EntryMeters);

			ItemMinutesBlock.Add(MinutesLabel);
			ItemMinutesBlock.Add(EntryMinutes);

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
	}
}