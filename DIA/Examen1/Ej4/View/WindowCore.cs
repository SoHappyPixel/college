using System;

namespace Ej4.View
{
	public partial class MainWindow
	{
		private void OnClose() => Gtk.Application.Quit();

		private void OK()
		{
			if (!this.EntryName.Text.Equals(""))
			{
				Console.WriteLine("Hola, " + this.EntryName.Text + "has clicado BIEN a las " + DateTime.Now.ToString());
			}
			else
			{
				Console.WriteLine("Hola, desconocido, has clicado MAL a las " + DateTime.Now.ToString());
			}
		}
	}
}