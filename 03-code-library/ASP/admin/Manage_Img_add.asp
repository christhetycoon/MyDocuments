<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%if Request.QueryString("mark")="southidc" then%>
<%
title=server.htmlencode(Trim(Request("title")))
img=server.htmlencode(Trim(Request("img")))
%>
<%
If title="" Then
response.write "SORRY <br>"
response.write "������������ݵı���!!<a href=""javascript:history.go(-1)"">��������</a>"
response.end
end if
If img="" Then
response.write "SORRY <br>"
response.write "���ݲ���Ϊ��!!<a href=""javascript:history.go(-1)"">��������</a>"
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from img "
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("img")=img
rs("Time")=Date()
rs.update
rs.close
response.redirect "Manage_Img.asp"
end if
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<form method="post" name="myform" action="Manage_Img_add.asp?mark=southidc">
  <tr> 
    <td align="center" valign="top"> <br>
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr bgcolor="#ECF5FF" class="back_southidc">
          <td colspan="2" align="center"><span style="font-weight: bold">�����ҵ����</span></td>
          </tr>
        <tr bgcolor="#E3E3E3">
          <td width="8%"><div align="center">��������</div></td>
          <td width="62%"><input type="text" name="title" class="inputtext" maxlength="30" size="25"></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td><div align="center">����ͼƬ</div></td>
          <td><input name="img" type="text" class="inputtext" id="img" size="30" maxlength="50">
              <font color="#FF0000"> * ͼƬ��ַ</font></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td colspan="2"><div align="center">
              <input name="submit" type="submit" value=" �� �� ">
            &nbsp;</div></td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td colspan="2">ͼƬ�ϴ�</td>
        </tr>
        <tr bgcolor="#E3E3E3">
          <td colspan="2"><div align="left">
              <iframe style="top:2px" ID="UploadFiles" src="../upload_Photo.asp?PhotoUrlID=3" frameborder=0 scrolling=no width="300" height="25"></iframe>
          </div></td>
        </tr>
      </table>
      <br> </td>
  </tr>
    </form>
</table>