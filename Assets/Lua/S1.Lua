print("S1 start do ")
require("Data");

function S1Sta()
   --注册声音--
   local mainCamera=UnityEngine.GameObject.Find("Main Camera");
   local S1BackGroundMusic=AudioManager.GetAudio("Audio/BackGroundAudio/StaPlaneMusic");
   local AudioSourceS= AudioManager.PlayVolume(mainCamera,S1BackGroundMusic,Data.Volume,true);
   --table.insert(Data.AllAudioSource,AudioSourceS);
    --注册声音--
	local LogBtn=UnityEngine.GameObject.Find("Canvas/StaBtn");
	UIEventManager.OnBtnClickEvent(LogBtn,GamePlayBtn);
	
   UpdateBeat:Add(S1UpDate);
end
function S1UpDate(Obj)
  
end

--开始游戏按钮的方法，进行场景跳转
function GamePlayBtn()
  --清空声音控件储存表
  --local LsKb={};
  --Data.AllAudioSource=LsKb;
  --跳转
  SystemEnventManager.SceneLoading("S2");
end
S1Sta();

