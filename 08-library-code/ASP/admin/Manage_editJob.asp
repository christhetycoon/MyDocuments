<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%if Request.QueryString("mark")="southidc" then

id=request("id")
Duix=request("Duix")
Rens=request("Rens")
Did=request("Did")
Daiy=request("Daiy")
Yaoq=request("Yaoq")
Qix=request("Qix")


If Duix="" Then
response.write "SORRY <br>"
response.write "请输入招聘对象"
response.end
end if
If Rens="" Then
response.write "SORRY <br>"
response.write "招聘人数不能为空"
response.end
end if
If Did="" Then
response.write "SORRY <br>"
response.write "工作地点不能为空"
response.end
end if
If Daiy="" Then
response.write "SORRY <br>"
response.write "工资待遇不能为空"
response.end
end if
If Qix="" Then
response.write "SORRY <br>"
response.write "有效期限不能为空"
response.end
end if
If Yaoq="" Then
response.write "SORRY <br>"
response.write "招聘要求不能为空"
response.end
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from Job where id="&id
rs.open sql,conn,1,3

rs("Duix")=Duix
rs("Rens")=Rens
rs("Did")=Did
rs("Daiy")=Daiy
rs("Yaoq")=Yaoq
rs("Qix")=Qix
rs("Time")=Date()
rs.update
rs.close
response.redirect "Manage_Job.asp"
end if
%>
<%
id=request.querystring("id")
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open "Select * From Job where id="&id, conn,3,3
%>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br> <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" height="25"> <div align="center"><strong>修改招聘<br>
              </strong></div></td>
        </tr>
        <tr> 
          <form method="post" action="Manage_editJob.asp?mark=southidc">
            <input type=hidden name=id value=<%=id%>>
            <td bgcolor="#FFFFFF"><div align="center"> 
                <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
                  <tr bgcolor="#ECF5FF"> 
                    <td width="19%" height="25"> 
                      <div align="center">招聘对象</div></td>
                    <td width="81%"> 
                      <input name="Duix" type="text" class="inputtext" id="Duix" value="<%=rs("Duix")%>" size="25" maxlength="30">
                    </td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">招聘人数</div></td>
                    <td bgcolor="#ECF5FF"> 
                      <input name="Rens" type="text" class="inputtext" id="Rens" value="<%=rs("Rens")%>" size="5" maxlength="30">
                      人</td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">工作地点</div></td>
                    <td height="-4" bgcolor="#ECF5FF"> 
                      <input name="Did" type="text" class="inputtext" id="Did" value="<%=rs("Did")%>" size="30" maxlength="50">
                    </td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">工资待遇</div></td>
                    <td height="-1" bgcolor="#ECF5FF"> 
                      <input name="Daiy" type="text" class="inputtext" id="Daiy" value="<%=rs("Daiy")%>" size="20" maxlength="50">
                    </td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">发布日期</div></td>
                    <td height="-3"> <%=Date()%></td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">有效期限</div></td>
                    <td height="0" bgcolor="#ECF5FF"> 
                      <input name="Qix" type="text" class="inputtext" id="Qix" value="<%=rs("Qix")%>" size="5" maxlength="30">
                      天</td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="22"> 
                      <div align="center">招聘要求</div></td>
                    <td height="10"> 
                      <textarea name="Yaoq" cols="40" rows="5" class="inputtext" id="Yaoq"><%=rs("Yaoq")%></textarea></td>
                  </tr>
                  <tr bgcolor="#ECF5FF"> 
                    <td height="25" colspan="2"> 
                      <div align="center"> 
                        <input name="submit" type="submit" value="确定">
                        &nbsp; 
                        <input name="reset" type="reset" value="取消">
                      </div></td>
                  </tr>
                </table>
            </div></td>
          </form>
        </tr>
      </table></td>
  </tr>
</table>