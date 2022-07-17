using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour {
   
 
    //获取AudioClip,即要播放的声音，可以配合PlayVolume方法使用
    public static AudioClip GetAudio(string AudioPath) {
       // Debug.Log(AudioPath);
        AudioClip audioClip = Resources.Load<AudioClip>(AudioPath);
        
        return audioClip;
    }
    //返回一个AudioSource,在Lua中存到表当中
    public static AudioSource PlayVolume(GameObject VolumeObject, AudioClip  audioClip,float volumeValue,bool IsLoop) {
        AudioSource source = VolumeObject.AddComponent<AudioSource>();
        source.clip = audioClip;
        source.volume = volumeValue;
        source.loop = IsLoop;
        source.Play();
        return source;
    }
    public static void SetAduioSourceValue(AudioSource Aud,float AudValue) {
        Aud.volume = AudValue;
    }
 
}
