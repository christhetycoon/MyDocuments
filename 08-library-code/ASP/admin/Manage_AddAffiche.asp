<%@ LANGUAGE="VBScript" %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="Inc/articlechar.inc"-->

<%
if Request.QueryString("no")="yes" then
 id= Trim(Request("id"))
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Rs.Open "DELETE FROM Affiche Where id="&id,Conn,2,3,1
 Set Rs= Nothing
 Response.Redirect "Manage_AddAffiche.asp"
end if

if Request.QueryString("mark")="southidc" then
If request.form("title")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入标题，请返回检查！！"");history.go(-1);</script>")
response.end
end if

If request.form("content")="" Then
Response.Write("<script language=""JavaScript"">alert(""错误：您没输入公吿内容，请返回检查！！"");history.go(-1);</script>")
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select top 1 * from Affiche"
rs.open sql,conn,1,3

rs.addnew
if request.form("html")="on" then
rs("content")=request.form("content")
else
rs("content")=htmlencode2(request.form("content"))
end if
'rs("name")=request.form("name")
rs("title")=request.form("title")
rs("time")=date()
rs.update
rs.close
response.redirect "Manage_AddAffiche.asp"
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select  * from Affiche"
rs.open sql,conn,1,1
%>

<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br> 
      <br> 
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" height="25"> <div align="center"><strong>发布网站公告 <br>
              </strong></div></td>
        </tr>
        <tr class="td_southidc"> 
          <form method="POST" action="Manage_AddAffiche.asp?mark=southidc">
            <input type=hidden readonly name="Name"  value="管理员">
            <td>
<div align="center"> 
                <table width="100%" border="0" cellspacing="2" cellpadding="3">
                  <tr> 
                    <td width="22%" height="25"> 
                    <div align="center">公告标题:</div></td>
                    <td width="78%">
<input name="title" type="text" size="45" maxlength="100">
                    </td>
                  </tr>
                  <tr> 
                    <td height="22"> 
                    <div align="center">公告内容:</div></td>
                    <td>
<textarea rows="8" name="Content" cols="45"></textarea>
                    </td>
                  </tr>
                  <tr> 
                    <td height="25" colspan="2"> 
                      <div align="center">是否支持html 
                        <input type="checkbox" name="html" value="on">
                        <input type="submit" value="提交公告" name="B1">
                        <input type="reset" value="全部重写" name="B2">
                    </div></td>
                  </tr>
                </table>
              </div></td>
          </form>
        </tr>
      </table>
      <br>
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr bgcolor="#ECF5FF">
          <td width="63%" height="25" bgcolor="#99CCFF"><div align="center">公告标题</div>
              <div align="center"></div></td>
          <td width="18%" bgcolor="#99CCFF"><div align="center">加入时间</div></td>
          <td width="9%" bgcolor="#99CCFF"><div align="center">操作</div></td>
          <td width="10%" bgcolor="#99CCFF"><div align="center">操作</div></td>
        </tr>
        <% do while not Rs.eof %>
        <tr bgcolor="#ECF5FF">
          <td height="22" bgcolor="#ECF5FF"><div align="center"> <%=rs("Title")%></div>
              <div align="center"></div></td>
          <td><div align="center"><%= FormatDateTime(rs("time"),2) %></div></td>
          <td><div align="center"><a href="Manage_editAffiche.asp?id=<%=Rs("id")%>">修改</a></div></td>
          <td><div align="center"><a href="Manage_AddAffiche.asp?id=<%=Rs("id")%>&amp;no=yes">删除</a></div></td>
        </tr>
        <%
                  Rs.MoveNext 
					loop 
					%>
      </table>
    <br> <br> </td>
  </tr>
</table>
<%
'Set Rs = Nothing 
rs.close
'Set Conn = Nothing 
Conn.close
%>
