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


;ճ�� ���������30���� ���س�  ���+�м�
~LButton & MButton::
{
Sleep, 300	;�ȴ�0.3s ǿ�ƻ�е�ȴ�
Send ^v
MouseMove, 0, 30, 0, R  ;
;;;;;;;;;;;;;;;;;;;;;;;;;MouseMove, 50, 0, 0, R  ;�������50����
Sleep, 300	
Send {LButton}
Sleep, 300	
Send {Enter}
Sleep, 300	
Return
}


;��ճ��  �Ҽ�+�м�
~RButton & MButton::
{
Send ^v
Return
}
