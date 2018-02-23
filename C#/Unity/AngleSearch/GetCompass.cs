using UnityEngine;
using System.Collections;

public class GetCompass : MonoBehaviour
{
	public double _lastCompassUpdateTime = 0;
	double lastCompassUpdateTime = 0;
	public float _direction;
	public float _direct;
	public float x, y, z;
	//public Quaternion _compassOrientation = Quaternion.identity;
	// Use this for initialization
	void Start ()
	{
		Input.compass.enabled = true; 
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (Input.compass.timestamp > lastCompassUpdateTime) {
			lastCompassUpdateTime = Input.compass.timestamp;
			Vector3 rawvector = compassRawVector;
			x = rawvector.x;
			y = rawvector.y;
			z = rawvector.z;
			_direction = Input.compass.magneticHeading;
		}
	}

	static Vector3 compassRawVector {
		get {
			Vector3 ret = Input.compass.rawVector;

			if (Application.platform == RuntimePlatform.Android) {
				switch (Screen.orientation) {
				case ScreenOrientation.LandscapeLeft:
					ret = new Vector3 (-ret.y, ret.x, ret.z);
					break;
				case ScreenOrientation.LandscapeRight:
					ret = new Vector3 (ret.y, -ret.x, ret.z);
					break;
				case ScreenOrientation.PortraitUpsideDown:
					ret = new Vector3 (-ret.x, -ret.y, ret.z);
					break;
				}
			}

			return ret;
		}
	}
}
