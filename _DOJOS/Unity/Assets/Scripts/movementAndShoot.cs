using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class movementAndShoot : MonoBehaviour {

    public GameObject canvas;
    public float speed = 0.0f;
    public float sensitivity = 0.0f;
    //bound by editor
    private float hozTurn = 0.0f;
    private float verTurn = 0.0f;
    private ArrayList bullets = new ArrayList();

	// Use this for initialization
	void Start () {
        Cursor.visible = false;
	}

    //WASD controls
    void wasdHandler()
    {
        if (Input.GetKey(KeyCode.W))
        {
            Vector3 origPos = gameObject.transform.forward;
            origPos *= speed;

            gameObject.transform.position += origPos;
        }
        if (Input.GetKey(KeyCode.S))
        {
            Vector3 origPos = gameObject.transform.forward;
            origPos *= -speed / 2;

            gameObject.transform.position += origPos;
        }
        if (Input.GetKey(KeyCode.D))
        {
            Vector3 origPos = gameObject.transform.right;
            origPos *= speed / 2;

            gameObject.transform.position += origPos;
        }
        if (Input.GetKey(KeyCode.A))
        {
            Vector3 origPos = gameObject.transform.right;
            origPos *= -speed / 2;

            gameObject.transform.position += origPos;
        }
			
		gameObject.transform.position = new Vector3(gameObject.transform.position.x, 2.0f, gameObject.transform.position.z);

    }

	void shoot()
    {
        canvas.GetComponent<uiHandler>().usarBala();
        GameObject bullet = GameObject.CreatePrimitive(PrimitiveType.Sphere);
        bullet.transform.localScale = new Vector3(0.2f, 0.2f, 0.2f);
        bullet.transform.position = gameObject.transform.position;
        bullet.transform.forward = gameObject.transform.forward;
        bullet.AddComponent<SphereCollider>();
        bullet.AddComponent<Rigidbody>();
        bullet.GetComponent<Rigidbody>().useGravity = false;
        bullet.tag = "bullet";
        bullet.AddComponent<bulletScript>();
        bullets.Add(bullet);
    }

    void shootHandler()
    {
		if (Input.GetMouseButtonDown (0)) {
			shoot ();
		}
    }

	// Update is called once per frame
	void Update () {
        wasdHandler();
        //Rotation
        hozTurn += Input.GetAxis("Mouse X") * sensitivity;
        verTurn -= Input.GetAxis("Mouse Y") * sensitivity;
        gameObject.transform.eulerAngles = new Vector3(verTurn, hozTurn, 0.0f);
        shootHandler();
    }
}
