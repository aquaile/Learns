using UnityEngine;
using System.Collections;

public class GetAngle : MonoBehaviour
{
	public float tx, ty, tz;
	// Use this for initialization
	void Start ()
	{
	
	}
	
	// Update is called once per frame
	void Update ()
	{
	
	}

	public void CalculateAngle (float _x, float _y, float _z)
	{
		tx = (Mathf.Atan (_x / Mathf.Sqrt (_y * _y + _z * _z)) * 180) / Mathf.PI;
		ty = (Mathf.Atan (_y / Mathf.Sqrt (_x * _x + _z * _z)) * 180) / Mathf.PI;
		tz = (Mathf.Atan (_z / Mathf.Sqrt (_y * _y + _x * _x)) * 180) / Mathf.PI;
	}
}
