<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
dim sql,rs,Action,ID
Action=Trim(Request("Action"))
ID=Trim(Request("VoteID"))
if Action="Set" and ID<>"" then
	conn.execute "Update Vote set IsSelected=False where IsSelected=True"
	conn.execute "Update Vote set IsSelected=True Where ID=" & ID
	response.Write "<script language='JavaScript' type='text/JavaScript'>alert('���óɹ���');</script>"
end if
sql="select * from Vote order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br>
      <p align="center"><strong><br>
      <br>
      <form method="POST" action="VoteManage.asp">
        <table width="560" border="0">
          <tr>
            <td>����ѡ�<strong><a href="VoteAdd.asp">����µ���</a></strong></td>
          </tr>
        </table>
        <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" Class="table_southidc">
          <tr bgcolor="#A4B6D7" class="back_southidc">
            <td height="25" colspan="3" align="center"><strong>�� 
      �� �� ��</strong></td>
          </tr>
          <tr bgcolor="#99CCFF" class="title"> 
            <td width="56" height="25" align="center">ѡ��</td>
            <td width="327" align="center">����</td>
            <td width="95" align="center">����</td>
          </tr>
          <%
if not (rs.bof and rs.eof) then
	do while not rs.eof
%>
          <tr bgcolor="#ECF5FF" class="tdbg"> 
            <td width="56" height="22" align="center"> 
              <input type="radio" value=<%=rs("ID")%><%if rs("IsSelected")=true then%> checked<%end if%> name="VoteID"></td>
            <td height="22">&nbsp;<%=rs("Title")%></td>
            <td width="95" height="22" align="center"><a href="VoteModify.asp?ID=<%=rs("ID")%>">�޸�</a> 
              <a href="VoteDel.asp?ID=<%=rs("ID")%>">ɾ��</a></td>
          </tr>
          <%
rs.movenext
loop
%>
          <tr bgcolor="#FFFFFF" class="tdbg"> 
            <td colspan=3 align=center> 
              <input name="Action" type="hidden" id="Action" value="Set"> 
              <input type="submit" value="��ѡ���ĵ�����Ϊ���µ���" name="submit"> </td>
          </tr>
          <% end if%>
        </table>
      </form>
    </strong></p> </td>
  </tr>
</table>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>