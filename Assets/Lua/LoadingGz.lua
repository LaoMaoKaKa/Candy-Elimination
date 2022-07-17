--require("Data2");
require("Data");
local GkText;
local VecPoint={};
local Candnys={};--方块集合
local Gz;
local CandnyPlane1;
local CandnyPlane2;
local CandnyPlane3;
local CandnyPlane4
local HstringNum={};
local Hstring={};
local MoveNum=0;--用于糖果移动复位的计数
local TgIsJh=false;--Fk是否在交换中
local Fk1;
local Fk2;
local TsFk1={x=0,y=0};
local TsFk2={x=0,y=0};
local FiveTxObj;--5消特效
local ClFk={};--要消除的方块集合

local Typees={Null="Null",Not="Not",IsHaveMove,Blue="Blue",Red="Red",Yellow="Yellow",Green="Green",Purple="Purple",Orange="Orange"};
local Sj={};
local Kb={};--空表

local PauseBtn;--暂停按钮
local PausePlane;--暂停面板
local PausePlaneMusicOffBtn;

local AudioSourceS;

for i=0,10,1 do
	Sj[i]={}
      for j=0,8,1 do
		local point=Vector3(j*82-8*82/2,i*82-10*82/2,0)		
		Sj[i][j]={Coordinate=Vector3(point.x,point.y,point.z),Point=Vector2(i,j),Typee=Typees.Not,GameObjectFk=nil,IsMove=false}
		--print(VecPoint[i][j].x);
	  end
end

local XlFkSx={FkGameObject=nil,XlEndPoint=Vector3(0,0,0)};
local XlFk={};
local IsMove=false;
local IsMove2=false;
local IsXlOver=false;
local IsHave=false;

local Max=10;
local IsPause=false;--是否是暂停状态

local GameTime=120;
local GameTimeText;
local t=0;
local GradeSlider;--分数Slider
local GradeXX={};
local GameOverPlane;--游戏结束的面板
local NowGameXXNum=0;--当局星星的数量
local IsGameOver=false;

function LoadingSta () 
	
	
	
    GameBgMusic();
	--print(Typees.Bule);
	LoadingCandys();
	LoadVecPoint();
	Xc5();
    UpdateBeat:Add(LoadingUpData);
	
	--print(Text.text);
end

function LoadingUpData()
	Djs();
    Cam();
	
	FkXl();
	FkSc();
	if IsMove==false and IsMove2==false and IsXlOver==true then
	Xc5();
	IsXlOver=false;
    IsHave=false;
	end
	if UnityEngine.Input.GetMouseButtonDown(1) then
	--print(CustomsPassName);
	--print("999999999");
	--AniMangager.AnimatorSetTrigger(Sj[8][8].GameObjectFk,"Blue");
	end
	
end

function LoadingCandys()
	
    UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Next"),MapBtn);
    GameOverPlane=UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete");
	local Lsxx1=UnityEngine.GameObject.Find("Canvas/BgPlane/Image1/xx1/xx");
    table.insert(GradeXX,Lsxx1);
    local Lsxx2=UnityEngine.GameObject.Find("Canvas/BgPlane/Image1/xx2/xx");
    table.insert(GradeXX,Lsxx2);
	local Lsxx3=UnityEngine.GameObject.Find("Canvas/BgPlane/Image1/xx3/xx");
    table.insert(GradeXX,Lsxx3);

    GradeSlider=UIEventManager.GetObjSlider(UnityEngine.GameObject.Find("Canvas/BgPlane/GradeSlider"));	
	
	GameTimeText=UIEventManager.GetObjText(UnityEngine.GameObject.Find("Canvas/BgPlane/Image1/Text1"));
	PauseBtn=UnityEngine.GameObject.Find("Canvas/BgPlane/PauseBtn");
	PausePlane=UnityEngine.GameObject.Find("Canvas/Planes/MenuPause");	
	PausePlaneMusicOffBtn=UnityEngine.GameObject.Find("Canvas/Planes/MenuPause/Image/Music/MusicOff");	
	UIEventManager.OnBtnClickEvent(PauseBtn,PauseBtnFun);
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/MenuPause/Image/Continue"),PauseCountPlay);
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/MenuPause/Image/Map"),MapBtn);
	
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/MenuPause/Image/Music"),MusicBtnOn);
	UIEventManager.OnBtnClickEvent(UnityEngine.GameObject.Find("Canvas/Planes/MenuPause/Image/Music/MusicOff"),MusciBtnOff);
	
	CandnyPlane1=UnityEngine.GameObject.Find("Canvas/GzPlane/Plane1").transform;
    CandnyPlane2=UnityEngine.GameObject.Find("Canvas/GzPlane/Plane2").transform;
    CandnyPlane3=UnityEngine.GameObject.Find("Canvas/GzPlane/Plane3").transform;	
	CandnyPlane4=UnityEngine.GameObject.Find("Canvas/GzPlane/Plane4").transform;
	Gz=UnityEngine.Resources.Load("gz1");
	
	FiveTxObj=UnityEngine.Resources.Load("Prefabs/Effects/Firework");
	
    local CandnyBlue=UnityEngine.Resources.Load("Candnys/CandnyBlue");
	table.insert(Candnys,CandnyBlue);
	local CandnyYellow=UnityEngine.Resources.Load("Candnys/CandnyYellow");
	table.insert(Candnys,CandnyYellow);
	local CandnyOrange=UnityEngine.Resources.Load("Candnys/CandnyOrange");
	table.insert(Candnys,CandnyOrange);
	local CandnyGreen=UnityEngine.Resources.Load("Candnys/CandnyGreen");
	table.insert(Candnys,CandnyGreen);
 	local CandnyRed=UnityEngine.Resources.Load("Candnys/CandnyRed");
	table.insert(Candnys,CandnyRed);
	local CandnyPurple=UnityEngine.Resources.Load("Candnys/CandnyPurple");
	table.insert(Candnys,CandnyPurple);
	
	local CandnyBlueS=UnityEngine.Resources.Load("Candnys/CandnyBlueS");
	table.insert(Candnys,CandnyBlueS);
	local CandnyYellowS=UnityEngine.Resources.Load("Candnys/CandnyYellowS");
	table.insert(Candnys,CandnyYellowS);
	local CandnyOrangeS=UnityEngine.Resources.Load("Candnys/CandnyOrangeS");
	table.insert(Candnys,CandnyOrangeS);
	local CandnyGreenS=UnityEngine.Resources.Load("Candnys/CandnyGreenS");
	table.insert(Candnys,CandnyGreenS);
 	local CandnyRedS=UnityEngine.Resources.Load("Candnys/CandnyRedS");
	table.insert(Candnys,CandnyRedS);
	local CandnyPurpleS=UnityEngine.Resources.Load("Candnys/CandnyPurpleS");
	table.insert(Candnys,CandnyPurpleS);
	
	local CandnyBlueH=UnityEngine.Resources.Load("Candnys/CandnyBlueH");
	table.insert(Candnys,CandnyBlueH);
	local CandnyYellowH=UnityEngine.Resources.Load("Candnys/CandnyYellowH");
	table.insert(Candnys,CandnyYellowH);
	local CandnyOrangeH=UnityEngine.Resources.Load("Candnys/CandnyOrangeH");
	table.insert(Candnys,CandnyOrangeH);
	local CandnyGreenH=UnityEngine.Resources.Load("Candnys/CandnyGreenH");
	table.insert(Candnys,CandnyGreenH);
 	local CandnyRedH=UnityEngine.Resources.Load("Candnys/CandnyRedH");
	table.insert(Candnys,CandnyRedH);
	local CandnyPurpleH=UnityEngine.Resources.Load("Candnys/CandnyPurpleH");
	table.insert(Candnys,CandnyPurpleH);
	
	local CandnyBlueV=UnityEngine.Resources.Load("Candnys/CandnyBlueV");
	table.insert(Candnys,CandnyBlueV);
	local CandnyYellowV=UnityEngine.Resources.Load("Candnys/CandnyYellowV");
	table.insert(Candnys,CandnyYellowV);
	local CandnyOrangeV=UnityEngine.Resources.Load("Candnys/CandnyOrangeV");
	table.insert(Candnys,CandnyOrangeV);
	local CandnyGreenV=UnityEngine.Resources.Load("Candnys/CandnyGreenV");
	table.insert(Candnys,CandnyGreenV);
 	local CandnyRedV=UnityEngine.Resources.Load("Candnys/CandnyRedV");
	table.insert(Candnys,CandnyRedV);
	local CandnyPurpleV=UnityEngine.Resources.Load("Candnys/CandnyPurpleV");
	table.insert(Candnys,CandnyPurpleV);
	
	--print(GetLoacCandnyGameIbject("CandnyPurpleV").name);
	print(CustomsPassName);
	GkText=UnityEngine.Resources.Load(Data.CustomsPassName,typeof(UnityEngine.TextAsset));	
   
	
