EventCfg = {}


--�����¼�
EventCfg.onNewHuman                 = "onNewHuman"                    --�½�ɫ��һ�ε�¼    (������actor)
EventCfg.onLogin                    = "onLogin"                       --��¼    (������actor)
EventCfg.onLoginAttr                = "onLoginAttr"                   --��¼��������    (������actor, ��¼��������)
EventCfg.onLoginEnd                 = "onLoginEnd"                    --��¼���    (������actor, ��¼ͬ������)
EventCfg.onKillMon                  = "onKillMon"                     --�����ͼɱ��    (������actor, �����������, ��������idx)
EventCfg.onkillplay                 = "onkillplay"                    --�����ͼɱ��
EventCfg.onPlayLevelUp              = "onPlayLevelUp"                 --�������    (������actor, ��ǰ�ȼ�, ֮ǰ�ȼ�)
EventCfg.onTakeOnEx                 = "onTakeOnEx"                    --��װ��goPlayerVar
EventCfg.onTakeOffEx                = "onTakeOffEx"                   --��װ��
EventCfg.onAddBag                   = "onAddBag"                      --��Ʒ������
EventCfg.onExitGame                 = "onExitGame"                    --С�˻������Ϸ
EventCfg.onTriggerChat              = "onTriggerChat"                 --������������Ϣ
EventCfg.onClicknpc                 = "onClicknpc"                    --���ĳNPC
EventCfg.onRechargeBefore           = "onRechargeBefore"              --��ֵǰ����,�޸�ʵ����(������actor, ��ֵrmb���, ��ƷID��������, ����ID)
EventCfg.onRecharge                 = "onRecharge"                    --��ֵ     (������actor, ��ֵrmb���, ��ƷID��������, ����ID)
EventCfg.goEnterMap                 = "goEnterMap"                    --�����ͼ
EventCfg.goSwitchMap                = "goSwitchMap"                   --�л���ͼ

--��Ϸ�¼�
EventCfg.goDeclareVar               = "goDeclareVar"                  --����ȫ�ֱ���
EventCfg.goPlayerVar                = "goPlayerVar"                   --�������˱���    (������actor)
EventCfg.goZSLevelChange            = "goZSLevelChange"               --ת���ȼ������仯 (������actor, ��ǰת���ȼ��� ֮ǰ��ת���ȼ�)
EventCfg.goBeforedawn               = "goBeforedawn"                  --�����˽ű�ÿ���賿����  (������actor, �賿ͬ������)
EventCfg.roBeforedawn               = "roBeforedawn"                  --�����˽ű�ÿ���賿���� (�ѿ�������)
EventCfg.goDailyUpdate              = "goDailyUpdate"                 --ÿ�ո���(�賿��ÿ�յ�һ�ε�¼)(������actor, �Ƿ�ÿ�յ�һ�ε�¼, ͬ������)
EventCfg.goCheckModule              = "goCheckModule"                 --����Ƿ���ģ��ﵽ����Ҫ��
EventCfg.goOpenModule               = "goOpenModule"                  --ĳģ��ﵽ����Ҫ��(������actor, ģ��ID)
EventCfg.goSetGem                   = "goSetGem"                      --��Ƕ��ʯ(������actor)
EventCfg.goBaoWu                    = "goBaoWu"                       --��������(������actor)
EventCfg.goNiTian                   = "goNiTian"                      --�����������(������actor)
EventCfg.goShenShou                 = "goShenShou"                    --��������(������actor)
EventCfg.goKuangBao                 = "goKuangBao"                    --������(������actor)
EventCfg.goPickUpItemEx             = "goPickUpItemEx"                --ʰȡ��Ʒ�󴥷�(������actor, item��--�ȴ�֧��num)
EventCfg.goCastlewarend             = "goCastlewarend"                --���ǽ���ʱ����
EventCfg.gocastlewarstart           = "gocastlewarstart"              --���ǿ�ʼʱ����
EventCfg.gomapeventwalk             = "gomapeventwalk"                --ɳ�Ϳ˽��ʹ��߲�����
EventCfg.goActivityState            = "goActivityState"               --�������ر�չʾ���(���� �idx,�state)

EventCfg.goActivityMap              = "goActivityMap"                 --������ͼ����(�������������Ϣ)
EventCfg.goBackMap                  = "goBackMap"                     --�뿪���ͼ����(ˢ������������Ϣ)

EventCfg.goVIPlvelup                = "goVIPlvelup"                   --����vipʱ��������(������1actor, 2viplevel)
EventCfg.goADDFashion               = "goADDFashion"                  --������Զ���ʱװ����

EventCfg.goRongHe                   = "goRongHe"                    --װ���ں�(������actor)
EventCfg.goJinJie                   = "goJinJie"                    --װ������(������actor)
EventCfg.goJHMW                     = "goJHMW"                      --��������/vip����(������actor)
EventCfg.goHecheng1                 = "goHecheng1"                  --����ϳ�
EventCfg.goHecheng2                 = "goHecheng2"                  --��Ժϳ�

EventCfg.goQuickAccess              = "goQuickAccess"               --�򿪲����������(itemidx)

EventCfg.goBill                     = "goBill"                      --��ֵ���(�¿����������۳��������ֹ�ۼƳ�ֵ)


return EventCfg