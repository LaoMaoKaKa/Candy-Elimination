using System.Collections;
using System.Collections.Generic;
using System.IO;
using System;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SystemEnventManager : MonoBehaviour {
    //场景跳转
    static public void SceneLoading(string SceneName)
    {
        SceneManager.LoadScene(SceneName);
    }
    //判定字符串是否包含某字符
    static public bool StrContains(string Str ,string Sg) {
        return  Str.Contains(Sg);
    }
    //随机数
    static public int RanIntNum(int MinNum,int MaxNum) {
        return UnityEngine.Random.Range(MinNum,MaxNum);
    }
    //绝对值
    static public int MathfAbs(int Num) {
        return Mathf.Abs(Num);
    }
    //获取类型，可用于测试
    static public void GetObjectType<T>(T t)
    {
        Debug.Log("====");
        Debug.Log(t.GetType());
        
    }

    public static bool IsCzWd(string path2, string name2)
    {
        bool Iscz = true;
        path2 = Application.persistentDataPath;
        FileInfo t = new FileInfo(path2 + "/" + name2);
        if (!t.Exists)
        {
            Iscz = false;
            Debug.Log("不存在目标文件");
        }
        else
        {
            Debug.Log("存在目标文件");
        }
        return Iscz;
    }

    //文本写入方法，参数（路径，文本名，文本内容）
    public static void CreateOrOPenFile(string path, string name, string info)
    {          //路径、文件名、写入内容
        path = Application.persistentDataPath;
        StreamWriter sw;
        FileInfo fi = new FileInfo(path + "//" + name);
        sw = fi.CreateText();        //直接重新写入，如果要在原文件后面追加内容，应用fi.AppendText()
        sw.WriteLine(info);
        sw.Close();
        sw.Dispose();
    }
    //文本读取内容，参数(路径，文本名)
    public static string LoadFileAndIntialSpeed(string sPath, string sName)
    {
        sPath = Application.persistentDataPath;
        StreamReader sr = null;
        sr = File.OpenText(sPath + "//" + sName);
        // Debug.Log(sr.ReadLine());
        string t_Line = sr.ReadLine();
        /*
        if ((t_Line = sr.ReadLine()) != null)
        {
            Debug.Log(sr.ReadLine());
        }
        else
        {
            Debug.Log("Null!");
        }
        */
        sr.Close();
        sr.Dispose();
        return t_Line;
    }
    //设置物体是否显示
    public static void GameObjSetActive(GameObject obj,bool IsXs) {
        obj.SetActive(IsXs);
    }
    //获取物体的子物体
    public static GameObject ObjGetChildObj(GameObject Obj,string ChildName) {
        return Obj.transform.Find(ChildName).gameObject;
    }

    //把字符串强制转换为整形
    public static int StringToInt(string str) {
        return int.Parse(str);
    }

    public static string NumChuNum(int a, int b)
    {
        int c = a / b;
       // Debug.Log("c="+c);
        return c.ToString();
    }


    //获取当前时间，用于计算
    public static string GetTimeSpan() {
       return new TimeSpan(DateTime.Now.Ticks).ToString();
    }

    //计算两个时间差
    public static int JsTime(string a,string b) {
        TimeSpan ts = TimeSpan.Parse(b).Subtract(TimeSpan.Parse(a)).Duration(); //时间差的绝对值  
        String spanTime = ts.Hours.ToString() + "小时" + ts.Minutes.ToString() + "分" + ts.Seconds.ToString() + "秒"; //以X小时X分X秒的格式现实执行时间           
        Debug.Log(spanTime);
        return ts.Hours * 3600 + ts.Minutes * 60 + ts.Seconds;
    }
    //退出游戏
    public static void ExitYx() {
        Application.Quit();
    }
}