end

function  LoadVecPoint()
	HstringNum=mysplit(GkText.text,'\n');
   
	
  for i=0,10,1 do
	VecPoint[i]={};
      for j=0,8,1 do
		local point=Vector3(j*82-8*82/2,i*82-10*82/2,0)
		VecPoint[i][j]=point;
		--print(VecPoint[i][j].x);
	  end
  end
  
  for i=1,table.getn(HstringNum),1 do
	 Hstring=mysplit(HstringNum[i],',');
    for j=1,table.getn(Hstring),1 do
	  if SystemEnventManager.StrContains(Hstring[j],"-")==false then
		local LsGz=UnityEngine.GameObject.Instantiate(Gz,CandnyPlane1);
		UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(i-11)][j-1]);
		--Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Null;
	
	    local Num=SystemEnventManager.RanIntNum(1,7);
	    local LsFk=UnityEngine.GameObject.Instantiate(Candnys[Num],CandnyPlane2);
	    UIEventManager.SetRecTran(LsFk,VecPoint[SystemEnventManager.MathfAbs(i-11)][j-1]);
			
		 Sj[SystemEnventManager.MathfAbs(i-11)][j-1].GameObjectFk=LsFk;		
		 if Candnys[Num].name=="CandnyRed" then
		   Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Red;
		 elseif Candnys[Num].name=="CandnyBlue" then
		   Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Blue;
		 elseif Candnys[Num].name=="CandnyGreen" then
		   Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Green;
		 elseif Candnys[Num].name=="CandnyPurple" then
		   Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Purple;
		 elseif Candnys[Num].name=="CandnyYellow" then
		   Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Yellow;
		 elseif Candnys[Num].name=="CandnyOrange" then
		   Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Orange;		
		 end		
		
		
	    --Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Candnys[Num].name;
	  else
		Sj[SystemEnventManager.MathfAbs(i-11)][j-1].Typee=Typees.Not;
	  end

	end
  end
  
   for i=0,10,1 do
      for j=0,8,1 do
	      if Sj[i][j].Typee~=Typees.Not then		      
			  MaxI=i;		
		  end
	  end
   end
   print("MaxI="..MaxI);
end

--字符串分割方法
function mysplit(inputstr, sep)
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

--控制方块移动
function Cam()
if TgIsJh==false then

	if UnityEngine.Input.GetMouseButtonDown(0) then	
	  local ray= UnityEngine.Camera.main:ScreenPointToRay(UnityEngine.Input.mousePosition);
      local IsC,Fkxx= UnityEngine.Physics.Raycast(ray,nil,20,bit.lshift(1,LayerMask.NameToLayer("Fk")));
	  if IsC then	
		Fk1=Fkxx.transform.gameObject;
	  end
	end
      
	if UnityEngine.Input.GetMouseButtonUp(0) then
	 local ray= UnityEngine.Camera.main:ScreenPointToRay(UnityEngine.Input.mousePosition);
     local IsC,Fkxx= UnityEngine.Physics.Raycast(ray,nil,20,bit.lshift(1,LayerMask.NameToLayer("Fk")));
	  if IsC then
		Fk2=Fkxx.transform.gameObject;
		local Fk1P,Fk1I,Fk1J=GetFkPosition(Fk2);
		TgIsJh=true;
		print(Fk1I..","..Fk1J.."="..Sj[Fk1I][Fk1J].Typee);
	  end
	 if Fk1~=nil and Fk2==nil or Fk1==nil and Fk2~=nil then
	    Fk1=nil;
	    Fk2=nil;
	 end
	local Fk1P,Fk1I,Fk1J=GetFkPosition(Fk1);
	local Fk2P,Fk2I,Fk2J=GetFkPosition(Fk2);
