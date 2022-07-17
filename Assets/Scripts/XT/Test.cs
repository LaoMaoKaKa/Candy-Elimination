
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

public class Test : MonoBehaviour {
    TimeSpan ts1;
    TimeSpan ts2;
    
    float tt = 0;
    string[] s =new string[2]{ "1", "2" };
	// Use this for initialization
	void Start () {
     
       // Debug.Log("时间："+ DateTime.Now.Ticks);
        ts1 = new TimeSpan(DateTime.Now.Ticks); //获取当前时间的刻度数  
        Debug.Log("时间:"+ new TimeSpan(DateTime.Now.Ticks));
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetMouseButtonDown(0)) {
            ts2 = new TimeSpan(DateTime.Now.Ticks);
            TimeSpan ts = ts2.Subtract(ts1).Duration(); //时间差的绝对值  
            String spanTime = ts.Hours.ToString() + "小时" + ts.Minutes.ToString() + "分" + ts.Seconds.ToString() + "秒"; //以X小时X分X秒的格式现实执行时间 
            
            Debug.Log(spanTime);
        }
        tt += Time.deltaTime;
        if (tt>=1) {
            Debug.Log("滴答！");
            tt = 0;
        }
        
    }
    public static void CreateOrOPenFile(string path, string name, string info)
    {          //路径、文件名、写入内容
        StreamWriter sw;
        FileInfo fi = new FileInfo(path + "//" + name);
        sw = fi.CreateText();        //直接重新写入，如果要在原文件后面追加内容，应用fi.AppendText()
        sw.WriteLine(info);
        sw.Close();
        sw.Dispose();
    }
    public static string LoadFileAndIntialSpeed(string sPath, string sName)
    {
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
}
