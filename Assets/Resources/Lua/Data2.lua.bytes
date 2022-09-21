local json=require("cjson");

local tab={};

tab.name="Joker";
tab.age=22;
tab.hp=100;

function JsonTest(str)
    local data=json.decode(str);
	print(data.name);
end

function JsonToStr()
   str=json.encode(tab);
   UnityEngine.PlayerPrefs.SetString("tab",str);
   SaveUserData(str);
  
end

function JsonUpDate()
      
end


function SaveUserData(userData) 
--[[table.insert( UserData.userList,userData ) 
--序列化 
local data = json.encode(UserData.userList) 
log(data) 
log("———=———") ]]--
--–W  打开只写文件，若文件存在则文件长度清为0， 
--–即该文件内容会消失。若文件不存在则建立该文件。 
--–a  以附加的方式打开只写文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾， 
--–即文件原先的内容会被保留。（EOF符保留） 
--–b 二进制模式，如果文件是二进制文件，可以加上b 
--–+ 号表示对文件既可以读也可以写 
local file =io.open("C:/Users/Administrator/Desktop/RPGToLUa/RPG_ToLua/Assets/LuaFramework/Lua/GameData/UserData.txt","wb") 
file:write(userData)  
io.close(file)--–简单模式 
file:close()--–同一时间处理多个文件 
        log(data) 
end
--------------------- 


--–封装解析数据的方法
function ParseUserData() 
local file =io.open("C:/Users/Administrator/Desktop/RPGToLUa/RPG_ToLua/Assets/LuaFramework/Lua/GameData/UserData.txt","rb") 
--”*a”从当前位置读取整个文件。例：file.read(“*a”) 
local readjson = file:read("*a") 
  if readjson~="" then 
  print(readjson) 
  io.close() 
  file:close() 
  --–反序列化 
  UserData.userList=json.decode(readjson) 
  print(UserData.userList[1].Name) 
  print("--------------") 
  end 
end

JsonToStr();
