using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddS3 : MonoBehaviour {

	// Use this for initialization
	void Start () {
        GameManager.Instance.LuaManager.DoFile("LoadingGz");
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
