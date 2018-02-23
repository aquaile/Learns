using UnityEngine;
using System.Collections;

public class GetTime : MonoBehaviour
{

	public string datetimeStr;

	void Update ()
	{
		datetimeStr = System.DateTime.Now.ToString ();
		Debug.Log (datetimeStr);
	}
}
