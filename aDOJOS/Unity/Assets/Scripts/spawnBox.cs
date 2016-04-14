using UnityEngine;
using System.Collections;

public class spawnBox : MonoBehaviour {

    private GameObject canvas;
    // Use this for initialization
    void Start () {
        canvas = GameObject.Find("Canvas");
    }
	
	// Update is called once per frame
	void Update () {
        if(canvas.GetComponent<uiHandler>().getCajasEnPantalla() < 10)
        {
            GameObject nuevaCaja = (GameObject) Instantiate(Resources.Load("Caja"));
            nuevaCaja.transform.position = new Vector3(Random.Range(20.0f, 50.0f), 10.0f, Random.Range(20.0f, 50.0f));
            canvas.GetComponent<uiHandler>().nuevaCaja();
        }
    }
}
