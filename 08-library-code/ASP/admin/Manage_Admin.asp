<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from admin"
rs.open sqltext,conn,1,1
%>
<script language="javascript">
function confirmdel(id){
if (confirm("真的要删除此管理员帐号?"))
window.location.href="Delmanager.asp?id="+id+"  "   }
</script>
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--
function myform_onsubmit()
{
if (document.myform.Password.value!=document.myform.ConPassword.value)
{
alert ("新密码和确认密码不一致。");
document.myform.Password.value='';
document.myform.ConPassword.value='';
document.myform.Password.focus();
return false;
}
}
//-->
</SCRIPT>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <strong><br>
      </strong> <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td class="back_southidc" width="598" height="25" > <div align="center"><strong>添加管理员</strong></div></td>
        </tr>
        <tr class="tr_southidc"> 
          <FORM language=javascript name=myform  onsubmit="return myform_onsubmit()"
action=addmanagerok.asp method=post>
            <td><table width="50%" border="0" align="center" >
                <tr> 
                  <td height="25" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <td width="29%" height="22"> <div align="right">管理员帐号：</div></td>
                  <td width="71%"><input name="UserName" type="text" id="UserName" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">管理员密码：</div></td>
                  <td><input name="Password" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22"> <div align="right">密码确认：</div></td>
                  <td><input name="ConPassword" type="password" size="16" maxlength="20"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2"><div align="center">
                      <INPUT type=submit value='确认添加' name=Submit2>
                    </div></td>
                </tr>
              </table></td>
          </form>
        </tr>
      </table>
      <br> 
      <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <tr> 
          <td width="553" height="25" class="back_southidc"> <div align="center"><strong>管理员帐号管理</strong></div></td>
        </tr>
        <tr valign="top" class="tr_southidc"> 
          <FORM language=javascript
action=addmanagerok.asp method=post>
            <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
                <tr bgcolor="#99CCFF"> 
                  <td width="28%" height="25"> 
                  <div align="center">管理员帐号</div></td>
                  <td width="28%"> 
                  <div align="center">管理员密码</div></td>
                  <td width="24%"> 
                  <div align="center">操作</div></td>
                  <td width="20%"> 
                  <div align="center">删除</div></td>
                </tr>
                <%
if not rs.eof then
do while not rs.eof
%>
                <tr bgcolor="#DFEBF2"> 
                  <td height="22" class="td_southidc"> 
                  <div align="center"><%=rs("UserName")%></div></td>
                  <td class="td_southidc"> 
                  <div align="center"><%=rs("PassWord")%></div></td>
                  <td class="td_southidc"> 
                    <div align="center">
                      <%response.write "<a href='Manage_Adminedit.asp?ID="&rs("Id")&"'  >修改密码</a>"%>
                  </div></td>
                  <td class="td_southidc"> 
                    <div align="center">
                      <%response.write "<a href='javascript:confirmdel(" & rs("Id") & ")'>删除</a>"%>
                  </div></td>
                </tr>
<%
rs.movenext
loop
end if
%>
<%
rs.close
conn.close
%>
            </table></td>
          </form>
        </tr>
      </table>
      <strong> </strong></td>
  </tr>
</table>