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

		// Funcion a ejecutar cuando se inicia la aplicacion.
		private void OnInit()
		{
			this.XmlToList();
			this.ListToModel();
		}

		// Funcion a ejecutar cuando se cierra la aplicacion.
		private void OnClose()
		{
			this.OnSave();
			Gtk.Application.Quit();
		}

		// Funcion a ejecutar cuando se añade un ejercicio.
		private void OnAdd()
		{
			var name = this.EntryName.Text;
			var meters = Convert.ToSingle(this.EntryMeters.Text);
			var minutes = Convert.ToInt16(this.EntryMinutes.Text);

			this.XmlDAO.Add( new Exercise(name, meters, minutes) );
			this.RefreshView();
		}

		// Funcion a ejecutar cuando se quiere guardar el contenido a xml.
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

		// Funcion a ejecutar cuando se modifican los datos de un ejercicio.
		private void OnLoadModify(int ActiveRow)
		{
			//this.BuildModView(ActiveRow);
		}

		private void OnSaveModify(int ActiveRow)
		{
			var exercise = XmlDAO[ActiveRow];

			exercise.Name = this.EntryName.Text;
			exercise.Meters = Convert.ToSingle(this.EntryMeters.Text);
			exercise.Minutes = Convert.ToInt16(this.EntryMinutes.Text);

			this.BuildAddView();
			this.RefreshView();
		}

		// Funcion a ejecutar cuando se borra un ejercicio.
		private void OnDelete(int ActiveRow)
		{
			this.XmlDAO.RemoveAt(ActiveRow);
			this.RefreshView();
		}

		// Funcion a ejecutar cuando se hace doble-click en un ejercicio.
		[GLib.ConnectBeforeAttribute]
		protected void OnSelect(object sender, Gtk.RowActivatedArgs args)
		{
			int ActiveRow = args.Path.Indices[0];

			Gtk.Menu m = new Gtk.Menu();
			//Gtk.MenuItem modifyExercise = new Gtk.MenuItem("Modify exercise");
			//modifyExercise.ButtonPressEvent += (o, e) => this.OnLoadModify( ActiveRow );
			Gtk.MenuItem deleteExercise = new Gtk.MenuItem("Delete exercise");
			deleteExercise.ButtonPressEvent += (o, e) => this.OnDelete( ActiveRow );
			//m.Add(modifyExercise);
			m.Add(deleteExercise);
			m.ShowAll();
			m.Popup();
		}


		//---------------------------------------------------

		//---------------------------------------------------


		private void RefreshView()
		{
			ClearTreeModel();
			ListToModel();
		}

		// Limpiar Model.
		private void ClearTreeModel()
		{
			this.ExeModel = new Gtk.ListStore(typeof(string), typeof(string), typeof(string), typeof(string));
			this.Exercises.Model = ExeModel;
		}

		// Carga la Lista en el Model del TreeView.
		private void ListToModel()
		{
			XmlDAO.ForEach(le => this.ExeModel.AppendValues(
				le.Name, le.Meters.ToString(), le.Minutes.ToString(), le.Date.ToString()));
		}

		// Cargar del XML a la Lista.
		private void XmlToList()
		{
			var Root = XElement.Load(Core.Settings.XML);
			var RootChilds = from e in Root.Elements("Exercise") select e.Attributes();

			foreach (var rc in RootChilds)
			{
				var name = rc.ElementAt(0).Value;
				var meters = Convert.ToSingle(rc.ElementAt(1).Value);
				var minutes = Convert.ToInt16(rc.ElementAt(2).Value);
				DateTime date = Convert.ToDateTime(rc.ElementAt(3).Value);

				this.XmlDAO.Add(new Exercise(name, meters, minutes, date));
			}
		}

	}
}