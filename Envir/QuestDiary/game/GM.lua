

    --���
    function usercmd10001(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 1, "=", 0, "", true)
    end
    function usercmd10002(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 1, "+", 100000000, "", true)
    end
    
    --Ԫ��
    function usercmd10003(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 2, "=", 0, "", true)
    end
    function usercmd10004(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 2, "+", 100000000, "", true)
    end
    
    --���
    function usercmd10005(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 7, "=", 0, "", true)
    end
    function usercmd10006(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 7, "+", 100000000, "", true)
    end
    
    --��Ԫ��
    function usercmd10007(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 4, "=", 0, "", true)
    end
    function usercmd10008(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        lib996:changemoney(actor, 4, "+", 100000000, "", true)
    end

    --�����ս
    function usercmd10009(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playyydz.custom_open(actor)
    end
    function usercmd10010(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playyydz.custom_close(actor)
    end

    --���Ҷ�
    function usercmd10011(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playdld.custom_open(actor)
    end
    function usercmd10012(actor)
        if getgmlevel(actor) ~= 10 then return end
        Playdld.custom_close(actor)
    end

    --�������
    function usercmd10100(actor, tasktype)
        if getgmlevel(actor) ~= 10 then return end
        local tasktype = tonumber(tasktype)
        if not tasktype then return end
        Task.rwwc(actor, tasktype)
    end
    --�������2
    function usercmd10101(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.finish(actor, taskid)
    end
    --������ȡ
    function usercmd10102(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.receive(actor, taskid)
    end
    --����ɾ��
    function usercmd10103(actor, taskid)
        if getgmlevel(actor) ~= 10 then return end
        taskid = tonumber(taskid)
        if not taskid then return end
        Task.delete(actor, taskid)
    end

    function usercmd10013(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local zslevel = lib996:getbaseinfo(actor, 39)
        local next_zslevel = zslevel + 1
        lib996:setbaseinfo(actor, 39, next_zslevel)  --ת������
        GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
        ULogin(actor)
    end

    function usercmd10014(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local zslevel = lib996:getbaseinfo(actor, 39)
        local next_zslevel = 0
        lib996:setbaseinfo(actor, 39, next_zslevel)  --ת������
        GameEvent.push(EventCfg.goZSLevelChange, actor, next_zslevel, zslevel)
        ULogin(actor)
    end

    --ȫ�����
    function usercmd10015(actor)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local _mapID = lib996:getbaseinfo(actor, 3)
        local x,y = lib996:getbaseinfo(actor, 4),lib996:getbaseinfo(actor, 5)
        local object = lib996:getobjectinmap(_mapID,x,y,10,2)
        if #object > 0 then
            for i, mon in ipairs(object) do
                lib996:killmonbyobj(actor,mon,true,true,true)
            end
        end
    end

    --��ӵ���
    function usercmd10016(actor, itemName,itemNum)
        if lib996:getgmlevel(actor) ~= 10 then return end
        local Name = tonumber(itemName)
        if type(Name) == "number" then
            itemName = lib996:getstditeminfo(Name,1)
        end
        itemNum = tonumber(itemNum) or 1
        lib996:giveitem(actor,itemName,itemNum)
    end

    --���������ȼ�+1
    function usercmd10017(actor)
        JiangHuMingWang.GmLevelAdd(actor)
    end
    --���������ȼ����
    function usercmd10018(actor)
        JiangHuMingWang.GmLevelClear(actor)
    end
    --������������
    function usercmd10019(actor)
        JiangHuMingWang.GmRw(actor)
    end

    --���Գ�ֵ
    function usercmd10020(actor,num,moneyid)
        num = tonumber(num)
        moneyid = tonumber(moneyid) or ConstCfg.money.lf
        if not num then return end
        recharge(actor, num, moneyid,moneyid)
    end

    --�¿�������һ��
    function usercmd10021(actor)
        Yueka.GmSet(actor)
    end

    --�¿����ñ���
    function usercmd10022(actor)
        Yueka.GmClear(actor)
    end

     --����������һ��
    function usercmd10104(actor)
        local t = lib996:getplayerlst()
        for _,actor in ipairs(t) do
            local beforedawndatas = {}
            GameEvent.push(EventCfg.goBeforedawn, actor, beforedawndatas)
        end
        local openday = lib996:grobalinfo(1)
        GameEvent.push(EventCfg.roBeforedawn, openday)
    end
    --�������л���������
    function usercmd10105(actor)
        lib996:addattacksabakall()
        lib996:release_print("gmִ�гɹ�")
    end
    --�����Ʒ
    function usercmd10106(actor)
        local tab_name = {}
        local tab_num = {}
        local item_tab = lib996:getbagitems(actor)   --��ȡ����������Ʒ����
        for i=1,#item_tab do
            local item = item_tab[i]
            local id = lib996:getiteminfo(actor, item, 2)  --��ȡ������Ʒid
            local name = lib996:getstditeminfo(id,1)          --��ȡ������Ʒname
            local item_mun = lib996:getiteminfo(actor, item, 5)  --��ȡ�ѵ�
            if item_mun == 0 then   --�ѵ�Ϊ0 Ϊ���ѵ� ����Ϊ1
                item_mun = 1
            end
            table.insert(tab_name,name)
            table.insert(tab_num,item_mun)
        end
        for j=1,#tab_name do
            lib996:takeitem(actor,tab_name[j],tab_num[j])
        end
    end
    --��ѯ��������Ʒ
    function usercmd10107(actor)
        local tab_name = {}
        local tab_num = {}
        local tab_idx = {}
        local tab_id = {}
        local tab_item = {}
        
        local item_tab = lib996:getbagitems(actor)
        for i=1,#item_tab do
            local item = item_tab[i]
            local idx = lib996:getiteminfo(actor, item, 2)  --��ȡ������Ʒ���
            local id = lib996:getiteminfo(actor, item, 1)  --��ȡ������ƷΨһid
            local name = lib996:getstditeminfo(idx,1)          --��ȡ������Ʒname
            local item_mun = lib996:getiteminfo(actor, item, 5)  --��ȡ�ѵ�
            if item_mun == 0 then   --�ѵ�Ϊ0 Ϊ���ѵ� ����Ϊ1
                item_mun = 1
            end
            
            table.insert(tab_name,name)
            table.insert(tab_num,item_mun)
            table.insert(tab_idx,idx)
            table.insert(tab_id,id)
            table.insert(tab_item,item)
        end
        for j=1,#tab_name do
            lib996:release_print(" ��ƷID:"..tab_idx[j].."������:"..tab_name[j].."������:"..tab_num[j].."������:"..tab_item[j].."��ΨһID:"..tab_id[j])
        end
    end
    --��ѯ����Զ������ @get ������
    function usercmd10108(actor,var)
        local value = getplayvar(actor,var)
        lib996:release_print(type(value)..":"..var.." = "..value)
    end
    --��������Զ������ @set ������ ����ֵ
    function usercmd10109(actor,var,value)
        setplayvar(actor, "HUMAN",var,value,1)
    end
    --��ѯȫ���Զ������ @get ������
    function usercmd10110(actor,var)
        local value = getsysvarex(var)
        lib996:release_print(type(value)..":"..var.." = "..value)
    end
    --����ȫ�ֶ������ @set ������ ����ֵ
    function usercmd10111(actor,var,value)
        setsysvarex(var,value, 1)
    end

    --ˢ��
    function usercmd10112(actor, monName,monmNum)
        monmNum = monmNum or 1
        local map = lib996:getbaseinfo(actor, 3)
        local x = lib996:getbaseinfo(actor, 4) + 2
        local y = lib996:getbaseinfo(actor, 5) + 2
        local r = 3

        itemNum = tonumber(itemNum) or 1
        lib996:genmon(map,x,y,monName,r,monmNum)
    end
