<!--#include file="dmwh_conn.asp"-->
<!--#include file="Admin.asp"-->

<script language=javascript src=inc/mouse_on_title.js></script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="manage.css" type="text/css">
</head>
<BODY>
<%
action=request("ok")
if action="" then 
Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from dm_mp3"
rs.open sql,conn,1,1

Set fso = CreateObject("Scripting.FileSystemObject")
set music=Fso.OpenTextFile(server.mappath("../music/exobudpl.js"))
musiclist=music.readall
music.close
musiclist=replace(musiclist,"mkList(","")
musiclist=replace(musiclist,");","")
musiclist=replace(musiclist,chr(34),"")
musiclist=replace(musiclist,vbCRLF,"<br>")
for i=1 to 10
musiclist=replace(musiclist,"<br><br>","<br>")
next
musiclist=replace(musiclist,"<br>",vbCRLF)
set fso=nothing
%>
<table width="98%" border="1"  style="border-collapse: collapse; border-style: dotted; border-width: 0px"  bordercolor="#333333" cellspacing="0" cellpadding="2">
<form action=music.asp method=post name=setup>
<tr class=backs><td colspan=2 class=td height=18>�ø費��--��������</td></tr>
<tr><td width=20% align=right>�Ƿ񲥷����� &nbsp;</td><td > <input type="radio" name="music" value="1" <%if rs("other1")="1" then%>checked<%end if%>>���� <input type="radio" name="music" value="0" <%if rs("other1")<>"1" then%>checked<%end if%>>�ر�</td></TR>   
<tr><td width=20% align=right>�����ļ��б�&nbsp;</td><td><TEXTAREA alt="ÿ����ַ����һ��<br>�磺http://www.xinmengjia/shop/music/kfc.mp3" NAME="musiclist" ROWS=22 style="width=90%;overflow:auto;">
<%
response.write musiclist
%>
</TEXTAREA></td></TR>
<tr><td colspan=2 width="568" ><INPUT name="ok" TYPE="hidden" value="ok"><INPUT name=action TYPE="submit" value="��������"></table>
</form>
<font color=red>����ʾ��</font><br><br>ÿ��������ַ/�ļ�ռһ�С�ע�⣺��ַ���ļ����в��������ģ�<br>
��������ϵ����֣�����д��http://��mms://��ͷ����ַ�����磺http://www.hew.cn/music/laoshuaidami.mp3��<br>
�����վ�����֣��뽫�ļ��ϴ���musicĿ¼����������д�ļ��������磺laoshuaidami.mp3��<br>֧��.mp3��.wma��.asf��.wmv�ȸ�ʽ����֧��.rm��.ram��ʽ��

<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
if action="ok" then
Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from dm_mp3"
rs.open sql,conn,1,3
rs("other1")=request.form("music")
rs.update
url="music.asp"
rs.close
set rs=nothing
conn.close
set conn=nothing


musiclist=request.form("musiclist")
musiclist=replace(musiclist,vbCRLF,"<br>")
for i=1 to 10
musiclist=replace(musiclist,"<br><br>","<br>")
next

temp=split(musiclist,"<br>")
for i=0 to ubound(temp)
if trim(temp(i))<>"" then music_list=music_list&"mkList("&chr(34)&temp(i)&chr(34)&");"&vbCRLF
next

Set fso = CreateObject("Scripting.FileSystemObject")
set music=Fso.OpenTextFile(server.mappath("../music/exobudpl.js"),2)
music.write(music_list)
music.close

set fso=nothing

response.write "<script language='javascript'>"
response.write "alert('�����ɹ��������õ���Ϣ�ѱ��棡');"
response.write "location.href='"&url&"';"
response.write "</script>"
end if
%>
