<!--#include file="dmwh_conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<p>
  <script language=javascript src=../include/mouse_on_title.js></script>
  
  <%
action = request.form("del")
if action="ok" then

Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from count_total"
rs.open sql,conn,1,3
rs("total")=0		'�ܷ�������0
rs("yesterday")=0	'�����������0
rs("today")=0		'�����������0
rs.update
conn.execute "delete from count_shop"
rs.close
set rs=nothing

response.write "<script language='javascript'>"
response.write "alert('ͳ�������ѱ������ϵͳ�������ڿ�ʼ����ͳ�ơ�');"
response.write "</script>"
end if

conn.execute("delete from count_online where datediff('h',time,now())>1")

Set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from count_total"
rs.open sql,conn,1,3
total=rs("total")		'�ܷ�����
yesterday=rs("yesterday")	'���������
today=rs("today")		'���������

set rs = server.createobject("adodb.recordset")
sql = "select * from count_online"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
online=rs.RecordCount		'��������
else 
online=1
end if

set rs = server.createobject("adodb.recordset")
sql = "select * from count_shop order by day asc"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
total_ip=rs.RecordCount		'��IP������
firstday=rs("day")		'firstday����ʼ���������
else 
total_ip=0
firstday=date()
end if
per_ip=int(total_ip/(date()-firstday+1))	'ƽ��ÿ��IP������
if per_ip<1 then per_ip=0	
per=int(total/(date()-firstday+1))	'ƽ��ÿ�������
if per<1 then per=0

set rs = server.createobject("adodb.recordset")
sql = "select * from count_shop where day=#"&date()&"#"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
today_ip=rs.RecordCount		'������IP������
else 
today_ip=0
end if
set rs=nothing

set rs = server.createobject("adodb.recordset")
sql = "select * from count_shop where day=#"&date()-1&"#"
rs.open sql,conn,1,3 
if not (rs.eof and rs.bof) then
yesterday_ip=rs.RecordCount		'������IP������
else 
yesterday_ip=0
end if
set rs=nothing

conn.close
set conn=nothing
%>
</p>
<p>&nbsp;</p>
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
  <tr class="back_southidc">
    <td height="25" align="center"><span style="font-weight: bold">����ͳ�ƻ�������</span></td>
  </tr>
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellPadding=3 cellSpacing=1 bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF" class="table_southidc">
      
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">ͳ����ʼ����</td>
        <td width="30%" bgcolor="#FFFFFF"><%=firstday%></td>
        <td width="20%" bgcolor="#99CCFF">ͳ�ƽ�ֹ����</td>
        <td width="30%" bgcolor="#FFFFFF"><%=date()%>����<%=date()-firstday+1%>�죩</td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">�ܷ�����</td>
        <td width="30%" bgcolor="#FFFFFF"><%=total%></td>
        <td width="20%" bgcolor="#99CCFF">ƽ��ÿ�շ�����</td>
        <td width="30%" bgcolor="#FFFFFF"><%=per%></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">��IP������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=total_ip%></td>
        <td width="20%" bgcolor="#99CCFF">ƽ��ÿ��IP������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=per_ip%></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">���������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=yesterday%></td>
        <td width="20%" bgcolor="#99CCFF">����IP������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=yesterday_ip%> &nbsp; <a href=tj3.asp?day=<%=date()-1%>>�鿴��ϸ</a></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">���������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=today%></td>
        <td width="20%" bgcolor="#99CCFF">����IP������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=today_ip%> &nbsp; <a href=tj3.asp?day=<%=date()%>>�鿴��ϸ</a></td>
      </tr>
      <tr>
        <td width="20%" height="25" bgcolor="#99CCFF">��ǰ��������</td>
        <td width="30%" bgcolor="#FFFFFF"><%=online%> ��</td>
        <td width="20%" bgcolor="#99CCFF">ͳ����������</td>
        <td width="30%" bgcolor="#FFFFFF"><input type=hidden name="del" value="ok">
            <input type="submit" name="action" value="ִ��" onClick="{if(confirm('���ȫ��ͳ�����ݣ����¿�ʼͳ�ơ��˲����޷��ָ�����ȷ��Ҫ������')){this.document.tongji.submit();return true;}return false;}">        </td>
      </tr>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
</body></html>