if Fk1~=nil and Fk2~=nil then
	if SystemEnventManager.MathfAbs(Fk1I-Fk2I)<2 and SystemEnventManager.MathfAbs(Fk1J-Fk2J)<2 then
		if SystemEnventManager.MathfAbs(Fk1I-Fk2I)==1 and SystemEnventManager.MathfAbs(Fk1J-Fk2J)==1 then
		 Fk1=nil;
	     Fk2=nil;			
		end		
	else
	 Fk1=nil;
	 Fk2=nil;
	end
end	
	end	
end
  

    if Fk1~=nil and Fk2~=nil and Fk1~=Fk2 then
		
	local Fk1P,Fk1I,Fk1J=GetFkPosition(Fk1);
	local Fk2P,Fk2I,Fk2J=GetFkPosition(Fk2);
	local IsC1;
	local IsC2;
	
	IsMove2=true;
	
	IsC1=UIEventManager.SetRecTranT(Fk1,Fk2P);
	IsC2=UIEventManager.SetRecTranT(Fk2,Fk1P);
					
	if IsC1==true then
	
	--方块坐标复位--把自定义坐标下的物体改变并切换状态
	
	 Sj[Fk1I][Fk1J].GameObjectFk=Fk2;
	 Sj[Fk2I][Fk2J].GameObjectFk=Fk1;
	 local LsFk1Ty=Sj[Fk1I][Fk1J].Typee;
	 Sj[Fk1I][Fk1J].Typee=Sj[Fk2I][Fk2J].Typee;
	 Sj[Fk2I][Fk2J].Typee=LsFk1Ty;
	
	 TsFk1.x=Fk1I;
	 TsFk1.y=Fk1J;
	 TsFk2.x=Fk2I;
	 TsFk2.y=Fk2J;
	  
	
     IsMove2=false;
	 MoveNum=MoveNum+1;
	-- print("移动结束");
	--Xc2();
	Xc5();
	if Sj[Fk1I][Fk1J].Typee~="Null" and Sj[Fk2I][Fk2J].Typee~="Null" and Sj[Fk1I][Fk1J].GameObjectFk==Fk2 and Sj[Fk2I][Fk2J].GameObjectFk==Fk1 then
	--print("复位···········");
	  if MoveNum==2 then
	    Fk1=nil;
	    Fk2=nil;
	    MoveNum=0;
		TgIsJh=false;
	  end
	else
	 Fk1=nil;
	 Fk2=nil;
	MoveNum=0;
	TgIsJh=false;
	end
	
	 end
	elseif Fk1==Fk2 then
	 Fk1=nil;
	 Fk2=nil;
	MoveNum=0;
	TgIsJh=false;
	end

end
--通过方块的物体查询UI坐标的方法，返回UI坐标和自定义的二维坐标的下x，y
function GetFkPosition(gameObjectFK)
      for i=0,10,1 do
         for j=0,8,1 do		
		    if Sj[i][j].GameObjectFk==gameObjectFK then
		      return  Sj[i][j].Coordinate,i,j;
		    end
	      end
      end
end
--传入一个方块（要被消除的方块），让该位置的状态为空
function XcFkType(gameObjectFK)
	
		for i=0,10,1 do
         for j=0,8,1 do	
		    if Sj[i][j].GameObjectFk==gameObjectFK and Sj[i][j].Typee~="Not" and Sj[i][j].Typee~="Null" then
				--print(i..","..j);
				--print(Sj[i][j].Typee);
				
				Sj[i][j].GameObjectFk.transform.parent = CandnyPlane3.transform;
				 --UIEventManager.SetGameObjectParent(Sj[i][j].GameObjectFk,CandnyPlane3);
				AniMangager.AnimatorSetTrigger(Sj[i][j].GameObjectFk,Sj[i][j].Typee);
				Sj[i][j].Typee=Typees.Null;	
                SetSlider();	     
		    end
	      end
      end

	
      
	
end
--消除方块，3消，4消，5消，L消，T消
function  Xc()
  for i=0,10,1 do
    for j=0,8,1 do
		--判定有格子才会进行计算
      if Sj[i][j].Typee~="Not" and Sj[i][j]~="Null" then
	      local LsType=Sj[i][j].Typee;
		  local XCoutNum=-1;--x轴上的数量
		  ---------X轴----------
		  local LsXzFk={};
		   for k=i,10,1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
			    table.insert(LsXzFk,Sj[k][j].GameObjectFk);
			  else
				break;
			  end		  
		   end
           for k=i,0,-1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
				table.insert(LsXzFk,Sj[k][j].GameObjectFk);
				else
				  break;
			  end
		   end
		  if XCoutNum>=3 then
		     for key,value in pairs(LsXzFk) do  				
				local Iscz=false;
                for key2,value2 in pairs(ClFk) do
				    if value2==value then
					  Iscz=true;
					end
				end 
				if Iscz==false then
				table.insert(ClFk,value);
				end				
             end 
		  end
		
		for key,value in pairs(ClFk) do
		--print(value);
		--UnityEngine.Object.Destroy(value);
		end		
		ClFk=Kb;
          ---------X轴----------
          
	  end					
			
		    
	end
  end
