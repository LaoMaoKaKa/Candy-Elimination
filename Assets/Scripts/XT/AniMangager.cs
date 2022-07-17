using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AniMangager : MonoBehaviour {

    public static Animator GetAni(GameObject AniGameObject) {
        return AniGameObject.GetComponent<Animator>();
    }
    public static void AnimatorSetTrigger(GameObject AniGameObejct,string TriggerName) {
        Animator Ani = AniGameObejct.GetComponent<Animator>();
        Ani.SetTrigger(TriggerName);
    }
    public static void AnimatorSetBool(GameObject AniGameObejct,string boolName, bool Anibool)
    {
        Animator Ani = AniGameObejct.GetComponent<Animator>();
        Ani.SetBool(boolName, Anibool);
    }
    public static void AnimatorSetint(GameObject AniGameObejct, string FloatName, float Float)
    {
        
        Animator Ani = AniGameObejct.GetComponent<Animator>();
        Ani.SetFloat(FloatName, Float);
    }
}
