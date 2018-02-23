using UnityEngine;
using System.Collections;

public class ScreenManager : MonoBehaviour
{

	// Use this for initialization
	void Start ()
	{
		
	}
	
	// Update is called once per frame
	void Update ()
	{
		//fixScreen ();
	}

	void init ()
	{
		// 縦
		Screen.autorotateToPortrait = false;
		// 左
		Screen.autorotateToLandscapeLeft = false;
		// 右
		Screen.autorotateToLandscapeRight = false;
		// 上下反転
		Screen.autorotateToPortraitUpsideDown = false;
	}

	void fixScreen ()
	{
		switch (Screen.orientation) {
		// 縦画面のとき
		case ScreenOrientation.Portrait:
			// 左回転して左向きの横画面にする
			Screen.orientation = ScreenOrientation.LandscapeLeft;
			break;
		// 上下反転の縦画面のとき
		case ScreenOrientation.PortraitUpsideDown:
			// 右回転して左向きの横画面にする
			Screen.orientation = ScreenOrientation.LandscapeRight;
			break;
		}
	}
}
