using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddS2 : MonoBehaviour {

	// Use this for initialization
	void Start () {
        GameManager.Instance.LuaManager.DoFile("S2");
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