end
--[[
function  Xc2()
  for i=0,10,1 do
    for j=0,8,1 do
		--判定有格子才会进行计算
      if Sj[i][j].Typee~="Not" and Sj[i][j]~="Null" then
	      local LsType=Sj[i][j].Typee;
		  local CountNum=0;
		  local XCoutNum=-1;--x轴上的数量
		  ---------X轴----------
		  local LsCountFk={};
		  local LsXzFk={};
		  local LsYzFk={};
		   for k=i,10,1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
			    table.insert(LsXzFk,Sj[k][j].GameObjectFk);
			  else
				break;
			  end		  
		   end
           for k=i,0,-1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
				table.insert(LsXzFk,Sj[k][j].GameObjectFk);
				else
				  break;
			  end
		   end
		   
		   if XCoutNum>=3 then
		     CountNum=XCoutNum+CountNum;
			 for key,value in pairs(LsXzFk) do
			   table.insert(LsCountFk,value);
			 end
		   end
		
		  local YCoutNum=-1;
		   for k=j,0,-1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   for k=j,8,1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   if YCoutNum>=3 then
		     CountNum=YCoutNum+CountNum;
			  for key,value in pairs(LsYzFk) do
			   table.insert(LsCountFk,value);
			  end
		   end
		
		  if CountNum>=3 then  --5，暂时修改为3/原为5消
		     for key,value in pairs(LsCountFk) do  				
				local Iscz=false;
                for key2,value2 in pairs(ClFk) do
				    if value2==value then
					  Iscz=true;
					end
				end 
				if Iscz==false then
				table.insert(ClFk,value);
				end				
             end 
		  end
		
		for key,value in pairs(ClFk) do
		--print(value);
		
		XcFkType(value);
		--UnityEngine.Object.Destroy(value);
		end		
		ClFk=Kb;
          ---------X轴----------
          
	  end					
			
		    
	end
  end
end
]]--
function  Xc5()
  for i=0,10,1 do
    for j=0,8,1 do
		--判定有格子才会进行计算
      if Sj[i][j].Typee~="Not" and Sj[i][j]~="Null" then
	      local LsType=Sj[i][j].Typee;
		  local CountNum=0;
		  local XCoutNum=-1;--x轴上的数量
		 
		  local LsCountFk={};
		  local LsXzFk={};
		  local LsYzFk={};
		   for k=i,10,1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
			    table.insert(LsXzFk,Sj[k][j].GameObjectFk);
			  else
				break;
			  end		  
		   end
           for k=i,0,-1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
				table.insert(LsXzFk,Sj[k][j].GameObjectFk);
				else
				  break;
			  end
		   end
		   
		   if XCoutNum>=3 then
		     CountNum=XCoutNum+CountNum;
			 for key,value in pairs(LsXzFk) do
			   table.insert(LsCountFk,value);
			 end
		   end
		
		  local YCoutNum=-1;
		   for k=j,0,-1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   for k=j,8,1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   if YCoutNum>=3 then
		     CountNum=YCoutNum+CountNum;
			  for key,value in pairs(LsYzFk) do
			   table.insert(LsCountFk,value);
			  end
		   end
		
		
		  if CountNum>=5 then  
		     for key,value in pairs(LsCountFk) do  				
				local Iscz=false;
                for key2,value2 in pairs(ClFk) do
				    if value2==value then
					  Iscz=true;
					end
				end
				if Iscz==false then
				table.insert(ClFk,value);
				end
             end
			--print(table.getn(ClFk));
			--print("x="..XCoutNum);
			--print("y="..YCoutNum);
		  end
		
		
		
		local IsGb=false;
		
		if TsFk1.x==0 then
		for key,value in pairs(ClFk) do
		--print(value);
		if Sj[i][j].GameObjectFk~=value then
		--print("xx");
		XcFkType(value);
		else
			if IsGb==false and Sj[i][j].Typee~="Not" and Sj[i][j].Typee~="Null" then

			local LsSName="Candnys/Candny"..Sj[i][j].Typee.."S";
			local CandnyS=UnityEngine.Resources.Load(LsSName);
			print(Sj[i][j].Typee);
            local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane2);
		    UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(i)][j]);	         					
			Sj[i][j].GameObjectFk=LsGz;
			UnityEngine.Object.Destroy(value);
			Sj[i][j].GameObjectFk.name="Candny"..Sj[i][j].Typee.."S";
			IsGb=true;
			
			end
		end	
		end
		else
		for key,value in pairs(ClFk) do
		--print(value);
		  if Sj[TsFk1.x][TsFk1.y].GameObjectFk~=value and Sj[TsFk2.x][TsFk2.y].GameObjectFk~=value then
		
		XcFkType(value);
		  else
			if IsGb==false then
				if Sj[TsFk1.x][TsFk1.y].GameObjectFk==value then
				  local LsSName="Candnys/Candny"..Sj[TsFk1.x][TsFk1.y].Typee.."S";
			      local CandnyS=UnityEngine.Resources.Load(LsSName);
                  local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane2);
		          UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(TsFk1.x)][TsFk1.y]);	         					
			      
			      UnityEngine.Object.Destroy(value);
				  Sj[TsFk1.x][TsFk1.y].GameObjectFk=LsGz;
			      Sj[TsFk1.x][TsFk1.y].GameObjectFk.name="Candny"..Sj[TsFk1.x][TsFk1.y].Typee.."S";	     
				   TsFk1.x=0;
	               TsFk1.y=0;
	               TsFk2.x=0;
	               TsFk2.y=0;
				 IsGb=true;
				elseif Sj[TsFk2.x][TsFk2.y].GameObjectFk==value then
				  local LsSName="Candnys/Candny"..Sj[TsFk2.x][TsFk2.y].Typee.."S";
			      local CandnyS=UnityEngine.Resources.Load(LsSName);
				  print(LsSName);
                  local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane2);
		          UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(TsFk2.x)][TsFk2.y]);	    
			      UnityEngine.Object.Destroy(value);
				  Sj[TsFk2.x][TsFk2.y].GameObjectFk=LsGz;
			      Sj[TsFk2.x][TsFk2.y].GameObjectFk.name="Candny"..Sj[TsFk2.x][TsFk2.y].Typee.."S";
				   TsFk1.x=0;
	               TsFk1.y=0;
	               TsFk2.x=0;
	               TsFk2.y=0;
			      IsGb=true;
				end	
			end
		  end	
		end
		
		end
			
        local LsKb={};		
		ClFk=LsKb;       
	  end					
				    
	end
  end

Xc4();
end

