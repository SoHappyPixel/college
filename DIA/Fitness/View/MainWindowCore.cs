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
		private List<Exercise> XmlDAO = new List<Exercise>();

		//--------------------------EVENTOS-------------------------

		// Cuando se inicia la aplicacion.
		private void OnInit()
		{
			XmlToList();
			ListToModel();
		}

		// Cuando se cierra la aplicacion.
		private void OnClose()
		{
			OnSave();
			Quit();
		}

		// Cuando se añade un ejercicio.
		private void OnAdd()
		{
			var meters = (short)0;
			var minutes = (short)0;
			var name = EntryName.Text;

			if (EntryMeters.Text.All(char.IsDigit)) {
				meters = Convert.ToInt16(EntryMeters.Text);
			}

			if (EntryMeters.Text.All(char.IsDigit)) {
				minutes = Convert.ToInt16(EntryMinutes.Text);
			}

			XmlDAO.Add( new Exercise(name, meters, minutes) );
			RefreshView();
		}

		// Cuando se quiere guardar el contenido a xml.
		private void OnSave()
		{
			var Root = new XElement("Exercises");

			foreach (var x in XmlDAO)
			{
				var Child = new XElement("Exercise");
				Child.Add(new XAttribute("Name", x.Name));
				Child.Add(new XAttribute("Meters", x.Meters));
				Child.Add(new XAttribute("Minutes", x.Minutes));
				Child.Add(new XAttribute("Date", x.Date.ToString()));
				Root.Add(Child);
			}

			Root.Save(Core.Settings.XML);
		}

		// Cuando se borra un ejercicio.
		private void OnDelete(int ActiveRow)
		{
			XmlDAO.RemoveAt(ActiveRow);
			RefreshView();
		}

		//-------------------------EDITABLES------------------------

		// Cuando se edita el campo nombre.
		private void NameRenderEdit(object o, Gtk.EditedArgs e)
		{
			var RowPath = new Gtk.TreePath(e.Path);
			var ActiveRow = RowPath.Indices[0];
			XmlDAO[ActiveRow].Name = e.NewText;
			RefreshView();
		}

		// Cuando se edita el campo metros.
		private void MetersRenderEdit(object o, Gtk.EditedArgs e)
		{
			var RowPath = new Gtk.TreePath(e.Path);
			var ActiveRow = RowPath.Indices[0];
			XmlDAO[ActiveRow].Meters = Convert.ToInt16(e.NewText);
			RefreshView();
		}

		//Cuando se edita el campo minutos.
		private void MinutesRenderEdit(object o, Gtk.EditedArgs e)
		{
			var RowPath = new Gtk.TreePath(e.Path);
			var ActiveRow = RowPath.Indices[0];
			XmlDAO[ActiveRow].Minutes = Convert.ToInt16(e.NewText);
			RefreshView();
		}

		//------------------------UTILIDADES------------------------

		// Recarga la vista con los cambios sufridos.
		private void RefreshView()
		{
			ClearTreeModel();
			ListToModel();
		}

		// Carga la Lista en el Model del TreeView.
		private void ListToModel()
		{
			Predicate<Exercise> pe = ;
			XmlDAO.Find()
			XmlDAO.ForEach(le => ExeModel.AppendValues(
				le.Name, le.Meters.ToString(), le.Minutes.ToString(), le.Date.ToString()));
		}

		// Cargar del XML a la Lista.
		private void XmlToList()
		{
			var CalendarDate = DateTime.Now;
			if (File.Exists(Core.Settings.XML))
			{
				var Root = XElement.Load(Core.Settings.XML);
				var RootChilds = 
					from e in Root.Elements("Exercise") select e.Attributes();

				foreach (var rc in RootChilds)
				{
					var name = rc.ElementAt(0).Value;
					var meters = Convert.ToInt16(rc.ElementAt(1).Value);
					var minutes = Convert.ToInt16(rc.ElementAt(2).Value);
					DateTime date = Convert.ToDateTime(rc.ElementAt(3).Value);

					XmlDAO.Add(new Exercise(name, meters, minutes, date));
				}
			}
		}

	}
}