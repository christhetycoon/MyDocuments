<%@ language="VBScript"%>
<%response.Expires = 0%>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="inc/md5.asp"-->
<!--#include file="inc/function.asp"-->
<%
id=request.querystring("id")
OldPassword=replace(trim(Request("OldPassword")),"'","")
NewPassword=replace(trim(Request("NewPassword")),"'","")

if strLength(NewPassword)>16 or strLength(NewPassword)<5 then
  response.write  "<script language=javascript>alert('�����������λ������С��6λ�����16λ!');history.go(-1);</script>"
  response.End
end if

set rs=server.createobject("adodb.recordset")
sql="select * from admin where Id="&id
rs.open sql,conn,3,3

'���¹���Ա���뵽���ݿ�
if md5(OldPassword)<>rs("PassWord")  then
  response.write  "<script language=javascript>alert('ԭ��������뷵����������!');history.go(-1);</script>"
  response.End
else    
  rs("PassWord")=md5(NewPassword)
end if  
rs.update
rs.close
response.redirect "Manage_Admin.asp"
%>