<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="inc/articlechar.inc"-->

<%if Request.QueryString("no")="eshop" then
id=request("id")

if request.form("html")="on" then
rebook=request.form("rebook")
else
rebook=htmlencode2(request.form("rebook"))
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from book where id="&id
rs.open sql,conn,1,3

rs("rebook")=rebook
rs.update
rs.close
response.redirect "Manage_Book.asp"
end if

id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From book where id="&id, conn,3,3
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <form method="post" action="Manage_Rebook.asp?no=eshop">
      <input type=hidden name=id value=<%=id%>>
      <td align="center" valign="top"> <br> <br> 
        <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
          <tr> 
            <td height="25" class="back_southidc"> 
              <div align="center"><strong>回复留言 <br>
                </strong></div></td>
          </tr>
          <tr> 
            <td bgcolor="#ECF5FF"><div align="center"> 
                <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#000000" class="table_southidc">
                  <tr bgcolor="#ECF5FF"> 
                    <td height="25" colspan="2" bgcolor="#99CCFF">&nbsp;&nbsp;你正准备回复<b><%=rs("name")%></b>的留言，他的留言是：</td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td width="18%" height="22" bgcolor="#E3E3E3"> 
                    <div align="center">主 题</div></td>
                    <td width="82%" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("title")%></td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="25" bgcolor="#E3E3E3"> 
                    <div align="center">内 容</div></td>
                    <td height="25">&nbsp;&nbsp;<%=rs("content")%></td>
                  </tr>
                </table>
            </div></td>
          </tr>
        </table>
        <br> <br> 
        <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
          <tr> 
            <td class="back_southidc" height="25"> 
              <div align="center"><strong>输入回复内容</strong></div></td>
          </tr>
          <tr> 
            <td bgcolor="#E3E3E3">
<div align="center"> 
                <textarea name="rebook" cols="70" rows="10"><%=rs("rebook")%></textarea>
            </div></td>
          </tr>
          <tr> 
            <td bgcolor="#E3E3E3">
<div align="center">是否支持Html 
                <input type="checkbox" name="html" value="on">
                <input type="submit" value="确定">
                <input type="reset" value="从来">
            </div></td>
          </tr>
        </table></td>
    </form>
  </tr>
</table>