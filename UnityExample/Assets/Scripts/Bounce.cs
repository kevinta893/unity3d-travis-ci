using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bounce : MonoBehaviour {

    public float bouncePower = 100.0f;
    private Rigidbody rigidbody;

	// Use this for initialization
	void Start () {
        rigidbody = this.GetComponent<Rigidbody>();
        this.transform.rotation = Quaternion.Euler(Random.Range(0, 360), Random.Range(0, 360), Random.Range(0, 360));
    }
	
	// Update is called once per frame
	void Update () {

    }


    private void OnCollisionEnter(Collision collision)
    {
        rigidbody.AddForce(Vector3.up * bouncePower);
    }
}