function  Xc4()
  for i=0,10,1 do
    for j=0,8,1 do
		--判定有格子才会进行计算
      if Sj[i][j].Typee~="Not" and Sj[i][j]~="Null" then
	      local LsType=Sj[i][j].Typee;
		  local CountNum=0;
		  local XCoutNum=-1;--x轴上的数量
		 
		  local LsCountFk={};
		  local LsXzFk={};
		  local LsYzFk={};
		   for k=i,10,1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
			    table.insert(LsXzFk,Sj[k][j].GameObjectFk);
			  else
				break;
			  end		  
		   end
           for k=i,0,-1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
				table.insert(LsXzFk,Sj[k][j].GameObjectFk);
				else
				  break;
			  end
		   end
		   
		   if XCoutNum>=3 then
		     CountNum=XCoutNum+CountNum;
			 for key,value in pairs(LsXzFk) do
			   table.insert(LsCountFk,value);
			 end
		   end
		
		  local YCoutNum=-1;
		   for k=j,0,-1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   for k=j,8,1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   if YCoutNum>=3 then
		     CountNum=YCoutNum+CountNum;
			  for key,value in pairs(LsYzFk) do
			   table.insert(LsCountFk,value);
			  end
		   end
		
		  if CountNum>=4 then  
		     for key,value in pairs(LsCountFk) do  				
				local Iscz=false;
                for key2,value2 in pairs(ClFk) do
				    if value2==value then
					  Iscz=true;
					end
				end 
				if Iscz==false then
				table.insert(ClFk,value);
				end				
             end 
		  end
		
		local IsGb=false;
		
		if TsFk1.x==0 then
		for key,value in pairs(ClFk) do
		--print(value);
		if Sj[i][j].GameObjectFk~=value then
		--print("xx");
		XcFkType(value);
		else
			if IsGb==false then
			local LsSName;
			if XCoutNum>=4 then
			LsSName="Candnys/Candny"..Sj[i][j].Typee.."V";
			else
			LsSName="Candnys/Candny"..Sj[i][j].Typee.."H";
			end
	if IsGb==false and Sj[i][j].Typee~="Not" and Sj[i][j].Typee~="Null" then
			local CandnyS=UnityEngine.Resources.Load(LsSName);
            local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane2);
		    UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(i)][j]);	         					
			Sj[i][j].GameObjectFk=LsGz;
			UnityEngine.Object.Destroy(value);
			if XCoutNum>=4 then
			Sj[i][j].GameObjectFk.name="Candny"..Sj[i][j].Typee.."V";
			else
			Sj[i][j].GameObjectFk.name="Candny"..Sj[i][j].Typee.."H";
			end		
			IsGb=true;
	end	
			end
		end
		end
		
		else
		
		for key,value in pairs(ClFk) do
		--print(value);
		if Sj[TsFk1.x][TsFk1.y].GameObjectFk~=value and Sj[TsFk2.x][TsFk2.y].GameObjectFk~=value then
		--print("xx");
		XcFkType(value);
		else
			
		if IsGb==false then
			if Sj[TsFk1.x][TsFk1.y].GameObjectFk==value then
			local LsSName;
			if XCoutNum>=4 then
			LsSName="Candnys/Candny"..Sj[TsFk1.x][TsFk1.y].Typee.."V";
			else
			LsSName="Candnys/Candny"..Sj[TsFk1.x][TsFk1.y].Typee.."H";
			end
	
			local CandnyS=UnityEngine.Resources.Load(LsSName);
            local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane2);
		    UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(TsFk1.x)][TsFk1.y]);	         					
			Sj[TsFk1.x][TsFk1.y].GameObjectFk=LsGz;
			   UnityEngine.Object.Destroy(value);
			if XCoutNum>=4 then
			Sj[TsFk1.x][TsFk1.y].GameObjectFk.name="Candny"..Sj[TsFk1.x][TsFk1.y].Typee.."V";
			else
			Sj[TsFk1.x][TsFk1.y].GameObjectFk.name="Candny"..Sj[TsFk1.x][TsFk1.y].Typee.."H";
			end
			IsGb=true;
			elseif Sj[TsFk2.x][TsFk2.y].GameObjectFk==value then
			local LsSName;
			if XCoutNum>=4 then
			LsSName="Candnys/Candny"..Sj[TsFk2.x][TsFk2.y].Typee.."V";
			else
			LsSName="Candnys/Candny"..Sj[TsFk2.x][TsFk2.y].Typee.."H";
			end
	
			local CandnyS=UnityEngine.Resources.Load(LsSName);
            local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane2);
		    UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(TsFk2.x)][TsFk2.y]);	         					
			Sj[TsFk2.x][TsFk2.y].GameObjectFk=LsGz;
			
			UnityEngine.Object.Destroy(value);
			if XCoutNum>=4 then
			Sj[TsFk2.x][TsFk2.y].GameObjectFk.name="Candny"..Sj[TsFk2.x][TsFk2.y].Typee.."V";
			else
			Sj[TsFk2.x][TsFk2.y].GameObjectFk.name="Candny"..Sj[TsFk2.x][TsFk2.y].Typee.."H";
			end
			IsGb=true;
			end
			
			
		end
		end
		end
		
		end
		
		
		local LsKb={};		
		ClFk=LsKb;
       
	  end					
					    
	end
  end
