#NoTrayIcon  ;����ʾ����ͼ��
;Re: loopѭ��ֹͣʧЧ  11 Oct 2018, 04:09
;��һ���ȼ��ӳ���Pause��ס�󣬻���Loop����ѭ�����ٴΰ��ȼ���û�õģ���ΪĬ������ÿ���ȼ�����ͬʱ����һ���̡߳�
;��һ���߳�û��ִ�����ʱ�������ȼ��ǲ�����ֹ�������еģ�������ͣ/������������Reload������


PgDn::
Hotkey, %A_ThisHotkey%,, T2 ; �����޸�ÿ���ȼ�����ͬʱ����2���߳�
if (F2_ok)
{
Reload
exitapp
return
}			

F2_ok:=1
loop
{
Send,{Tab}
Sleep,100
Send,{Tab}
Sleep,100
Send,{Right}
Sleep,100
Send,{Right}
Sleep,100
}
exitapp
return
 
