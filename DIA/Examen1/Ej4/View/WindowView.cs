using System;

namespace Ej4.View
{
	public partial class MainWindow : Gtk.Window
	{
		private Gtk.Entry EntryName;

		// Constructor
		public MainWindow()
			:base(Gtk.WindowType.Toplevel) 
		{ 
			this.Build();
		}

		private void Build()
		{
			// EVENTS
			this.DeleteEvent += (o, args) => this.OnClose();


			// BOTONES
			var OkButton = new Gtk.Button("OK");
			OkButton.Clicked += (sender, e) => this.OK();

			var CancelButton = new Gtk.Button("Cancel");
			CancelButton.Clicked += (sender, e) => this.OnClose();

			// WIDGETS
			this.EntryName = new Gtk.Entry("");
			this.EntryName.Alignment = 0.5f;

			var SectionTitle = new Gtk.Label("<b>Your Name? </b>");
			SectionTitle.UseMarkup = true;


			// BOXS
			var vbMain = new Gtk.VBox(false, 5);
			var NameBlock = new Gtk.HBox(false, 5);
			var ButtonsBlock = new Gtk.HBox(false, 5);

			NameBlock.Add(SectionTitle);
			NameBlock.Add(this.EntryName);

			ButtonsBlock.Add(CancelButton);
			ButtonsBlock.Add(OkButton);

			vbMain.PackStart(NameBlock, false, false, 5);
			vbMain.PackStart(ButtonsBlock, false, false, 5);

			this.Add(vbMain);
		}

	}
}