using UnityEngine;
using System.Collections;

public class AccelSensor : MonoBehaviour
{

	private Vector3 acceleration;
	public float x, y, z;
	// Use this for initialization
	void Start ()
	{
	
	}
	
	// Update is called once per frame
	void Update ()
	{
		acceleration = Input.acceleration;
		x = acceleration.x;
		y = acceleration.y;
		z = acceleration.z;
		//CalculateAngle (x, y, z);
	}
}
