#NoTrayIcon  ;����ʾ����ͼ��

;����  �����ס����������, ��Ҫ�ɿ�, �����Ҽ����ɸ���. 
;		��� pro-��ʾ ���ƺͼ��е�����.ahk Ч������
~LButton & RButton::
{
send ^c

Sleep, 100	;�ȴ�0.1s ǿ�ƻ�е�ȴ�������������� 
;clip:=clipboard
StringLeft,clipboard_left,clipboard,500
Tooltip,%clipboard_left%		;������Ҳ���ʾclip(clipboard����)
Sleep,800
Tooltip,

Return 
}



;��ճ��  �Ҽ�+�м�
~LButton & MButton::
{
Send ^v
Return
}
