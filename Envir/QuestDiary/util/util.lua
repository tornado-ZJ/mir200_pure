math.randomseed(tostring(os.time()):reverse():sub(1, 7))

local function _Includes()
    require("Envir/Extension/LuaLibrary/string")
    require("Envir/Extension/LuaLibrary/table")

    require("Envir/QuestDiary/config/VarCfg")
    require("Envir/QuestDiary/config/EventCfg")


    require("Envir/QuestDiary/util/GameEvent")
    require("Envir/QuestDiary/game/Global")
    require("Envir/QuestDiary/game/GM")

    --require("Envir/Script/serialize")


    require("Envir/Script/init")

end

function UIncludes()
    local _,errinfo = pcall(_Includes)
    if errinfo then
        lib996:release_print("UIncludes", errinfo)
    end
end

function ULogin(actor, isnewhuman)
    local level = lib996:getbaseinfo(actor, 6)
    lib996:setplaydef(actor, VarCfg.N_cur_level, level)
    --���˱�������
    GameEvent.push(EventCfg.goPlayerVar, actor)
    liangong(actor)   --����ʦ���Ա���
    --��һ�ε�¼
    if isnewhuman then GameEvent.push(EventCfg.onNewHuman, actor) end
    --��¼
    GameEvent.push(EventCfg.onLogin, actor)
    --��¼��������
    local loginattrs = {}
    GameEvent.push(EventCfg.onLoginAttr, actor, loginattrs)
    QsQupdateAddr(actor, loginattrs)
    --��¼���
    local logindatas = {}
    GameEvent.push(EventCfg.onLoginEnd, actor, logindatas)
end



function liangong(actor)
    lib996:iniplayvar(actor, "string", "HUMAN", "C_QsQliangong")
end
