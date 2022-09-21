require("Data");
local Num=1;
local PlayPlane;--Play面板
local PlayerExitBtn;--Play面板的退出按钮
local PlayPlanePlayerBtn;--Play面板的开始按钮

local PlayerPlaneXX={};--Play面板的星星

local GkBtns={};--GkBtn的集合

local HpText;--体力
local TimeText;--倒计时

local t=0;--计时器用的值


local ZSAddPlane;--钻石充值面板
local ZsAddBtn;

local HpAddPlane;--+hp面板

local ManHpPlane;--满hp弹出的面板

local ZsText;--砖石text文本

local ExitPlane;--退出面板

function S2Sta()
	
	ExitPlane=UnityEngine.GameObject.Find("Canvas/Planes/Exit");
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/UIBtns/SetBtn"),ExitBtnFun)	
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/Exit/NoBtn"),NoBtnFun)	
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/Exit/YesBtn"),YesBtnFun)
	
	ZsText=UIEventManager.GetObjText(UnityEngine.GameObject.Find("Canvas/UIBtns/Gems/Image/Gems"));
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/LiveShop/Image/BuyLife"),BuyHpBtn);
	
	ManHpPlane=UnityEngine.GameObject.Find("Canvas/Planes/Reward");
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/Reward/Image/Ok"),CloseManHpPlane)	
	
	HpAddPlane=UnityEngine.GameObject.Find("Canvas/Planes/LiveShop");
    UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/UIBtns/Hp/AddHpBtn"),AddHpBtnFun)	
    UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/LiveShop/Image/Close"),CloseAddHpPlane)	
	
	ZSAddPlane=UnityEngine.GameObject.Find("Canvas/Planes/GemsShop");
	ZsAddBtn=UnityEngine.GameObject.Find("Canvas/UIBtns/Gems/Image/AddGems")
	UIEventManager.OnBtnClickEvent(ZsAddBtn,ZSAddBtnFun);	
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/GemsShop/Image/Close"),CloseZSAddPlane)
	
	PlayPlane=UnityEngine.GameObject.Find("Canvas/StaGamePlane/PlayPlane");
	PlayerExitBtn=UnityEngine.GameObject.Find("Canvas/StaGamePlane/PlayPlane/ExitBtn");
	PlayPlanePlayerBtn=UnityEngine.GameObject.Find("Canvas/StaGamePlane/PlayPlane/PlayBtn");
	
    HpText=UIEventManager.GetObjText(UnityEngine.GameObject.Find("Canvas/UIBtns/Hp/HpText"));
	TimeText=UIEventManager.GetObjText(UnityEngine.GameObject.Find("Canvas/UIBtns/Hp/TimeText"));
	--print(Data.Tl);
	
  
	
	
   local XX3=UnityEngine.GameObject.Find("Canvas/StaGamePlane/PlayPlane/xx3");
   local XX2=UnityEngine.GameObject.Find("Canvas/StaGamePlane/PlayPlane/xx2");
   local XX1=UnityEngine.GameObject.Find("Canvas/StaGamePlane/PlayPlane/xx1");
   table.insert(PlayerPlaneXX,XX3);
   table.insert(PlayerPlaneXX,XX2);
   table.insert(PlayerPlaneXX,XX1);

   --注册button--
   UIEventManager.OnBtnClickEvent(PlayerExitBtn,PlayPlaneExitBtnFun);	
   UIEventManager.OnBtnClickEvent(PlayPlanePlayerBtn,PlayPlanePlayBtnFun);	



	--注册声音--
   local mainCamera=UnityEngine.GameObject.Find("Main Camera");
   local S1BackGroundMusic=AudioManager.GetAudio("Audio/BackGroundAudio/gamemapmusic");
   local AudioSourceS= AudioManager.PlayVolume(mainCamera,S1BackGroundMusic,Data.Volume,true);
   --table.insert(Data.AllAudioSource,AudioSourceS);
    --注册声音--
	--local LogBtn=UnityEngine.GameObject.Find("Canvas/StaBtn");
	--UIEventManager.OnBtnClickEvent(LogBtn,S2GamePlayBtn);
	for i=1,60,1 do
	local LsPlayerBtnName="Canvas/Bg/Bg2/Image5/Btns/Gk"..i;
	--print(LsPlayerBtnName);--Test
	local LsPlayBtn=UnityEngine.GameObject.Find(LsPlayerBtnName);
	table.insert(GkBtns,LsPlayBtn);
	--print(LsPlayBtn.name);
	Num=i;

	--UIEventManager.OnBtnClickEvent(LsPlayBtn,S2GamePlayBtn);
	UIEventManager.MapButton(LsPlayBtn,S2GamePlayBtn);
	end
    
	for i=1,table.getn(Data.XXNum),1 do
		--print(GkBtns[i].name);
		local ZdObj=SystemEnventManager.ObjGetChildObj(GkBtns[i],"ImageAn"); 
		for j=1,Data.XXNum[i],1 do
		 local LsXXName="xx"..j;
		 local LsXX=SystemEnventManager.ObjGetChildObj(GkBtns[i],LsXXName);
         SystemEnventManager.GameObjSetActive(LsXX,true);
		end 
	SystemEnventManager.GameObjSetActive(ZdObj,false);
	end
	
	 UIEventManager.SetTextValue(HpText,Data.hp);
	 UIEventManager.SetTextValue(TimeText,NumToTime(Data.hpTime));
   
	
	
	--------------------更新时间------------------------
    Data.NowLgDayTime=SystemEnventManager.GetTimeSpan();
    local GaphpTime =SystemEnventManager.JsTime(Data.NowLgDayTime,Data.LastLgDayTime);
    if Data.hp<=10 then
		 local Hpt=9-Data.hp;	
		 local MHpT=Hpt*300+Data.hpTime;
		
		 if GaphpTime>MHpT then
			Data.hp=10;
			Data.hpTime=300;
			UIEventManager.SetTextValue(TimeText,"已满");
		 else			
			local LsHpNum=SystemEnventManager.NumChuNum(GaphpTime,300); 
			Data.hp=Data.hp+LsHpNum;
			local LsGapHpTime=GaphpTime%300;
			if LsGapHpTime>=Data.hpTime then
			   Data.hp=Data.hp+1;
			   Data.hpTime=300-(LsGapHpTime-Data.hpTime);
			else
				Data.hpTime=Data.hpTime-LsGapHpTime;
			end
			UIEventManager.SetTextValue(TimeText,NumToTime(Data.hpTime));
		 end
	     UIEventManager.SetTextValue(HpText,Data.hp);
	end	
	--------------------------------------------------
	
	 UIEventManager.SetTextValue(ZsText,Data.Jb);
	
    UpdateBeat:Add(S2UpData);
