<%@language=vbscript codepage=936 %>
<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim Action,BigClassName,rs,FoundErr,ErrMsg
Action=trim(Request("Action"))
BigClassName=trim(request("BigClassName"))
if Action="Add" then
	if BigClassName="" then
		FoundErr=True
		ErrMsg=ErrMsg & "<br><li>��Ʒ����������Ϊ�գ�</li>"
	end if
	if FoundErr<>True then
		Set rs=Server.CreateObject("Adodb.RecordSet")
		rs.open "Select * From BigClass Where BigClassName='" & BigClassName & "'",conn,1,3
		if not (rs.bof and rs.EOF) then
			FoundErr=True
			ErrMsg=ErrMsg & "<br><li>��Ʒ���ࡰ" & BigClassName & "���Ѿ����ڣ�</li>"
		else
    	 	rs.addnew
     		rs("BigClassName")=BigClassName			
    	 	rs.update
     		rs.Close
	     	set rs=Nothing
    	 	call CloseConn()
			Response.Redirect "ClassManage.asp"  
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
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <br>
    <br> 
      <br>
      <form name="form1" method="post" action="ClassAddBig.asp" onSubmit="return checkBig()">
        <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
          <tr bgcolor="#A4B6D7" class="back_southidc"> 
            <td height="25" colspan="2" align="center"><strong>��Ӳ�Ʒ����</strong></td>
          </tr>
          <tr bgcolor="#E3E3E3" class="tdbg"> 
            <td width="126" height="22" align="right" bgcolor="#99CCFF"> <div align="right"><strong>�������ƣ�</strong></div></td>
            <td width="254" bgcolor="#ECF5FF" class="td_southidc"> <input name="BigClassName" type="text" size="30" maxlength="50">            </td>
          </tr>
          
          <tr bgcolor="#C0C0C0" class="tdbg"> 
            <td height="30" align="center" bgcolor="#99CCFF" class="tr_southidc">&nbsp; </td>
            <td height="30" align="center" bgcolor="#ECF5FF" class="tr_southidc"> <div align="left"> 
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
call CloseConn()
%>