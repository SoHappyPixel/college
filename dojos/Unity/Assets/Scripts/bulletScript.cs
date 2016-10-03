using UnityEngine;
using System.Collections;

public class bulletScript : MonoBehaviour {
	  
	public float bulletSpeed = 1.0f;

    // Use this for initialization
    void Start () { 

	}
	
	// Update is called once per frame
	void Update () {
		Vector3 origPos = gameObject.transform.forward;
		origPos *= bulletSpeed;
		gameObject.transform.position += origPos;

        Destroy(gameObject, 3.0f);
    }

    void OnCollisionEnter(Collision col)
    {

        if (col.gameObject == null || col.gameObject.tag == "destroyable")
        { 
            Destroy(col.gameObject);
        }
        Destroy(gameObject);
        
    }
}
