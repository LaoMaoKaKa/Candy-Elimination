using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
public class LuaManager : MonoBehaviour {
    private LuaState lua;
    // Use this for initialization
    void Awake() {
        new LuaResLoader();
        lua = new LuaState();
        lua.Start();
        LuaBinder.Bind(lua);
        gameObject.AddComponent<LuaLooper>().luaState = lua;
        lua.AddSearchPath(Application.dataPath + "/Lua/S1");
        lua.AddSearchPath(Application.dataPath + "/Lua/S2");
        lua.AddSearchPath(Application.dataPath+"/Lua/S3");
        OpenCJson();
    }

    public void DoFile(string fileName) {
        lua.DoFile(fileName);
    }
    public void DoString(string luaScript) {
        lua.DoString(luaScript);
    }

    

    public void Call(string funcName) {
        LuaFunction lf = lua.GetFunction(funcName);
        if (lf != null)
        {
            lf.Call();                                                                  
        }
        else {
            Debug.LogWarning("funcName"+":没有找到这个方法!");
        }
    }
    public void Call<T1>(string funcName,T1 par1)
    {
        LuaFunction lf = lua.GetFunction(funcName);
        if (lf != null)
        {
            lf.Call<T1>(par1);
        }
        else
        {
            Debug.LogWarning("funcName" + ":没有找到这个方法!");
        }
    }
    public void Call<T1,T2>(string funcName, T1 par1,T2 par2)
    {
        LuaFunction lf = lua.GetFunction(funcName);
        if (lf != null)
        {
            lf.Call<T1,T2>(par1,par2);
        }
        else
        {
            Debug.LogWarning("funcName" + ":没有找到这个方法!");
        }
    }
    public void Call<T1, T2,T3>(string funcName, T1 par1, T2 par2,T3 par3)
    {
        LuaFunction lf = lua.GetFunction(funcName);
        if (lf != null)
        {
            lf.Call<T1, T2,T3>(par1,par2,par3);
        }
        else
        {
            Debug.LogWarning("funcName" + ":没有找到这个方法!");
        }
    }
    void OnDestroy() {
        lua.CheckTop();
        lua.Dispose();
        lua = null;
    }
    protected void OpenCJson() {
        lua.LuaGetField(LuaIndexes.LUA_REGISTRYINDEX,"_LOADED");
        lua.OpenLibs(LuaDLL.luaopen_cjson);
        lua.LuaSetField(-2,"cjson");
        //lua.OpenLibs(LuaDLL.luaopen_cjson_safe);
        //lua.LuaSetField(-2,"cjson.safe");
    }
    
}