TsFk1.x=0;
TsFk1.y=0;
TsFk2.x=0;
TsFk2.y=0;
Xc3();
end
function  Xc3()
  for i=0,10,1 do
	
    for j=0,8,1 do
		--判定有格子才会进行计算
      if Sj[i][j].Typee~="Not" and Sj[i][j]~="Null" then
	      local LsType=Sj[i][j].Typee;
		  local CountNum=0;
		  local XCoutNum=0;--x轴上的数量
		 
		  local LsCountFk={};
		  local LsXzFk={};
		  local LsYzFk={};
		   for k=i+1,10,1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
			    table.insert(LsXzFk,Sj[k][j].GameObjectFk);
			  else
				break;
			  end		  
		   end
           for k=i-1,0,-1 do
		      if Sj[k][j].Typee==LsType then
			    XCoutNum=XCoutNum+1;
				table.insert(LsXzFk,Sj[k][j].GameObjectFk);
				else
				  break;
			  end
		   end
		   
		   if XCoutNum>=2 then
		     CountNum=XCoutNum+CountNum;
			 for key,value in pairs(LsXzFk) do
			   table.insert(LsCountFk,value);
			 end
		   end
		
		  local YCoutNum=0;
		   for k=j-1,0,-1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   for k=j+1,8,1 do
		      if Sj[i][k].Typee==LsType then
			    YCoutNum=YCoutNum+1;
				table.insert(LsYzFk,Sj[i][k].GameObjectFk);
				else
				  break;
			  end
		   end
		   if YCoutNum>=2 then
		     CountNum=YCoutNum+CountNum;
			  for key,value in pairs(LsYzFk) do
			   table.insert(LsCountFk,value);
			  end
		   end
		
		  if CountNum>=2 then  
			table.insert(ClFk,Sj[i][j].GameObjectFk);
		     for key,value in pairs(LsCountFk) do  				
				local Iscz=false;
                for key2,value2 in pairs(ClFk) do
				    if value2==value then
					  Iscz=true;
					end
				end 
				if Iscz==false then
				table.insert(ClFk,value);
				end
             end 
		  end
		

       
	end					
			
		    
	end
  end
	for key,value in pairs(ClFk) do
			--print(table.getn(ClFk));
		    if value~=nil then
				--print(value.transform.gameObject.name);
			end
		
	--[[if SystemEnventManager.StrContains(value.transform.name,"V")==true  then
		local Fk1P,Fk1I,Fk1J=GetFkPosition(value.transform.gameObject);
		--print("爆炸！");
		LsSName="Candnys/CandnyGuang".."V";
		local CandnyS=UnityEngine.Resources.Load(LsSName);
        local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane4);
		UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(Fk1I)][Fk1J]);	
		for i=0,10,1 do	
		if Sj[i][Fk1J].Typee~=Not and Sj[i][Fk1J].Typee~=Null then
		
        XcFkType(Sj[i][Fk1J].GameObjectFk);
		end
		
		end
	elseif SystemEnventManager.StrContains(value.transform.name,"H")==true  then
		local Fk1P,Fk1I,Fk1J=GetFkPosition(value.transform.gameObject);
		--print("爆炸！");
		LsSName="Candnys/CandnyGuang".."H";
		local CandnyS=UnityEngine.Resources.Load(LsSName);
        local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane4);
		UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(Fk1I)][Fk1J]);
		for i=0,8,1 do	
		if Sj[Fk1I][i].Typee~=Not and Sj[Fk1I][i].Typee~=Null then
		
		XcFkType(Sj[Fk1I][i].GameObjectFk);
		
	    end		
		end
	end]]--
		XcFkType(value);
		--UnityEngine.Object.Destroy(value);
	end		
		local LsKb={};		
		ClFk=LsKb;
end

function FiveTx(LsGameObj,Fx)
  local LsX=-1;
   local LsY=-1;
   for i=0,10,1 do
        for j=0,8,1 do	
		    if Sj[i][j].GameObjectFk==LsGameObj  then
				
			    LsX=i;LsY=j;
				Sj[i][j].GameObjectFk.transform.parent = CandnyPlane3.transform;
				
				--AniMangager.AnimatorSetTrigger(Sj[i][j].GameObjectFk,Sj[i][j].Typee);
				--Sj[i][j].Typee=Typees.Null;		     
		    end
	    end
    end
  if LsX~=-1 and LsY~=-1 then
	
	  	LsSName="Prefabs/Effects/Firework";
		local CandnyS=UnityEngine.Resources.Load(LsSName);
        local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane4);
		UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(LsX)][LsY]);	
		--print("BooM");
		
	for i=0,10,1 do
        for j=0,8,1 do	
		    if SystemEnventManager.MathfAbs(i-LsX)<=2 and  SystemEnventManager.MathfAbs(j-LsY)<=2 then
				if Sj[i][j].Typee~=Typees.Not and Sj[i][j].Typee~=Typees.Null then
				    XcFkType(Sj[i][j].GameObjectFk);	
				end
				      
					
		    end
	    end
    end
		
   end	



end
--特效销毁
function TxXh(LsGameObj,Fx)

   local LsX=-1;
   local LsY=-1;
   for i=0,10,1 do
        for j=0,8,1 do	
		    if Sj[i][j].GameObjectFk==LsGameObj  then
				
			    LsX=i;LsY=j;
				Sj[i][j].GameObjectFk.transform.parent = CandnyPlane3.transform;
				
				--AniMangager.AnimatorSetTrigger(Sj[i][j].GameObjectFk,Sj[i][j].Typee);
				--Sj[i][j].Typee=Typees.Null;		     
		    end
	    end
    end
  if LsX~=-1 and LsY~=-1 then
	if SystemEnventManager.StrContains(LsGameObj.name,"V")==true then 
	  	LsSName="Candnys/CandnyGuang".."V";
		local CandnyS=UnityEngine.Resources.Load(LsSName);
        local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane4);
		UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(LsX)][LsY]);	
		for i=0,10,1 do	
		  if Sj[i][LsY].Typee~="Not" and Sj[i][LsY].Typee~="Null" then	
          XcFkType(Sj[i][LsY].GameObjectFk);
		  end	
		end 
	elseif SystemEnventManager.StrContains(LsGameObj.name,"H")==true then
	  	LsSName="Candnys/CandnyGuang".."H";
		local CandnyS=UnityEngine.Resources.Load(LsSName);
        local LsGz=UnityEngine.GameObject.Instantiate(CandnyS,CandnyPlane4);
		UIEventManager.SetRecTran(LsGz,VecPoint[SystemEnventManager.MathfAbs(LsX)][LsY]);	
		for i=0,8,1 do	
		  if Sj[LsX][i].Typee~="Not" and Sj[LsX][i].Typee~="Null" then	
		  XcFkType(Sj[LsX][i].GameObjectFk);	
	      end		
		end
	end
   end	

	
end

