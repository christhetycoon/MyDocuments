<%@language=vbscript codepage=936 %>
<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
dim Action,BigClassName,SmallClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
BigClassName=trim(request("BigClassName"))
SmallClassName=trim(request("SmallClassName"))
if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>下载大类名不能为空！</li>"
	end if
	if SmallClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>下载小类名不能为空！</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		rs.open "Select * From SmallClass_down Where BigClassName='" & BigClassName & "' AND SmallClassName='" & SmallClassName & "'",conn,1,3
		if not rs.EOF then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>“" & BigClassName & "”中已经存在下载小类“" & SmallClassName & "”！</li>"
		else
     		rs.addnew
			rs("BigClassName")=BigClassName
    	 	rs("SmallClassName")=SmallClassName
     		rs.update
	     	rs.Close
    	 	set rs=Nothing
     		call CloseConn()
			Response.Redirect "Down_ClassManage.asp"  
		end if
	end if
end if
if FoundErr=True then
	call WriteErrMsg()
else
%>
<script language="JavaScript" type="text/JavaScript">
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("请先添加大类名称！");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("小类名称不能为空！");
	document.form2.SmallClassName.focus();
	return false;
  }
}
</script>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><br>
        <br>
        <form name="form2" method="post" action="Down_ClassAddSmall.asp" onSubmit="return checkSmall()">
          <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#ECF5FF" class="table_southidc">
            <tr bgcolor="#A4B6D7" class="back_southidc">
              <td height="25" colspan="2" align="center"><strong>添加下载小类</strong></td>
            </tr>
            <tr class="tdbg">
              <td width="126" height="22" bgcolor="#99CCFF"><strong>所属大类：</strong></td>
              <td width="218" class="td_southidc"><select name="BigClassName">
                  <%
	dim rsBigClass
	set rsBigClass=server.CreateObject("adodb.recordset")
	rsBigClass.open "Select * From BigClass_down",conn,1,1
	if rsBigClass.bof and rsBigClass.bof then
		response.write "<option>请先添加下载大类</option>"
	else
		do while not rsBigClass.eof
			if rsBigClass("BigClassName")=BigClassName then
				response.write "<option value='"& rsBigClass("BigClassName") & "' selected>" & rsBigClass("BigClassName") & "</option>"
			else
				response.write "<option value='"& rsBigClass("BigClassName") & "'>" & rsBigClass("BigClassName") & "</option>"
			end if
			rsBigClass.movenext
		loop
	end if
	rsBigClass.close
	set rsBigClass=nothing
	%>
                </select>
              </td>
            </tr>
            <tr class="tdbg">
              <td width="126" height="22" bgcolor="#99CCFF"><strong>小类名称：</strong></td>
              <td class="td_southidc"><input name="SmallClassName" type="text" size="20" maxlength="30">
              </td>
            </tr>
            <tr class="tr_southidc">
              <td height="22" align="center">&nbsp;</td>
              <td height="22" align="center"><div align="left">
                  <input name="Action" type="hidden" id="Action3" value="Add">
                  <input name="Add" type="submit" value=" 添 加 ">
              </div></td>
            </tr>
          </table>
        </form></td>
  </tr>
</table>
<br>
<%
end if
%>
