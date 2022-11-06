Global = {}

function beforedawn()
    local t = getplayerlst()
    for _,actor in ipairs(t) do
        Global.dailyupdate(actor)
    end
    local openday = grobalinfo(1)
    GameEvent.push(EventCfg.RoBeforedawn, openday)
end

--����ȫ�ֱ���
function Global.declareVar()
end



-------------------------------������Ϣ---------------------------------------


--���������ʡǮ
function Global.RequestOpenTTSQ(actor)
end

-------------------------------�߼�����---------------------------------------
--ÿ�ո���
function Global.dailyupdate(actor, islogin, datas)
    local before_date = lib996:getplaydef(actor, VarCfg.T_daily_date)
    local cur_date = os.date("%Y%m%d") --��ǰ������
    if cur_date ~= before_date then
        lib996:setplaydef(actor, VarCfg.T_daily_date, cur_date)  --����һ����µ�ǰ������
        GameEvent.push(EventCfg.goDailyUpdate, actor, islogin, datas)
    end
end

-------------------------------�¼�---------------------------------------
--��¼���
local _login_SyncOpenDay = { 0,120}
local _login_SyncCreateActor = {0, 0}
function Global.LoginEnd(actor, logindatas)
    Global.dailyupdate(actor, true, logindatas)

    --��������
    _login_SyncOpenDay[1] = lib996:grobalinfo()
    --����������
    _login_SyncOpenDay[2] = 120
    table.insert(logindatas, _login_SyncOpenDay)

    --������ɫ��Ϣ
    _login_SyncCreateActor[1] = lib996:getplaydef(actor, VarCfg.U_create_actor_time)

    local openday = lib996:grobalinfo(1)
    local create_actor_openday = lib996:getplaydef(actor, VarCfg.U_create_actor_openday)
    local create_actor_day = openday - create_actor_openday + 1
    _login_SyncCreateActor[2] = create_actor_day
    
    table.insert(logindatas, _login_SyncCreateActor)
end

--ÿ���賿
function Global.Beforedawn(actor, beforedawndatas)
    Global.dailyupdate(actor, false, beforedawndatas)

    --��������
    _login_SyncOpenDay[1] = lib996:grobalinfo(1)
    table.insert(beforedawndatas, _login_SyncOpenDay)

end

--���ĳNPC
function Global.ClickNpcResponse(actor, npcid)
end

--��ֵ����
function Global.Recharge(actor, gold, productid, moneyid)
end


-------------------------------�����¼�---------------------------------------
GameEvent.add(EventCfg.onLoginEnd, Global.LoginEnd, Global, 1)
GameEvent.add(EventCfg.goBeforedawn, Global.Beforedawn, Global, 1)
GameEvent.add(EventCfg.onClicknpc, Global.ClickNpcResponse, Global, 1)
GameEvent.add(EventCfg.onRecharge, Global.Recharge, Global, 1)


return Global