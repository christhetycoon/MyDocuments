<% 
' �������ݿ�
set conn=server.createobject("adodb.connection")
conn.open "driver={microsoft access driver (*.mdb)};dbq="&server.mappath("database.mdb")
%>

<%
' ��ѯ����
exec="select * from student"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn
%>

<%
' ��ʼд���ڵ�
response.Write("<class>" & chr(13))
%>

<%
' ѭ��д������¼
while not rs.EOF
	response.Write("<student>" & chr(13))
	response.Write(chr(9) & "<name>" & rs("name") & "</name>" & chr(13))
	response.Write(chr(9) & "<code>" & rs("code") & "</code>" & chr(13))
	response.Write("</student>"  & chr(13))
	rs.moveNext
wend
%>

<%
' ���д���ڵ�
response.Write("</class>")
%>