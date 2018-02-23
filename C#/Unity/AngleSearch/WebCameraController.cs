using UnityEngine;
using System.IO;
using System.Collections;
using System;
using System.Linq;
using System.Collections.Generic;

public class WebCameraController : MonoBehaviour
{
	public int Width = 1920;
	public int Height = 1080;
	public int FPS = 30;
	public AccelSensor _acceleration;
	public GetTime _getTime;
	public GetGPS _getGPS;
	public GetCompass _getCompass;

	public WebCamTexture webcamTexture;
	public Color32[] color32;

	void Start ()
	{
		WebCamDevice[] devices = WebCamTexture.devices;
		webcamTexture = new WebCamTexture (devices [0].name, Width, Height, FPS);
		GetComponent<Renderer> ().material.mainTexture = webcamTexture;
		webcamTexture.Play ();
	}

	void Update ()
	{
		Debug.Log (_acceleration.x + "," + _acceleration.y + "," + _acceleration.z);
		Debug.Log (_getTime.datetimeStr);
		Debug.Log (_getGPS.Location.latitude + "," + _getGPS.Location.longitude);
	}

	public void Capture ()
	{
		color32 = webcamTexture.GetPixels32 ();

		Texture2D texture = new Texture2D (webcamTexture.width, webcamTexture.height);
		//GameObject.Find ("Capture").GetComponent<Renderer> ().material.mainTexture = texture;

		texture.SetPixels32 (color32);
		texture.Apply ();
		byte[] bytes = texture.EncodeToJPG ();
		string pictureName = "picture_";
		string extension = ".jpg";
		#if UNITY_EDITOR
		string path = Application.dataPath + "/StreamingAssets/";
		SaveFile (path, bytes, pictureName, extension);
		#elif UNITY_ANDROID
		//string  path = "jar:file://" + Application.dataPath + "!/assets";
		string  path = Application.temporaryCachePath;
		SaveFile (path, bytes, pictureName, extension);
		#endif
	}

	void SaveFile (string _path, byte[] _bytes, string _pic, string _ex)
	{
		string[] fileNames = System.IO.Directory.GetFiles (@_path, "*.jpg");
		if (fileNames.Length > 0) {
			string[] fileName = fileNames [fileNames.Length - 1].Split (new[]{ "/" }, StringSplitOptions.None);
			string[] number = fileName [fileName.Length - 1].Split (new[]{ "_" }, StringSplitOptions.None);
			string[] num = number [number.Length - 1].Split (new[]{ "." }, StringSplitOptions.None);
			int temp = Int32.Parse (num [0]);
			temp = temp + 1;
			string camNum = temp.ToString ("00000");
			Debug.Log (camNum);
			File.WriteAllBytes (_path + "/" + _pic + camNum + _ex, _bytes);
			StreamWriter data = new StreamWriter (_path + "/" + "logdata_" + camNum + ".txt", false);
			data.WriteLine (
				//加速度
				_acceleration.x + "," + _acceleration.y + "," + _acceleration.z + "\n"
				//日付
				+ _getTime.datetimeStr + "\n"
				//GPS
				+ _getGPS.Location.latitude + "," + _getGPS.Location.longitude + "\n"
				//方角
				+ _getCompass._direction + "\n"
			);
			data.Flush ();
			data.Close ();
		} else {
			File.WriteAllBytes (_path + "/picture_00001.jpg", _bytes);
			StreamWriter data = new StreamWriter (_path + "/" + "logdata_00001.txt", false);
			data.WriteLine (_acceleration.x + "," + _acceleration.y + "," + _acceleration.z + "\n"
			+ _getTime.datetimeStr);
			data.Flush ();
			data.Close ();
		}
	}

	public void EndCam ()
	{
		webcamTexture.Stop ();
	}
}
