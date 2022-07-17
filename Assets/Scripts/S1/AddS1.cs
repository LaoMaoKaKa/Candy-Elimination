using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddS1 : MonoBehaviour {

	// Use this for initialization
	void Start () {
        Application.targetFrameRate = 60;
        GameManager.Instance.LuaManager.DoFile("S1");

    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
