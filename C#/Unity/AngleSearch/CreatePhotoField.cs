using UnityEngine;
using System.Collections;
using System.IO;
using System.Text;
using System;

public class CreatePhotoField : MonoBehaviour
{
	public Texture[] images;
	public GetAngle _getAngle;
	public GameObject photo;
	// Use this for initialization
	void Start ()
	{
		CreateImageMaterials ();
	}
	
	// Update is called once per frame
	void Update ()
	{
		
	}

	void CreateImageMaterials ()
	{
		#if UNITY_EDITOR
		string path = Application.dataPath + "/StreamingAssets/";
		MakeImageMaterial (path);
		//ChangeMaterialAngle (path);
		#elif UNITY_ANDROID
		//string  path = "jar:file://" + Application.dataPath + "!/assets";
		string  path = Application.temporaryCachePath;
		MakeImageMaterial (path);
		//ChangeMaterialAngle (path);
		#endif
	}

	void MakeImageMaterial (string _path)
	{
		string[] fileNames = Directory.GetFiles (@_path, "*.jpg");
		if (fileNames.Length > 0) {
			images = new Texture[fileNames.Length];
			for (int i = 0; i < images.Length; i++) {
				GameObject clone = Instantiate (photo);
				clone.transform.parent = this.transform;
				clone.transform.position = new Vector3 (UnityEngine.Random.Range (-3, 3), UnityEngine.Random.Range (0, 3), 2);
				ChangeMaterialAngle (_path, i, clone);
				clone.name = "photo_" + i;
				images [i] = ReadTexture (fileNames [i], 1920, 1080);
				GameObject temp = GameObject.Find ("photo_" + i);
				Renderer renderer = temp.GetComponent<Renderer> ();
				renderer.material.mainTexture = images [i];
			}
		} else {
			Debug.Log ("No Image Data");
		}
	}

	void ChangeMaterialAngle (string _path, int num, GameObject _clone)
	{
		string[] fileNames = Directory.GetFiles (@_path, "*.txt");
		if (fileNames.Length > 0) {
			string txt;
			txt = ReadTxt (fileNames [num]);
			string[] lines = txt.Split (new[]{ "\n" }, StringSplitOptions.None);
			string[] accelInfo = lines [0].Split (new[]{ "," }, StringSplitOptions.None);
			float ax = float.Parse (accelInfo [0]);
			float ay = float.Parse (accelInfo [1]);
			float az = float.Parse (accelInfo [2]);
			_getAngle.CalculateAngle (ax, ay, az);
			Debug.Log (_getAngle.tx + "," + _getAngle.ty + "," + _getAngle.tz);
			_clone.transform.rotation = Quaternion.Euler (_getAngle.tx, _getAngle.ty + 90, _getAngle.tz);
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

	Texture ReadTexture (string path, int width, int height)
	{
		byte[] readBinary = ReadJpgFile (path);

		Texture2D texture = new Texture2D (width, height);
		texture.LoadImage (readBinary);

		return texture;
	}
}
