<!--#include file="dmwh_conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<p>
  <script language=javascript src=../include/mouse_on_title.js></script>
  
  
</p>
<p>&nbsp;</p>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc"  style="border-collapse: collapse; border-style: dotted; border-width: 0px">
<tr class=back_southidc><td height=25 align="center" class=td style="font-weight: bold">��վ���������ձ���</td>
</tr>
<tr><td bgcolor="#FFFFFF">
  <table width="100%" border="0" cellPadding=3 cellSpacing=1 bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" class="table_southidc">
  <tr bgcolor="#99CCFF">
    <td width="33%" height="25" bgcolor="#99CCFF">����</td>
    <td width="33%" height="25" bgcolor="#99CCFF">IP������</td>
    <td width="33%" height="25" bgcolor="#99CCFF">������ϸ</td>
  </tr>

<%
set rs=Server.CreateObject("ADODB.recordset")
sql="select count(*) as temp, day from count_shop group by day order by day desc"
rs.cursorlocation = 3     '�α�
rs.open sql,conn,1,1 
if rs.eof and rs.bof then
%>
  <tr>
    <td height="25" colspan=3 bgcolor="#FFFFFF">��ʱû��ͳ������</td>
  </tr>
<%
else


pages = 31			'ÿҳ��¼��
rs.pageSize = pages
allPages = rs.pageCount		'����һ���ֶܷ���ҳ
page = Request("page")
'if������ڻ������Ŵ���
if isEmpty(page) or clng(page) < 1 then
page = 1
elseif clng(page) >= allPages then
page = allPages 
end if
rs.AbsolutePage = page


do while not rs.eof and pages>0
%>

  <tr>
    <td height="25" bgcolor="#FFFFFF"><%=rs("day")%></td><td height="25" bgcolor="#FFFFFF"><%=rs("temp")%></td><td height="25" bgcolor="#FFFFFF"><a href="tj3.asp?day=<%=rs("day")%>">�鿴������ϸ</a></td>
  </tr>

<%
pages = pages - 1
rs.movenext
if rs.eof then exit do
loop

end if

rs.close
set rs=nothing
set rs1=nothing
conn.close
set conn=nothing
%>

</table>
<%
call listpages()
%>
</td></tr>
</table>
</body></html>


<%
'��ҳ
sub listPages() 
if allpages <= 1 then exit sub 
if page = 1 then
response.write "<font color=darkgray>��ҳ ǰҳ</font>"
else
response.write "<a href="&request.ServerVariables("script_name")&"?page=1>��ҳ</a> <a href="&request.ServerVariables("script_name")&"?page="&page-1&">ǰҳ</a>"
end if
if page = allpages then
response.write "<font color=darkgray> ��ҳ ĩҳ</font>"
else
response.write " <a href="&request.ServerVariables("script_name")&"?page="&page+1&">��ҳ</a> <a href="&request.ServerVariables("script_name")&"?page="&allpages&">ĩҳ</a>"
end if
response.write " ��"&page&"ҳ ��"&allpages&"ҳ"
end sub
%>
