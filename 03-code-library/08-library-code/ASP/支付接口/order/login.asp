<!--#include file="../paysettings.asp"-->
<!--#include file="mysqlfire.asp"-->
<%
'#############################################################
'#              ��ϲ֧��ƽ̨֧���ӿڶ�������ϵͳ
'#                            v2.0
'#                   http://www.168reg.cn
'#
'#  ��Ȩ����: �����к�г����Ƽ���չ���޹�˾
'#
'#  ��ҳ��ַ: http://www.168reg.cn
'#  ����֧��: support@168reg.cn
'#  �� �� QQ: 359465724
'#  ����QQȺ��8246422��7048987
'#
'#############################################################
'# ��֣������:
'# ���˶���ϵͳ���ṩ���װ涨�������ܣ��������ܣ������п�����
'# �������û�ԭ�򣬿��ܵ��¶������ݶ�ʧ���뾭����¼�������鿴������
'# ���˳��򲻵����⹫�����������ۻ���������Ƿ�ת�á�
'# ����Դ˳������κ����ʣ����ڹ��������ԡ�
'#############################################################
if Request.Form("orderuser")<>"" and Request.Form("orderpass")<>"" then
	if Request.Form("orderuser")=orderuser and Request.Form("orderpass")=orderpass then
		session("adminorder")=orderuser
		Response.Redirect("vieworder.asp")
		Response.end
	else
		Response.write "�û����͵�¼��������뷵��"
		Response.end
	end if
end if
%>
<html>
<head>
<title>��������ϵͳ��¼</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body text="#FFFFFF" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<div align="center">
                  <table border="0" width="100%" cellspacing="0" cellpadding="0">
                    <tr>
<td valign="top" width="100%">
<br>
<form method="POST" action="login.asp">
<div align="center">
  <center>
<table cellpadding="3" cellspacing="0" border="0" width="50%">
<tr class="innerborder">
<td valign="top" nowrap align="center" colspan="2">
  <p align="center"><b>��������ϵͳ����¼</b></p>
</td>
</tr>
<tr class="active">
<td valign="middle" nowrap width="30%" align="right"><b>�� �� ��:</b></td>       
<td valign="middle" nowrap width="70%"><input type="text" name="orderuser" size="20" maxlength="15"></td>
</tr>
<tr class="active">
<td valign="middle" nowrap width="30%" align="right"><b>�ܡ�����:</b></td>
<td valign="middle" nowrap width="70%"><input type="password" name="orderpass" size="20" maxlength="16"></td>
</tr>
<tr class="active">
<td valign="middle" nowrap width="30%" align="right"></td>      
<td valign="middle" nowrap width="70%"><input type="submit" value="�� ¼" name="submit" style="background-color: #8099CC; color: #FFFFFF"></td>
</tr>
</table>
  </center>
</div>
</form>
</td>
                    </tr>
                  </table>
</div>
</BODY></HTML>