<!--#include file="mysqlfire.asp"-->
<!--#include file="ordersec.asp"-->
<!--#include file="orderconn.asp"-->
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
 dim sql
 dim rs
 set rs=server.createobject("adodb.recordset")
 sql="select id,disposed,disposedate from myorder where id="&request("ID")
 rs.open sql,conn,1,3
 if not rs.eof then
   if request("dispose")="yes" then
   	rs("disposed") = 1
   	rs("disposedate")=now()
   else
   	rs("disposed") = 0
   	rs("disposedate")=null
   end if
   rs.update
 end if
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 response.redirect "vieworder.asp"
%>
