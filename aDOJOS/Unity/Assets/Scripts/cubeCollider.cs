using UnityEngine;
using System.Collections;

public class cubeCollider : MonoBehaviour {

    private GameObject canvas;

    // Use this for initialization
    void Start () {
        canvas = GameObject.Find("Canvas");
	}
	
	// Update is called once per frame
	void Update () {

	}

    void OnDestroy()
    {
    	canvas.GetComponent<uiHandler>().romperCaja();
    }

}