--方块下来调用的方法
function FkXl()
	local LsCountNull={};
   for i=1,10,1 do
        for j=0,8,1 do		
		    if Sj[i][j].Typee~=Typees.Not and Sj[i][j].Typee~=Typees.Null and Sj[i-1][j].Typee==Typees.Null then
				local LsXlFkSx={FkGameObject=Sj[i][j].GameObjectFk,XlEndPoint=Sj[i-1][j].Coordinate,Typee=Sj[i][j].Typee,x=i-1,y=j,xx=i,yy=j};
				--Sj[i][j].Typee=Typees.Null;
							
				table.insert(LsCountNull,LsXlFkSx);
				--table.insert(XlFk,LsXlFkSx);
		--[[	elseif Sj[i][j].Typee~=Typees.Not and Sj[i][j].Typee~=Null and Sj[i-1][j].Typee~=Typees.Null then
			   if j-1>=0 and j+1<=8 then
					if Sj[i-1][j+1].Typee==Typees.Null and  Sj[i][j+1].Typee==Typees.Not then
						local LsXlFkSx={FkGameObject=Sj[i][j].GameObjectFk,XlEndPoint=Sj[i-1][j+1].Coordinate,Typee=Sj[i][j].Typee,x=i-1,y=j+1,xx=i,yy=j};
						--Sj[i-1][j+1].Typee=Sj[i][j].Typee;
						table.insert(LsCountNull,LsXlFkSx);
					end			
				end	  ]]--   
		    end
	    end
    end
	
	for k=1,10,1 do
	   for l=0,8,1 do
		if l-1>=0 and l+1<=8 then
		   if Sj[k][l].Typee==Typees.Not and Sj[k-1][l].Typee==Typees.Null then
				--print("==================");
			    if Sj[k][l-1].Typee~=Typees.Not and Sj[k][l-1].Typee~=Typees.Null  and Sj[k-1][l-1].Typee~=Typees.Null then
		
		          local LsXlFkSx={FkGameObject=Sj[k][l-1].GameObjectFk,XlEndPoint=Sj[k-1][l].Coordinate,Typee=Sj[k][l-1].Typee,x=k-1,y=l,xx=k,yy=l-1};			
				  table.insert(LsCountNull,LsXlFkSx);
				if Sj[k-1][l].IsMove==false then
					Sj[k-1][l].IsMove=true;
				end
				 
				elseif  Sj[k][l+1].Typee~=Typees.Not and Sj[k][l+1].Typee~=Typees.Null  and Sj[k-1][l+1].Typee~=Typees.Null then	
				  if Sj[k-1][l].IsMove==false then
				  local LsXlFkSx={FkGameObject=Sj[k][l+1].GameObjectFk,XlEndPoint=Sj[k-1][l].Coordinate,Typee=Sj[k][l+1].Typee,x=k-1,y=l,xx=k,yy=l+1};			
				  table.insert(LsCountNull,LsXlFkSx);	
				  end
				end		
			end
		elseif l-1<0 then
			 if Sj[k][l].Typee==Typees.Not and Sj[k-1][l].Typee==Typees.Null then
		        if  Sj[k][l+1].Typee~=Typees.Not and Sj[k][l+1].Typee~=Typees.Null  and Sj[k-1][l+1].Typee~=Typees.Null then
					
				  local LsXlFkSx={FkGameObject=Sj[k][l+1].GameObjectFk,XlEndPoint=Sj[k-1][l].Coordinate,Typee=Sj[k][l+1].Typee,x=k-1,y=l,xx=k,yy=l+1};			
				  table.insert(LsCountNull,LsXlFkSx);		
				end	
			end	
		elseif l+1>8 then
			if Sj[k][l].Typee==Typees.Not and Sj[k-1][l].Typee==Typees.Null then
			    if Sj[k][l-1].Typee~=Typees.Not and Sj[k][l-1].Typee~=Typees.Null  and Sj[k-1][l-1].Typee~=Typees.Null then
				--print(k..","..l);
				  local LsXlFkSx={FkGameObject=Sj[k][l-1].GameObjectFk,XlEndPoint=Sj[k-1][l].Coordinate,Typee=Sj[k][l-1].Typee,x=k-1,y=l,xx=k,yy=l-1};			
				  table.insert(LsCountNull,LsXlFkSx);
				end
			end
	
		end
	       
	   end
	end
	
	
	XlFk=LsCountNull;
	--print(table.getn(XlFk));
	if table.getn(XlFk)==0 then
	IsMove=false;
	if IsHave==true then
	IsXlOver=true;
	
	end
	else
	IsHave=true;
	IsMove=true;
	end
	Xl();
end

function Xl()
	
    for key,value in ipairs(XlFk) do
			
	local IsOnPoint=UIEventManager.SetRecTranT2(value.FkGameObject,value.XlEndPoint);
	--table.remove(XlFk,key);
	if IsOnPoint==true then		
		--print("复位");
	--Sj[value.x+1][value.y].Typee=Typees.Null;	
	Sj[value.xx][value.yy].Typee=Typees.Null;	
	--Sj[value.x+1][value.y].GameObjectFk=nil;
	Sj[value.x][value.y].GameObjectFk=value.FkGameObject;
	Sj[value.x][value.y].Typee=value.Typee;
	--table.remove(XlFk,key);
	end
	end
end
function XlFw()
   
    
  
end

