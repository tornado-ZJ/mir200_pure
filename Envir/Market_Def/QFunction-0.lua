-- QF����ļ� ��m2����ʱ��ͻ����
math.randomseed(tostring(os.time()):reverse():sub(1, 7))

function require_ex(module)
    if package.loaded[module] then
        return package.loaded[module]
    end

    for pattern in string.gmatch(package.path, '[^;]+%?[^;]+') do
        local path = string.gsub(pattern, '%?', module)
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

local _,errinfo = pcall(function ()
    require_ex("Envir/Extension/LuaLibrary/string")
    require_ex("Envir/Extension/LuaLibrary/table")

    require_ex("Envir/QuestDiary/config/VarCfg")
    require_ex("Envir/QuestDiary/config/EventCfg")

    require_ex("Envir/QuestDiary/util/GameEvent")
    require_ex("Envir/QuestDiary/game/GM")
    require_ex("Envir/QuestDiary/game/ItemUse")

    require_ex("Envir/Script/serialize")
    require_ex("Envir/Script/A/init")
    require_ex("Envir/Script/B/init")
    require_ex("Envir/Script/C/init")
    require_ex("Envir/Script/D/init")
    require_ex("Envir/Script/E/init")
    require_ex("Envir/Script/F/init")
    require_ex("Envir/Script/G/init")
end)
if errinfo then lib996:release_print("��ʼ��QFunction-0.lua", errinfo) end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---------------------------------QManage.lua------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--��������
function startup()
    print("---------��������-----------")
end

--��¼
function login(actor)
    --ͷ����ͷ
    lib996:setbaseinfo(actor, ConstCfg.sbase.hair, 0)
    --    ��¼�¼��ɷ�
    GameEvent.push(EventCfg.onLogin, actor)

end

--�л��ʼ��
function loadguild(actor) --���actor
end

function liangong(actor)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---------------------------------QFunction.lua----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--�ܲ�
function run(actor)
    GameEvent.push(EventCfg.onMove, actor, 0)
end

--��·
function walk(actor)
    GameEvent.push(EventCfg.onMove, actor, 0)
end

--���Ա仯
function sendability(actor)

end


--NPC�������
function clicknpc(actor, npcid)
    GameEvent.push(EventCfg.onClicknpc, actor, npcid)
end

--ÿ���һ�ε�¼
function setday(actor)

end


--����
--sMsg      ��������
--chat      ����Ƶ����1;ϵͳ 2;���� 3;˽�� 4;�л� 5;��� 6;���� 7;���磩
--���� true ����������Ϣʧ��
function triggerchat(actor, sMsg, chat)
    GameEvent.push(EventCfg.onTriggerChat, actor, sMsg, chat)
end


--����
function handlerequest(actor, msgid, arg1, arg2, arg3, sMsg)

end

--����
function playlevelup(actor)

end


--��������֮ǰ
function nextdie(actor)
end


--��������
--hiter     ɱ���߶���
function playdie(actor, hiter)
    GameEvent.push(EventCfg.onPostDie, actor, hiter)
end


--ɱ������ʱ����
--actor		��������
--play		��ɱ���
function killplay(actor, play)
    GameEvent.push(EventCfg.onkillplay, actor, play)
end


--���︴��
function revival(actor)

end


--����С�˴���
function playreconnection(actor)
    FBackZone(actor)--�س�
    GameEvent.push(EventCfg.onExitGame, actor)
end

--���������رտͻ��˴���
function playoffline(actor)
    FBackZone(actor)--�س�
    GameEvent.push(EventCfg.onExitGame, actor)
end

--��Ʒ������
function addbag(actor, itemobj)
    if not actor then return end
    GameEvent.push(EventCfg.onAddBag, actor, itemobj)
end

--��ֵ
--gold  ��ֵrmb���
--productid  ��ƷID(ǰ�˵����ֵʱ�򴫵ݵĲ���) --���ò����ɺ���
--moneyid  ��ֵ��û���ID
function recharge(actor, gold, productid, moneyid)
    GameEvent.push(EventCfg.onRecharge, actor, gold, productid, moneyid)
end

