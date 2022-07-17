using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {
    private static GameManager instance;
    public static GameManager Instance {
        get {
            if (instance==null) {
                instance = new GameObject("GameManager").AddComponent<GameManager>();
            }
            return instance;
        }
    }
    private LuaManager luaManager;
    public LuaManager LuaManager {
        get {
            if (luaManager==null) {
                luaManager = gameObject.AddComponent<LuaManager>();
            }
            return luaManager;
        }
    }
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
