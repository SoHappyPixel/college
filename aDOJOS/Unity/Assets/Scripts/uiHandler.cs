using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class uiHandler : MonoBehaviour {

    public GameObject municion;
    public GameObject cajas;

    private int municionUsada;
    private int cajasDestruidas;
    private int cajasEnPantalla;

    // Use this for initialization
    void Start () {
        municionUsada = 0;
        cajasDestruidas = 0;
        cajasEnPantalla = 0;
    }

    public int getCajasEnPantalla()
    {
        return cajasEnPantalla;
    }

    public void nuevaCaja()
    {
        ++cajasEnPantalla;
    }

	
    public void usarBala()
    {
        municionUsada++;
    }

    public void romperCaja()
    {
        cajasDestruidas++;
        cajasEnPantalla--;
    }

	// Update is called once per frame
	void Update () {
        string toEdit = municion.GetComponent<Text>().text;
        string[] partes = toEdit.Split(':');
        toEdit = partes[0] + ": " + municionUsada;
        municion.GetComponent<Text>().text = toEdit;


        toEdit = cajas.GetComponent<Text>().text;
        partes = toEdit.Split(':');
        toEdit = partes[0] + ": " + cajasDestruidas;
        cajas.GetComponent<Text>().text = toEdit;


    }
}
