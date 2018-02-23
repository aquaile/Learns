using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class ViewModeSwitch : MonoBehaviour
{
	public GameObject vr;
	public GameObject hold;
	public GameObject image;
	public GameObject photo;
	public GameObject back;

	// Use this for initialization
	void Start ()
	{
	
	}
	
	// Update is called once per frame
	void Update ()
	{
	
	}

	public void ModeVR ()
	{
		//GameObject photo = GameObject.Find ("CreatePhotos");
		photo.SetActive (true);
		vr.SetActive (false);
		hold.SetActive (false);
		back.SetActive (true);
	}

	public void ModeHold ()
	{
		//GameObject image = GameObject.Find ("Canvas/Image");
		image.SetActive (true);
		vr.SetActive (false);
		hold.SetActive (false);
		back.SetActive (true);
	}

	public void Back ()
	{
		vr.SetActive (true);
		hold.SetActive (true);
		image.SetActive (false);
		photo.SetActive (false);
		back.SetActive (false);
	}
}
