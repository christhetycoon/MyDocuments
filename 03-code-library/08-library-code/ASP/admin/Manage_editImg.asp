<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%if Request.QueryString("mark")="southidc" then

id=request("id")
title=request("title")
img=server.htmlencode(Trim(Request("img")))

If title="" Then
response.write "SORRY <br>"
response.write "������������ݵı���"
response.end
end if
If img="" Then
response.write "SORRY <br>"
response.write "���ݲ���Ϊ��"
response.end
end if


Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from img where id="&id
rs.open sql,conn,1,3

rs("title")=title
rs("img")=img
rs.update
rs.close
response.redirect "Manage_Img.asp"
end if
%>
<%
id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From img where id="&id, conn,3,3
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <form method="post" name="myform" action="Manage_editImg.asp?mark=southidc">
   <input type=hidden name=id value=<%=id%>>
  <tr> 
    <td align="center" valign="top"> <br>
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr bgcolor="#ECF5FF" class="back_southidc">
          <td height="25" colspan="2" align="center" bgcolor="#ECF5FF"><span style="font-weight: bold">�޸���ҵ����</span></td>
          </tr>
        <tr bgcolor="#E3E3E3">
          <td width="8%" height="25" bgcolor="#E3E3E3"><div align="center">��������</div></td>
          <td width="62%" height="25" bgcolor="#E3E3E3"><input type="text" name="title" maxlength="30" size="25" value="<%=rs("title")%>"></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td height="25" bgcolor="#E3E3E3"><div align="center">����֤��</div></td>
          <td height="25" bgcolor="#E3E3E3"><input name="img" type="text" id="img" value="<%=rs("img")%>" size="25" maxlength="30">
              <font color="#FF0000"> * ͼƬ��ַ</font></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td height="25" colspan="2" bgcolor="#E3E3E3"><div align="center">
              <input name="submit" type="submit" value="ȷ��">
            &nbsp;</div></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td height="25" colspan="2" bgcolor="#E3E3E3">ͼƬ�ϴ�</td>
        </tr>
        <tr>
          <td height="25" colspan="2" bgcolor="#E3E3E3"><div align="left">
              <iframe style="top:2px" ID="UploadFiles" src="../upload_Photo.asp?PhotoUrlID=3" frameborder=0 scrolling=no width="300" height="25"></iframe>
          </div></td>
        </tr>
      </table></td>
  </tr>
    </form>
</table>