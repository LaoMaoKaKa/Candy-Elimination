using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;
using UnityEngine.UI;
public class UIEventManager{

    public static void OnBtnClickEvent(GameObject go,LuaFunction lf) {
        Button btn = go.GetComponent<Button>();
        if (btn != null)
        {
            btn.onClick.AddListener(() =>
            {
                if (lf == null)
                {
                    Debug.LogError(go.name + ":这个物体没有传入Lua方法");
                }
                else
                {
                    lf.Call();
                }
            });
        }
        else {
            Debug.LogError(go.name+":请确认是否有Button组件");
        }
    }

    public static void OnToggle(GameObject go, LuaFunction lf)
    {
        Toggle btn = go.GetComponent<Toggle>();
        if (btn != null)
        {
            btn.onValueChanged.AddListener((isOn) =>
            {
                if (lf == null)
                {
                    Debug.LogError(go.name + ":这个物体没有传入Lua方法");
                }
                else
                {
                    lf.Call(isOn);
                }
            });
        }
        else
        {
            Debug.LogError(go.name + ":请确认是否有Toggle组件");
        }
    }


    public static void OnSlider(GameObject go, LuaFunction lf)
    {
        Slider btn = go.GetComponent<Slider>();
        if (btn != null)
        {
            btn.onValueChanged.AddListener((value) =>
            {
                if (lf == null)
                {
                    Debug.LogError(go.name + ":这个物体没有传入Lua方法");
                }
                else
                {
                    lf.Call(value);
                }
            });
        }
        else
        {
            Debug.LogError(go.name + ":请确认是否有Slider组件");
        }
    }
    public static RectTransform GetUIGameObject(GameObject UIGameObject) {
        return UIGameObject.GetComponent<RectTransform>();
    }

    //设置UI面板位置
    public static void SetRecTran(GameObject UIgameObject,Vector3 vector3) {
        UIgameObject.GetComponent<RectTransform>().localPosition = vector3;
    }
    public static bool SetRecTranT(GameObject UIgameObject, Vector3 vector3) {
        if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) >0.03f)
        {
            Vector3 dir = vector3 - UIgameObject.GetComponent<RectTransform>().localPosition;
            //Vector3 dir = UIgameObject2.GetComponent<RectTransform>().localPosition - UIgameObject.GetComponent<RectTransform>().localPosition;
            UIgameObject.GetComponent<RectTransform>().localPosition += dir * Time.deltaTime * 20;
        }
        if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) <=0.5f)
        {
          //  UIgameObject.GetComponent<RectTransform>().localPosition = vector3;
           
            return true;
        }
        else {
           // Debug.Log("false");
            return false;
        }
    }
    public static bool SetRecTranT2s(GameObject UIgameObject, Vector3 vector3)
    {
        if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) >1) {
            Vector3 dir = vector3 - UIgameObject.GetComponent<RectTransform>().localPosition;
            UIgameObject.GetComponent<RectTransform>().localPosition += dir.normalized * Time.deltaTime * 400;
        }
           
        //Vector3 dir = UIgameObject2.GetComponent<RectTransform>().localPosition - UIgameObject.GetComponent<RectTransform>().localPosition;
       
        if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) <= 3.5f)
        {
            return true;
        }
        else
        {
            // Debug.Log("false");
            return false;
        }
    }
    public static bool SetRecTranT2(GameObject UIgameObject, Vector3 vector3)
    {
        if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) > 6)
        {
            Vector3 dir = vector3 - UIgameObject.GetComponent<RectTransform>().localPosition;
            UIgameObject.GetComponent<RectTransform>().localPosition += dir.normalized * Time.deltaTime * 600;
        }
        else if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) > 1)
        {
            Vector3 dir = vector3 - UIgameObject.GetComponent<RectTransform>().localPosition;
            UIgameObject.GetComponent<RectTransform>().localPosition += dir.normalized * Time.deltaTime * 100;
        }

        //Vector3 dir = UIgameObject2.GetComponent<RectTransform>().localPosition - UIgameObject.GetComponent<RectTransform>().localPosition;

        if (Vector3.Distance(UIgameObject.GetComponent<RectTransform>().localPosition, vector3) <= 3.5f)
        {
            return true;
        }
        else
        {
            // Debug.Log("false");
            return false;
        }
    }
    public static void MapButton(GameObject go, LuaFunction lf) {
        //Debug.Log(go.name);
        Button btn = go.GetComponent<Button>();
        if (btn != null)
        {
            btn.onClick.AddListener(() =>
            {
                if (lf == null)
                {
                    Debug.LogError(go.name + ":这个物体没有传入Lua方法");
                }
                else
                {
                    //GameManager.Instance.LuaManager.Call(lf,go);
                    lf.Call(go.name);
                }
            });
        }
        else
        {      
            Debug.LogError(go.name + ":请确认是否有Button组件");
        }
    }


    public static Text GetObjText(GameObject Obj) {
        return Obj.GetComponent<Text>();
        
    }

    public static void SetTextValue(Text T, string Str) {
        T.text = Str;
    }

    public static Slider GetObjSlider(GameObject Obj) {
        return Obj.GetComponent<Slider>();
    }
    public static void SetSliderValue(Slider slider,float sliderValue) {
        slider.value = slider.value+sliderValue;
    }
    public static float GetSliderValuer(Slider slider) {
        return slider.value;
    }
}
