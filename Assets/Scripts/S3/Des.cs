using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Des : MonoBehaviour {
    private GameObject Tg;
	// Use this for initialization
	void Start () {
        Tg = gameObject;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    public void DesGameObject() {
        //Debug.Log("销毁");
        Destroy(Tg);
    }
    public void VBoom() {
        if (Tg.name.Contains("V")|| Tg.name.Contains("H")) {
            GameManager.Instance.LuaManager.Call("TxXh",Tg);
           
            GameManager.Instance.LuaManager.Call("PtFkDesAudioVandH",GameObject.Find("Test"));
        }
    }
    public void Tx()
    {
        GameManager.Instance.LuaManager.Call("FiveTx",Tg);
    }
    public void FkAudio1() {

        GameManager.Instance.LuaManager.Call("PtFkDesAudio",Tg);
    }
}
