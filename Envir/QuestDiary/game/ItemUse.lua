-- -------------------------------------------------------------------------------------
-- -------------------------------������ 31����Ʒ���� ������----------------------------------
-- -------------------------------------------------------------------------------------
--itemUseʹ�ù���:cfg_item.xls StdMode��Ϊ31,stdmodefunc���������Anicount������
--����:  ����������:StdMode = 31,Anicount = 10000,���ú��� stdmodefunc10000

local cfg_map_xz = {
    [1] = {
        suiji = "boss1",
        huicheng = "dld",
    },
}
local cfg_huichengshi = {
    tc1 = {
        Id = "xtc3",
        npc = 155,
        npcidx = 159,
    },
}

--���ش���ʯ
function stdmodefunc1(actor,item)
    local mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    for i, v in ipairs(cfg_map_xz) do
        if mapid == v.huicheng then  --��ֹʹ�ûس�ʯ
            lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ֹʹ�ûس�</font>","Type":9}')
            lib996:stop(actor)
            return
        end
    end
    local cfg_back = cfg_huichengshi[mapid]
    if cfg_back then
        lib996:mapmove(actor,cfg_back.Id,cfg_back.npc,cfg_back.npcidx)
    else
        FBackZone(actor)
    end
end
--�������ʯ
function stdmodefunc2(actor,item)
    local mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    --print("����ʹ�����ʯ", mapid)
    for i, v in ipairs(cfg_map_xz) do
        if mapid == v.suiji then  --��ֹʹ�����
            lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>��ֹʹ�����</font>","Type":9}')
            lib996:stop(actor)
            return
        end
    end
    lib996:map(actor,mapid)
end