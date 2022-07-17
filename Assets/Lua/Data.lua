--总体数据
local json=require("cjson");

Data={};
Data.Volume=0.5;--音量
Data.CustomsPassName="Gk3";
Data.DqPass=1;         --当前关卡数据
Data.XXNum={3,2,1,0};
Data.hp=6;       --体力
Data.hpTime=299;   --体力倒计时
Data.LastLgDayTime="737125.21:54:57.4371741";
Data.NowLgDayTime="";
Data.Jb=800;
Data.cs=1;
--把table转换成字符串储存  储存数据到txt文件中
function SaveData()
   local str=json.encode(Data);--table转字符串
  -- print(str);
   SystemEnventManager.CreateOrOPenFile(UnityEngine.Application.streamingAssetsPath,"Data.txt",str);
end

--从字符串中获取元素
function GetElement()
  local str=SystemEnventManager.LoadFileAndIntialSpeed(UnityEngine.Application.streamingAssetsPath,"Data.txt");
	--if str~=nil then
		--print("获得数据");
	local data=json.decode(str);--字符转table
	Data=data;
	--else
		--print("没有获得数据");
		--SaveData();
	--end
end

--local str1=SystemEnventManager.LoadFileAndIntialSpeed(UnityEngine.Application.streamingAssetsPath,"Data.txt");
--if str1=="Null" then
	--print("保存数据");
--SaveData();
--end
  

--GetElement();
local LsBo=SystemEnventManager.IsCzWd(UnityEngine.Application.streamingAssetsPath,"Data.txt");
if LsBo==false then
	print("创建文件");
SaveData();
end
GetElement();