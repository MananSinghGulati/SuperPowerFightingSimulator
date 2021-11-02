-- all autofarm
getgenv().autoStrength = false;
getgenv().autoEndurance = false;
getgenv().autoPsychic = false;
-- functions
function doAutoStrength()
   spawn(function()
        while getgenv().autoStrength == true do
                local args = {
                    [1] = "Strength"
                }
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
                wait()
        end
   end) 
end

function doAutoEndurance()
    spawn(function()
         while getgenv().autoEndurance == true do
                 local args = {
                     [1] = "Endurance"
                 }
                 game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
                 wait()
         end
    end) 
 end

 function doAutoPsychic()
    spawn(function()
         while getgenv().autoPsychic == true do
                 local args = {
                     [1] = "Psychic"
                 }
                 game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
                 wait()
         end
    end) 
 end


 
function teleportTO(test)
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = test.CFrame;
    end
end



--ui 

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Manny's Power Simulator Farm")

local b = w:CreateFolder("Autofarm") 
b:DestroyGui()

local d = w:CreateFolder("Teleport") 

--autotran toggle

b:Toggle("AutoStrength",function(bool)
    getgenv().autoStrength = bool
    print('AutoStrength is: ', bool)

    if bool == true then
        doAutoStrength()
    end
end)

b:Toggle("AutoEndurance",function(bool)
    getgenv().autoEndurance = bool
    print('AutoEndurance is: ', bool)

    if bool == true then
        doAutoEndurance()
    end
end)

b:Toggle("AutoPsychic",function(bool)
    getgenv().autoPsychic = bool
    print('AutoPsychic is: ', bool)

    if bool == true then
       doAutoPsychic()
    end
end)

--Teleport to training area
d:Button("Carrier",function()
    teleportTO(game:GetService("Workspace")["Important Buildings (Training Areas)"].Carrier.Part)
end)

d:Button("LightHouse",function()
    teleportTO(game:GetService("Workspace")["Important Buildings (Training Areas)"].LightHouse.Part)
end)

d:Button("Crate",function()
    teleportTO(game:GetService("Workspace")["Important Buildings (Training Areas)"]["Crate Training Area"].Model.Part)
end)

d:Button("Gym",function()
    teleportTO(game:GetService("Workspace")["Important Buildings (Training Areas)"].Gym.Part)
end)

d:Button("Warehouse",function()
    teleportTO(game:GetService("Workspace")["Important Buildings (Training Areas)"]["Dock Warehouse"].Part)
end)




