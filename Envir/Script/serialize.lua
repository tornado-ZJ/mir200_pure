function require_ex(module)
    if package.loaded[module] then
        return package.loaded[module]
    end

    for pattern in string.gmatch(package.path, '[^;]+%?[^;]+') do
        local path = string.gsub(pattern, '%?', module)
        -- lib996:release_print("path",type(path),path)
        local fp = loadfile(path)
        if fp then
            local ret = fp()
            if ret ~= nil then
                package.loaded[module] = ret
            else
                package.loaded[module] = true
            end
            return package.loaded[module]
        end
    end
end

require_ex("Envir/Extension/LuaLibrary/string")
require_ex("Envir/Extension/LuaLibrary/table")
local VarCfg = require_ex("Envir/QuestDiary/config/VarCfg")
local ConstCfg = require_ex("Envir/QuestDiary/config/ConstCfg")
local MsgUtil = require_ex("Envir/QuestDiary/util/MsgUtil")
local Player = require_ex("Envir/QuestDiary/util/Player")


function serialize(obj)  --���л�

    local zlua = nil
    local lua = lib996:tbl2json(obj)
    lua = tostring(lua)
    if lua == "nil" or lua == "" then
        return zlua
    end

    zlua = "'"..lua.."'"

    return zlua
end

function unserialize(lua)  --�����л�
    lua = tostring(lua)
    local obj = nil
    if lua == "nil" or lua == "" then
        return obj
    end

    lua = string.gsub(lua, "'","")
    obj = lib996:json2tbl(lua)

    return obj
end

function print(...)
    lib996:release_print(...)
end

function dump(...)
    lib996:release_print(serialize(...))
end

function GenRandom(min,max)
    --�õ�ʱ���ַ���
    local strTime=tostring(os.time())
    --�õ�һ����ת�ַ���
    local strRev=string.reverse(strTime)
    --�õ�ǰ6λ
    local strRandomTime=string.sub(strRev, 1, 6)
    --����ʱ������
    math.randomseed(strRandomTime)
    --��������
    --print("#�����=",math.random(min, max))
    return math.random(min, max)
end

--���ļ����ú���ʾ��  --�ٷ��ӿں�����ǿ��Сд  (������)
function delaycall(actor,time,strfun,pra)
    lib996:delaymsggoto(actor,time,"delaycallfile,"..strfun)
end


--���ļ����ú���
--callfile("Envir/Script/A/ǿ��:playervar",actor)
--callfile("playervar",actor) --��ǰ�ļ���ֱ������fun
function callfileex(filename,...)
    local tab = string.split(filename, ":")
    if #tab == 2 then
        require_ex(tab[1])
        local f = load("return "..tab[2])()
        if f == nil then return end
        f(...)
    else
        local f = load("return "..filename)()
        if f == nil then return end
        f(...)
    end
end

function QsQStrSplit2(str, reps)

    local r = {}
    if str == nil then return nil end
    string.gsub(str, "[^"..reps.."]+", function(w) table.insert(r, tonumber(w) or w ) end)
    return r
end

--�и��ַ���  --ͬ�ͻ��� A/GUIinit�ļ���  SLStrSplitByMore
function QsQStrSplitByMore(str, repsArr)
    if #repsArr < 1 then
        return tonumber(str) or str
    end
    local repsArrCopy = {}

    for k,v in ipairs(repsArr) do
        repsArrCopy[k] = v
    end

    local r = QsQStrSplit2(str,repsArrCopy[1])
    table.remove(repsArrCopy, 1)

    for k,v in ipairs(r) do
        r[k] = QsQStrSplitByMore(v,repsArrCopy)
    end

    return r
end



function QsQRanomByWeight(t, weights)
    local sum = 0
    for i = 1, #weights do
        sum = sum + weights[i]
    end
    local compareWeight = GenRandom(1, sum)
    local weightIndex = 1
    while sum > 0 do
        sum = sum - weights[weightIndex]
        if sum < compareWeight then
            return t[weightIndex]
        end
        weightIndex = weightIndex + 1
    end
    return weightIndex
end

--��� ��Ʒ ���� װ���Ƿ���������()
---QsQIsItemNumByTable
---@param actor ���
---@param t table���ı�
---@return �������㷵�ز�����Ʒ������
function QsQIsItemNumByTable(actor, t)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        local name = lib996:getstditeminfo(idx, 1)
        if idx <= 100 then
            if not QsQcheckMoneyNum(actor, idx, num) then
                return name, num
            end
        else
            if not QsQcheckItemNumByIdx(actor, idx, num) then
                return name, num
            end
        end
    end
end

--����������
---QsQcheckMoneyNum
---@param actor ��ɫ
---@param moneytype ��������
---@param num ��������
function QsQcheckMoneyNum(actor, moneytype, num)
    local moneynum = lib996:querymoney(actor, moneytype)
    return moneynum >= num
end

--�����Ʒ����
function QsQcheckItemNumByIdx(actor, idx, num)
    num = num or 1
    local count = 0
    local item_tab = lib996:getbagitems(actor)
    for i=1,#item_tab do
        local item = item_tab[i]
        local item_id = lib996:getiteminfo(actor, item, 2)
        if item_id == idx then
            local item_mun = lib996:getiteminfo(actor, item, 5)
            if item_mun == 0 then
                item_mun = 1
            end
            count = count + item_mun
        end
    end

    return count >= num
end

--������Ʒ
---QsQtakeItemByTable
---@param actor ���
---@param t ���ı�
---@param desc ����
function QsQtakeItemByTable(actor, t, desc)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if idx <= 100 then
            lib996:changemoney(actor, idx, "-", num, desc, true)
        else
            local name = lib996:getstditeminfo(idx, 1)
            lib996:takeitem(actor, name, num)
        end
    end