function FkSc()
	
	--[[
    for j=0,8,1 do		
		if Sj[10][j].Typee==Typees.Null then  
		 local Num=SystemEnventManager.RanIntNum(1,7);
		 local LsZb
         local LsFk=UnityEngine.GameObject.Instantiate(Candnys[Num],CandnyPlane2);
		
	     UIEventManager.SetRecTran(LsFk,VecPoint[10][j]);
         Sj[10][j].GameObjectFk=LsFk;		
		 if Candnys[Num].name=="CandnyRed" then
		   Sj[10][j].Typee=Typees.Red;
		 elseif Candnys[Num].name=="CandnyBlue" then
		   Sj[10][j].Typee=Typees.Blue;
		 elseif Candnys[Num].name=="CandnyGreen" then
		   Sj[10][j].Typee=Typees.Green;
		 elseif Candnys[Num].name=="CandnyPurple" then
		   Sj[10][j].Typee=Typees.Purple;
		 elseif Candnys[Num].name=="CandnyYellow" then
		   Sj[10][j].Typee=Typees.Yellow;
		 elseif Candnys[Num].name=="CandnyOrange" then
		   Sj[10][j].Typee=Typees.Orange;		
		 end
		  end
	 end   
]]--
     for j=0,8,1 do		
		if Sj[MaxI][j].Typee==Typees.Null then  
		 local Num=SystemEnventManager.RanIntNum(1,7);
		 local LsZb
         local LsFk=UnityEngine.GameObject.Instantiate(Candnys[Num],CandnyPlane2);
		
	     UIEventManager.SetRecTran(LsFk,VecPoint[MaxI][j]);
         Sj[MaxI][j].GameObjectFk=LsFk;		
		 if Candnys[Num].name=="CandnyRed" then
		   Sj[MaxI][j].Typee=Typees.Red;
		 elseif Candnys[Num].name=="CandnyBlue" then
		   Sj[MaxI][j].Typee=Typees.Blue;
		 elseif Candnys[Num].name=="CandnyGreen" then
		   Sj[MaxI][j].Typee=Typees.Green;
		 elseif Candnys[Num].name=="CandnyPurple" then
		   Sj[MaxI][j].Typee=Typees.Purple;
		 elseif Candnys[Num].name=="CandnyYellow" then
		   Sj[MaxI][j].Typee=Typees.Yellow;
		 elseif Candnys[Num].name=="CandnyOrange" then
		   Sj[MaxI][j].Typee=Typees.Orange;		
		 end
		  end
	 end   


end

function GetLoacCandnyGameIbject(GameObjectName)
   for k,v in ipairs(Candnys) do
        if v.name==GameObjectName then
		   return v;  
		end
   end
end

--普通方块的销毁声音
function PtFkDesAudio(Obj)
   local DesAudio=AudioManager.GetAudio("Audio/PlayAudio/Jelly_destroy");
   local AudioSourceS= AudioManager.PlayVolume(Obj,DesAudio,Data.Volume,false);
end
--4消方块的销毁声音
function PtFkDesAudioVandH(Obj)
	
   local DesAudio=AudioManager.GetAudio("Audio/PlayAudio/Color_bomb");
   local AudioSourceS= AudioManager.PlayVolume(Obj,DesAudio,Data.Volume,false);
end
--游戏场景的声音
function GameBgMusic()
   local Obj=UnityEngine.GameObject.Find("Canvas");
   local DesAudio=AudioManager.GetAudio("Audio/BackGroundAudio/game_music");
   AudioSourceS= AudioManager.PlayVolume(Obj,DesAudio,Data.Volume,true);

end

function PauseBtnFun()
   SystemEnventManager.GameObjSetActive(PausePlane,true);
   UnityEngine.Time.timeScale = 0;--暂停游戏
end

function PauseCountPlay()
   SystemEnventManager.GameObjSetActive(PausePlane,false);
   UnityEngine.Time.timeScale = 1;--继续运行游戏
end

function MapBtn()
   UnityEngine.Time.timeScale = 1;--继续运行游戏
   SystemEnventManager.SceneLoading("S2");
end

function MusicBtnOn()
	Data.Volume=0;
	SystemEnventManager.GameObjSetActive(PausePlaneMusicOffBtn,true);
	AudioManager.SetAduioSourceValue(AudioSourceS,00);
end

function MusciBtnOff()
	Data.Volume=0.5;
	SystemEnventManager.GameObjSetActive(PausePlaneMusicOffBtn,false);
	AudioManager.SetAduioSourceValue(AudioSourceS,0.5);
end

--通关开启关卡，并记录通过成绩
function TongGuan(Cj)
  table.insert(Data.XXNum,Cj)
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

function Djs()
	 t=t+UnityEngine.Time.deltaTime;
	if t>=1 then
		if GameTime>0 then
		 GameTime=GameTime-1;
		else
	     GameTime=0;
		if IsGameOver==false then
			print("kkkkkkk");
		 GameOver();
		end
		
		end
		
		UIEventManager.SetTextValue(GameTimeText,NumToTime(GameTime));
		
	t=0;
	end	
end

function SetSlider()
    UIEventManager.SetSliderValue(GradeSlider,0.01);
	if UIEventManager.GetSliderValuer(GradeSlider)>=1 then
		SystemEnventManager.GameObjSetActive(GradeXX[3],true);
		NowGameXXNum=3;
		GameOver();
		
		
	elseif UIEventManager.GetSliderValuer(GradeSlider)>0.66 then
		SystemEnventManager.GameObjSetActive(GradeXX[2],true);
		NowGameXXNum=2;
    elseif  UIEventManager.GetSliderValuer(GradeSlider)>0.33 then
	    SystemEnventManager.GameObjSetActive(GradeXX[1],true);		
		NowGameXXNum=1;
	end
end


function GameOver()
   local LsPassNameTab=mysplit(Data.CustomsPassName,"k");  
   local PassNum=SystemEnventManager.StringToInt(LsPassNameTab[2]);	
   
   if NowGameXXNum==3 then
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Star1"),true);
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Star2"),true);
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Star3"),true);
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Pf3"),true);
       
	elseif NowGameXXNum==2 then
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Star1"),true);
     	SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Star2"),true);
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Pf2"),true);
	   
    elseif  NowGameXXNum==1 then
	    SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Star1"),true);
	    SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Pf1"),true);
    else
		SystemEnventManager.GameObjSetActive(UnityEngine.GameObject.Find("Canvas/GameOverPlane/MenuComplete/Image/Pf0"),true);
    end
	if NowGameXXNum~=0 then
	   
        if NowGameXXNum> Data.XXNum[PassNum] then
		Data.XXNum[PassNum]=NowGameXXNum;
		end	
	    
		if table.getn(Data.XXNum)==PassNum then
		table.insert(Data.XXNum,0);
	    end
		
	end
	SaveData();
	SystemEnventManager.GameObjSetActive(GameOverPlane,true);
	IsGameOver=true;
	
    	
end

LoadingSta();