end

function S2UpData()
   Djs();
end

function S2GamePlayBtn(Gkname)
	--print(Gkname);
  --清空声音控件储存表
  --local LsKb={};
  --Data.AllAudioSource=LsKb;
  --改变游戏场景中读取的关卡数据
  --local LsGkName="Gk"..Num;
  --CustomsPassName=LsGkName;
  Data.CustomsPassName=Gkname;
 -- print(CustomsPassName);
  --跳转
  
  Data.LastLgDayTime=SystemEnventManager.GetTimeSpan();	
   
  SaveData();
  
  
  local Lstab=mysplit2(Gkname,"k");
  --print(table.getn(Lstab));
  --print(Lstab[2]);
  local DqGk=SystemEnventManager.StringToInt(Lstab[2]);
  for i=1,3,1 do
   local LsXXName="xx"..i;
   local LsXX=SystemEnventManager.ObjGetChildObj(PlayPlane,LsXXName);
   SystemEnventManager.GameObjSetActive(LsXX,false);
  end
   for i=1,Data.XXNum[DqGk],1 do
   local LsXXName="xx"..i;
   local LsXX=SystemEnventManager.ObjGetChildObj(PlayPlane,LsXXName);
   SystemEnventManager.GameObjSetActive(LsXX,true);
  end
   

  --SystemEnventManager.SceneLoading("S3");
  SystemEnventManager.GameObjSetActive(PlayPlane,true);
end

function PlayPlaneExitBtnFun()
SystemEnventManager.GameObjSetActive(PlayPlane,false);
end
function PlayPlanePlayBtnFun()
	if Data.hp>0 then
	 Data.hp=Data.hp-1;
	 SaveData();
	 SystemEnventManager.SceneLoading("S3");
	end
   

end

--字符串分割方法
function mysplit2(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end


function Djs()
	 t=t+UnityEngine.Time.deltaTime;
	if t>=1 then
		if Data.hp<10 then
			if Data.hpTime>0 then
			Data.hpTime=Data.hpTime-1;
			else
				if Data.hp<10 then
				Data.hp=Data.hp+1;
				UIEventManager.SetTextValue(HpText,Data.hp);
				SaveData();
				end	
			Data.hpTime=300;
			end		
			UIEventManager.SetTextValue(TimeText,NumToTime(Data.hpTime));
		else
			UIEventManager.SetTextValue(TimeText,"已满");
		end
	t=0;
	end	
end

--把秒数转换成时间
function NumToTime(Numm)
   local LsTimeText="";
   local LsS=SystemEnventManager.NumChuNum(Numm,60);
   LsTimeText=LsTimeText..LsS;
   LsTimeText=LsTimeText..":";
   local Ms=Numm%60;
   local MsQz="";
   if Ms<10 then
   MsQz=MsQz.."0";
   end
   Ms=MsQz..Ms;
   LsTimeText=LsTimeText..Ms;
   --print(LsTimeText);
   return LsTimeText;
end
--砖石充值按钮
function ZSAddBtnFun()
  SystemEnventManager.GameObjSetActive(ZSAddPlane,true);
end
function CloseZSAddPlane()
 SystemEnventManager.GameObjSetActive(ZSAddPlane,false);
end

function AddHpBtnFun()
	if Data.hp<10 then
		SystemEnventManager.GameObjSetActive(HpAddPlane,true);
	else
		SystemEnventManager.GameObjSetActive(ManHpPlane,true);	
	end
end
function CloseAddHpPlane()
SystemEnventManager.GameObjSetActive(HpAddPlane,false);
end
function CloseManHpPlane()
SystemEnventManager.GameObjSetActive(ManHpPlane,false);	
end

function BuyHpBtn()
   if Data.Jb>=12 then
	if Data.hp<10 then
	  Data.Jb=Data.Jb-12;
      Data.hp=Data.hp+1;
	  UIEventManager.SetTextValue(HpText,Data.hp);
	  SystemEnventManager.GameObjSetActive(HpAddPlane,false);
	  UIEventManager.SetTextValue(ZsText,Data.Jb);
	end	
	
   end
  SaveData();
end

function ExitBtnFun()
SystemEnventManager.GameObjSetActive(ExitPlane,true);	
end


function NoBtnFun()
SystemEnventManager.GameObjSetActive(ExitPlane,false);	
end

function YesBtnFun()
SystemEnventManager.ExitYx();	

end

S2Sta();