--����ǰ
--Target	object	�ܻ�����
--Hiter	    object	��������
--MagicId	int	    ����ID
--Damage	int	    �˺�
--result	int	    ����ֵ���޸ĺ���˺�
function attackdamage(actor, Target, Hiter, MagicId, Damage)
    return Damage
end

--������
--self	    object	��Ҷ���
--Target	object	�ܻ�����
--Hiter	    object	��������
--MagicId	int	   	����ID
function attack(self, Target, Hiter, MagicId)

end

--�ܻ�ǰ
--self	    object  ��Ҷ���
--Hiter	    object	��������
--Target	object	�ܻ�����
--MagicId	int	    ����ID
--Damage
function struckdamage(self, Hiter, Target, MagicId, Damage)
    return Damage
end

function baowupin(...)
    print("----------------")
    print(...)
end

--�ܻ���
--self	    object	��Ҷ���
--Target	object	�ܻ�����
--Hiter	    object	��������
--MagicId	int	   	����ID
function struck(self, Target, Hiter, MagicId)

end

--������װ������
function dropuseitemsbefore(actor)

end

--������װ������
function dropbagitemsbefore(actor)

end

--���ǿ�ʼ����
function castlewarstart()
    lib996:sendmsg(nil, 2, '{"Msg":"ɳ�����Ի�ѿ���������","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"ɳ�����Ի�ѿ���������","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"ɳ�����Ի�ѿ���������","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
    GameEvent.push(EventCfg.gocastlewarstart)
end

--���ǽ�������
function castlewarend()
end

--ռ��ɳ�Ϳ˴���
function getcastle0()
    --print("ռ��ɳ�Ϳ˴���")
end

--��Ҹ�����
function changehumnameok(actor)

end

--ˢ��֪ͨ
function makemonnotice(mon)

end

--������װ��---
function takeoffex(actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onProTakeOff, actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onTakeOffEx, actor, itemobj, where, itemname, makeid)
end
--���ﴩװ��----
function takeonex(actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onProTakeOn, actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onTakeOnEx, actor, itemobj, where, itemname, makeid)
end

--�����ͼɱ������
function killmon(actor, monobj)
    local monidx = lib996:getbaseinfo(monobj, ConstCfg.gbase.idx)
    GameEvent.push(EventCfg.onKillMon, actor, monobj, monidx)
end

--�л���ͼ
function entermap(actor)
    local former_mapid = lib996:getstr(0,actor, VarCfg.S_cur_mapid)
    local cur_mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    cur_mapid = tostring(cur_mapid)
    if cur_mapid ~= former_mapid then       --�л��˵�ͼ
        lib996:setstr(0,actor, VarCfg.S_cur_mapid,cur_mapid)
        GameEvent.push(EventCfg.goSwitchMap, actor, cur_mapid, former_mapid)
    else
        GameEvent.push(EventCfg.goEnterMap, actor, cur_mapid)
    end
end

--�뿪��ͼ
function leavemap(actor)

end

function getexp()

end

function picktask()

end
function changetask()

end

function deletetask()

end

function findpathend()

end




local money = {
    gold                = 1,    --���
    yb                  = 2,    --Ԫ��
    bdgold              = 3,    --�󶨽��
    bdyb                = 4,    --��Ԫ��
    mzb                 = 5,    --������
    jingyan             = 6,    --����
    lf                  = 7,    --���
    paodian             = 8,     --�ݵ�
    ryz                 = 9,     --����ֵ
    cent                = 11,   --��ֵ�� 1rmb = 1��ֵ��
    rmb                 = 12,   --rmb
}

--���Ҹı䴥��
function moneychangeex(actor,id)
    --print("���Ҹı䣺",id)
end

function titlechangedex(actor, id)
    --print("�ƺŸı�",id)
end

function on_burst(attack,ack)    --��������--attack�ǹ�����
    local burst = lib996:attr(attack,29)       --��������
    local burst_dam = lib996:attr(attack,30)  --�����˺�

    local cc = 0            --δ���� ����0 ������ѱ��������˺�����
    if burst > 0 then
        local bu = math.random(1,10000)
        if bu <= burst then --���α���
            cc = (ack*(1+(burst_dam*0.0001)))//1
            ack = ack + cc
        end
    end
    return ack,cc
end

function on_ref_att(role,hp,attack)    --����������--role���ܻ��� hp��û�з���ʱΪ0  ������Ѫ ������Ѫ
    local ref = lib996:attr(role,37)
    local bref = lib996:attr(role,38)
    local pref = lib996:attr(role,39)

    local cc = 0
    local bu = 0

    if pref == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pref then
            bu = 1
        end
    end

    if bu == 1 then
        if ref > 0 then
            cc = ref
        end
        if bref > 0 then
            cc = cc - ((bref*hp*0.0001)//1)
        end
        lib996:humanhp(attack,"-",cc,1)
    end
    return cc
end

function on_ref_mag(role,hp,attack)    --ħ����������--role���ܻ���
    local ref = lib996:attr(role,40)
    local bref = lib996:attr(role,41)
    local pref = lib996:attr(role,42)
    local cc = 0
    local bu = 0

    if pref == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pref then
            bu = 1
        end
    end

    if bu == 1 then
        if ref > 0 then
            cc = ref
        end
        if bref > 0 then
            cc = cc - ((bref*hp*0.0001)//1)
        end
        lib996:humanhp(attack,"-",cc,1)
    end
    return  cc
end

function on_imm_att(role,hp)    --������������--
    local imm = lib996:attr(role,31)      --���˹̶�ֵ
    local bimm = lib996:attr(role,32)     --���˰ٷֱ�
    local pimm = lib996:attr(role,33)     --���˼��� 0ʱ��100% ����

    local cc = 0                            --����˶����˺�
    local bu = 0                            --�Ƿ������˼���

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --���˼���
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc - ((bimm*hp*0.0001)//1)
        end
        hp = hp + cc
    end
    return hp,cc
end

function on_imm_mag(role,hp)    --ħ����������--
    local imm = lib996:attr(role,34)      --���˹̶�ֵ
    local bimm = lib996:attr(role,35)     --���˰ٷֱ�
    local pimm = lib996:attr(role,36)     --���˼��� 0ʱ��100% ����
    local cc = 0                            --����˶����˺�
    local bu = 0                            --�Ƿ������˼���

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --���˼���
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc - ((bimm*hp*0.0001)//1)
        end
        hp = hp + cc
    end
    return hp,cc
end

function on_ign_att(attack,def)    --����͸����--
    local imm = lib996:attr(attack,43)
    local bimm = lib996:attr(attack,44)
    local pimm = lib996:attr(attack,45)

    local cc = 0
    local bu = 0

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --����ֵ���Ϊ0 ��Ļ�������
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc + ((bimm*def*0.0001)//1)
        end
        def = def - cc
        if def < 0 then
            def = 0
        end
    end
    return def,cc
end

function on_ign_mag(attack,def)    --ħ����͸����--
    local imm = lib996:attr(attack,46)
    local bimm = lib996:attr(attack,47)
    local pimm = lib996:attr(attack,48)
    local cc = 0
    local bu = 0

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --����ֵ���Ϊ0
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc + ((bimm*def*0.0001)//1)
        end
        def = def - cc
        if def < 0 then
            def = 0
        end
    end
    return def,cc
end

function on_suck_hp(attack,hp)    --��Ѫ����--
    local suck = lib996:attr(attack,49)
    local bsuck = lib996:attr(attack,50)
    local psuck = lib996:attr(attack,51)

    local cc = 0
    local bu = 0

    if psuck == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= psuck then
            bu = 1
        end
    end

    if bu == 1 then     --����ֵ���Ϊ0
        if suck > 0 then
            cc = suck
        end
        if bsuck > 0 then
            cc = cc - ((bsuck*hp*0.0001)//1)
        end
        lib996:humanhp(attack,"+",cc,4)
    end
    return cc
end

function on_suck_mp(attack,hp,role)    --��������--
    local suck = lib996:attr(attack,52)
    local bsuck = lib996:attr(attack,53)
    local psuck = lib996:attr(attack,54)
    local cc = 0
    local bu = 0

    if psuck == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= psuck then
            bu = 1
        end
    end

    if bu == 1 then
        if suck > 0 then
            cc = suck
        end
        if bsuck > 0 then
            cc = cc - ((bsuck*hp*0.0001)//1)
        end
        lib996:humanmp(role,"-",cc)
        lib996:humanmp(attack,"+",cc)
    end
    return cc
end

function on_dcr(attack,hp)    --��������--
    local dcr = lib996:attr(attack,56)
    local cc = 0

    if dcr > 0 then
        cc = cc + ((dcr*hp*0.0001)//1)
        hp = hp + cc
    end
    return hp,cc
end

function on_critical(attack,hp)    --����һ������
    local critical = lib996:attr(attack,200)

    local cc = 0
    if critical > 0 then
        local bu = math.random(1,10000)
        if bu <= critical then
            cc = hp*10
            hp = cc
        end
    end
    return hp,cc
end

function on_soul(attack,hp)    --�ɻ�����
    local soul = lib996:attr(attack,201)

    local cc = 0
    if soul > 0 then
        cc = soul
        hp = hp - cc
    end
    return hp,cc
end

function on_blessed(role)    --��������
    local blessed = lib996:attr(role,202)
    local sj = math.random(1,10000)
    local cc = 0
    if sj <= blessed then
        local maxhp = lib996:getbaseinfo(role,12)
        local dqhp = lib996:getbaseinfo(role,11)
        cc = (maxhp - dqhp)*0.5
        lib996:humanhp(role,"+",cc,4)
    end
    return cc
end

function on_def(role,hp)    --���Է�������
    local def = lib996:attr(role,202)
    local sj = math.random(1,10000)

    if sj <= def then
        hp = -1
    end
    return hp
end



--����ǰ���� ��Ȼ5.3֧��˫���� ���� ��Ҫ���̫��̬�� ��ֵ�ᱬ��
function on_hurt_pre(attack,role,ack,def,skillid,hurttype)
    local hp = 0 -- ����Ϊ��Ѫ ����Ϊ��Ѫ
    if lib996:getbaseinfo(attack,-1) then       --���﹥��
        if hurttype == 0 then           --�����˺����� ���㴩͸
            def = on_ign_att(attack,def)
        else
            def = on_ign_mag(attack,def)
        end

        ack = on_burst(attack,ack)      --����������

        hp = def - ack                  --���ݹ�����������˺�
    end
    if lib996:getbaseinfo(role,-1) then --���㷴�� �����ܻ��˺����������
        if hurttype == 0 then
            on_ref_att(role,hp,attack)
        else
            on_ref_mag(role,hp,attack)
        end

        if hurttype == 0 then           --�����˺����� ���� �ܻ��� ����
            hp = on_imm_att(role,hp)
        else
            hp = on_imm_mag(role,hp)
        end
    end
    if lib996:getbaseinfo(attack,-1) then      --���﹥�������˺�����
        hp = on_dcr(attack,hp)
        -----����һ��
        hp = on_critical(attack,hp)
        -----����
        if lib996:getbaseinfo(role,-1) then
            hp = on_def(role,hp)            --���Է���
        end

        on_suck_hp(attack,hp)               --��Ѫ
        on_suck_mp(attack,hp,role)          --����

        if not lib996:getbaseinfo(role,-1) then    --����ʱ
            hp = on_soul(attack,hp)             --�ɻ� ������������Ѫ
        end
    end
    if not lib996:getbaseinfo(attack,-1) then    --����ʱ����
        if lib996:getbaseinfo(attack,-1) then     --�����ܻ�
            on_blessed(role)                --��������
        end
    end

    return hp
end



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---------------------------------RobotManage.lua--------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function beforedawn()
    local t = lib996:getplayerlst()
    for _,actor in ipairs(t) do
        local beforedawndatas = {}
        GameEvent.push(EventCfg.onBeforedawn, actor, beforedawndatas)
    end
    local openday = lib996:grobalinfo(1)
    GameEvent.push(EventCfg.roBeforedawn, nil, openday)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------------��ʱ��-----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


----------------------------------------ϵͳ��ʱ��-----------------------------------



--���ǽ�����ʱ����
function ontimerex24()
    GameEvent.push(EventCfg.goCastlewarend)
end

--���˵�¼
function dummylogin(actor)
end