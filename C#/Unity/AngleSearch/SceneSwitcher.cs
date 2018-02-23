using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class SceneSwitcher : MonoBehaviour
{

	// Use this for initialization
	void Start ()
	{
	
	}
	
	// Update is called once per frame
	void Update ()
	{
	
	}

	public void WatchPhotoMode ()
	{
		SceneManager.LoadScene ("WatchPhotoArea");
	}

	public void CaptureMode ()
	{
		SceneManager.LoadScene ("Capture");
	}

	public void ModeSelectMode ()
	{
		SceneManager.LoadScene ("ModeSelect");
	}
}
