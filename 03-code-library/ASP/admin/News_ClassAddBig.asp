<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
dim Action,BigClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
BigClassName=trim(request("BigClassName"))
if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>���´���������Ϊ�գ�</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		rs.open "Select * From BigClass_New Where BigClassName='" & BigClassName & "'",conn,1,3
		if not (rs.bof and rs.EOF) then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>���´��ࡰ" & BigClassName & "���Ѿ����ڣ�</li>"
		else
    	 	rs.addnew
     		rs("BigClassName")=BigClassName
    	 	rs.update
     		rs.Close
	     	set rs=Nothing
    	 	call CloseConn()
			Response.Redirect "News_ClassManage.asp"  
		end if
	end if
end if
if FoundErr=True then
	call WriteErrMsg()
else
%>
<script language="JavaScript" type="text/JavaScript">
function checkBig()
{
  if (document.form1.BigClassName.value=="")
  {
    alert("�������Ʋ���Ϊ�գ�");
    document.form1.BigClassName.focus();
    return false;
  }
}
</script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><table width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="25" align="center" valign="top"> <br>
          <br> 
            <form name="form1" method="post" action="News_ClassAddBig.asp" onSubmit="return checkBig()">
              <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
                <tr bgcolor="#A4B6D7" class="back_southidc"> 
                  <td height="25" colspan="2" align="center"><strong>������Ŵ���</strong></td>
                </tr>
                <tr bgcolor="#E3E3E3" class="tdbg"> 
                  <td width="126" height="22" bgcolor="#99CCFF"> <div align="right"><strong>�������ƣ�</strong></div></td>
                  <td width="218" bgcolor="#E3E3E3" class="td_southidc"> <input name="BigClassName" type="text" size="20" maxlength="30"> 
                  </td>
                </tr>
                <tr class="tr_southidc"> 
                  <td height="22" align="center">&nbsp; </td>
                  <td height="22" align="center"> <div align="left"> 
                      <input name="Action" type="hidden" id="Action" value="Add">
                      <input name="Add" type="submit" value=" �� �� ">
                  </div></td>
                </tr>
              </table>
            </form></td>
        </tr>
      </table>
      <%
end if
%> </td>
  </tr>
</table>