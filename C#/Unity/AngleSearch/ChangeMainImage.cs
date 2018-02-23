using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.IO;
using System.Text;
using System;

public class ChangeMainImage : MonoBehaviour
{
	public Sprite[] images;
	public float[] ax;
	public float[] ay;
	public float[] az;
	public AccelSensor _acceleration;
	float threshold;

	// Use this for initialization
	void Start ()
	{
		GetImagesInfo ();
	}
	
	// Update is called once per frame
	void Update ()
	{
		checkFitImage ();
	}

	void checkFitImage ()
	{
		Debug.Log (images.Length + "," + ax.Length);
		float lowDist = 100;
		int candidate = -1;
		for (int i = 0; i < images.Length; i++) {
			Vector3 current = new Vector3 (_acceleration.x, _acceleration.y, _acceleration.z);
			Vector3 past = new Vector3 (ax [i], ay [i], az [i]);
			float dist = Vector3.Distance (current, past);
			if (dist < lowDist) {
				lowDist = dist;
				candidate = i;
			}
		}
		Debug.Log (lowDist + "," + candidate);
		Image image = this.GetComponent<Image> ();
		image.sprite = images [candidate];
	}

	void GetImagesInfo ()
	{
		#if UNITY_EDITOR
		string path = Application.dataPath + "/StreamingAssets/";
		MakeImageSprite (path);
		makeAccelArray (path);
		#elif UNITY_ANDROID
		//string  path = "jar:file://" + Application.dataPath + "!/assets";
		string  path = Application.temporaryCachePath;
		MakeImageSprite (path);
		makeAccelArray (path);
		#endif
	}

	void MakeImageSprite (string _path)
	{
		string[] fileNames = Directory.GetFiles (@_path, "*.jpg");
		if (fileNames.Length > 0) {
			images = new Sprite[fileNames.Length];
			for (int i = 0; i < images.Length; i++) {
				Texture2D temp = ReadTexture (fileNames [i], 1920, 1080);
				images [i] = Sprite.Create (temp, new Rect (0, 0, 1280, 720), Vector2.zero);
			}
		} else {
			Debug.Log ("No Image Data");
		}
	}

	void makeAccelArray (string _path)
	{
		string[] fileNames = Directory.GetFiles (@_path, "*.txt");
		Debug.Log (fileNames.Length);
		if (fileNames.Length > 0) {
			ax = new float[fileNames.Length];
			ay = new float[fileNames.Length];
			az = new float[fileNames.Length];
			for (int i = 0; i < fileNames.Length; i++) {
				string txt;
				txt = ReadTxt (fileNames [i]);
				string[] lines = txt.Split (new[]{ "\n" }, StringSplitOptions.None);
				string[] accelInfo = lines [0].Split (new[]{ "," }, StringSplitOptions.None);
				ax [i] = float.Parse (accelInfo [0]);
				ay [i] = float.Parse (accelInfo [1]);
				az [i] = float.Parse (accelInfo [2]);
			}
		} else {
			Debug.Log ("No Txt Data");
		}
	}

	string ReadTxt (string _path)
	{
		FileInfo txt = new FileInfo (_path);
		string returnTxt = "";
		using (StreamReader sr = new StreamReader (txt.OpenRead (), Encoding.UTF8)) {
			returnTxt = sr.ReadToEnd ();
		}

		return returnTxt;
	}

	byte[] ReadJpgFile (string path)
	{
		FileStream fileStream = new FileStream (path, FileMode.Open, FileAccess.Read);
		BinaryReader bin = new BinaryReader (fileStream);
		byte[] values = bin.ReadBytes ((int)bin.BaseStream.Length);

		bin.Close ();

		return values;
	}

	Texture2D ReadTexture (string path, int width, int height)
	{
		byte[] readBinary = ReadJpgFile (path);

		Texture2D texture = new Texture2D (width, height);
		texture.LoadImage (readBinary);

		return texture;
	}
}