end

--��������
local _addrs = {}
function QsQupdateAddr(actor, loginattrs)
    --��������
    for attridx=1,250 do
        _addrs[attridx] = 0
    end

    for _,addr in ipairs(loginattrs) do
        for _,v in ipairs(addr) do
            local attridx = v[1]
            _addrs[attridx] = _addrs[attridx] + v[2]
        end
    end

    --������������
    for attridx,value in ipairs(_addrs) do
        if value > 0 then
            lib996:changehumnewvalue(actor, attridx, _addrs[attridx], 123456789)
        end
    end
end

--���²�������  cur_attr=��Ҫ�۳������ԣ�next_attr=��Ҫ���ϵ�����
---QsQupdateSomeAddr
---@param actor ���
---@param cur_attr table��ǰ����
---@param next_attr table���º�����
function QsQupdateSomeAddr(actor, cur_attr, next_attr)
    local newattr = {}
    if cur_attr then
        for _,attr in ipairs(cur_attr) do
            local attridx, attrvalue = attr[1], attr[2]
            newattr[attridx] = newattr[attridx] or lib996:gethumnewvalue(actor, attridx)
            newattr[attridx] = newattr[attridx] - attrvalue
            if newattr[attridx] < 0 then newattr[attridx] = 0 end
        end
    end

    if next_attr then
        for _,attr in ipairs(next_attr) do
            local attridx, attrvalue = attr[1], attr[2]
            newattr[attridx] = newattr[attridx] or lib996:gethumnewvalue(actor, attridx)
            newattr[attridx] = newattr[attridx] + attrvalue
        end
    end

    --cfg_att_score.xls ����
    for attridx,attrvalue in pairs(newattr) do
        lib996:changehumnewvalue(actor, attridx, attrvalue, 123456789)
    end
end

function QsQupdateSomeMoney(actor, cur_attr, next_attr)
    local newattr = {}
    if cur_attr then
        for _,attr in ipairs(cur_attr) do
            local attridx, attrvalue = attr[1], attr[2]
            newattr[attridx] = newattr[attridx] or lib996:querymoney(actor, attridx)
            newattr[attridx] = newattr[attridx] - attrvalue
            if newattr[attridx] < 0 then newattr[attridx] = 0 end
        end
    end

    if next_attr then
        for _,attr in ipairs(next_attr) do
            local attridx, attrvalue = attr[1], attr[2]
            newattr[attridx] = newattr[attridx] or lib996:querymoney(actor, attridx)
            newattr[attridx] = newattr[attridx] + attrvalue
        end
    end

    --cfg_att_score.xls ����
    for attridx,attrvalue in pairs(newattr) do
        lib996:changemoney(actor, attridx, "=",attrvalue, "", true )
    end
end

--�жϳɹ���:����ɹ�����false
--suc_rate:�ɹ���
--ratio:����
--return:����trueû�ɹ�
function FProbabilityHit(suc_rate, ratio)
    ratio = ratio or 100
    local rate = GenRandom(1, ratio)
    return rate > suc_rate
end

--��תʱ����  100 = 00:01:40
function ssrSecToHMS(sec)
    sec = sec or 0

    local h,m,s = 0,0,0
    if sec > 3600 then
        h = math.floor(sec/3600)
    end
    sec = sec % 3600
    if sec > 60 then
        m = math.floor(sec/60)
    end
    s = sec % 60

    return string.format("%02d:%02d:%02d", h, m, s)
end

function FBackZone(actor)
    lib996:mapmove(actor, "23",110,105,10)
end

--���һ������ķ�Χ
function FCheckRange(obj, x, y, range)
    local cur_x, cur_y = lib996:getbaseinfo(obj, ConstCfg.gbase.x), lib996:getbaseinfo(obj, ConstCfg.gbase.y)
    local min_x, max_x = x-range, x+range
    local min_y, max_y = y-range, y+range

    if (cur_x >= min_x) and (cur_x <= max_x) and
            (cur_y >= min_y) and (cur_y <= max_y) then
        return true
    end

    return false
end
--����Լ���npc�ľ���
function FCheckNPCRange(actor, npcidx, range)
    range = range or 15
    local npcobj = lib996:getnpcbyindex(npcidx)
    local npc_mapid = lib996:getbaseinfo(npcobj, ConstCfg.gbase.mapid)
    local my_mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    if npc_mapid ~= my_mapid then return false end

    local npc_x = lib996:getbaseinfo(npcobj, ConstCfg.gbase.x)
    local npc_y = lib996:getbaseinfo(npcobj, ConstCfg.gbase.y)
    return FCheckRange(actor, npc_x, npc_y, range)
end

function ResponseCfgGet(str, ...)
    return string.format(str, ...)
end

--�����ʼ�
local cfg_mail = lib996:include("QuestDiary/cfgcsv/cfg_mail.lua")
function _Fsendmail(name,id,reward,...)
    local cfg = cfg_mail[id]
    if not cfg then return end
    --�ʼ�����
    local content
    if cfg.content then
        if cfg.parameter then
            content = string.format(cfg.content, ...)
        else
            content = cfg.content
        end
    end
    local stritem
    --�ʼ���Ʒ
    if reward then
        if type(reward) == "table" then
            local items
            for _,item in ipairs(reward) do
                if type(item) == "table" then
                    items = items or {}
                    if item[3] == 1 then item[3] = ConstCfg.binding end
                    table.insert(items, table.concat(item, "#"))
                else
                    stritem = table.concat(reward, "&")
                    break
                end
            end

            if items then stritem = table.concat(items, "&") end
        else
            stritem = reward.."#1"
        end
    end
    lib996:sendmail("#"..name, 1, cfg.title, content, stritem)
end