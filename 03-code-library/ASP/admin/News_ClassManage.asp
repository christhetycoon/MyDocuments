<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
dim sql,rsBigClass,rsSmallClass,ErrMsg
set rsBigClass=server.CreateObject("adodb.recordset")
rsBigClass.open "Select * From BigClass_New",conn,1,3
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
function checkSmall()
{
  if (document.form2.BigClassName.value=="")
  {
    alert("������Ӵ������ƣ�");
	document.form1.BigClassName.focus();
	return false;
  }

  if (document.form2.SmallClassName.value=="")
  {
    alert("С�����Ʋ���Ϊ�գ�");
	document.form2.SmallClassName.focus();
	return false;
  }
}
function ConfirmDelBig()
{
   if(confirm("ȷ��Ҫɾ���˴�����ɾ���˴���ͬʱ��ɾ����������С��͸����µ��������ţ����Ҳ��ָܻ���"))
     return true;
   else
     return false;
	 
}

function ConfirmDelSmall()
{
   if(confirm("ȷ��Ҫɾ����С����ɾ����С��ͬʱ��ɾ�������µ��������ţ����Ҳ��ָܻ���"))
     return true;
   else
     return false;
	 
}
</script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><p><br>
</p>
      <table width="560" border="0">
        <tr>
          <td><font color="#000000">����ѡ�</font><font color="#FF0000"><a href="News_ClassAddBig.asp"><strong>������Ŵ���</strong></a></font></td>
        </tr>
      </table>
      <table width="560" border="0" cellpadding="2" cellspacing="1" bgcolor="#000000" class="table_southidc">
        <tr bgcolor="#A4B6D7" class="back_southidc">
          <td height="30" colspan="2" align="center" bgcolor="#A4B6D7"><strong>�� �� �� �� �� ��</strong></td>
        </tr>
        <tr bgcolor="#99CCFF">
          <td width="50%" height="25" align="center"><strong>��Ŀ����</strong></td>
          <td height="25" align="center"><strong>����ѡ��</strong></td>
        </tr>
        <%
	do while not rsBigClass.eof
%>
        <tr bgcolor="#F2F8FF" class="tdbg">
          <td width="50%" height="22"><img src="../Images/tree_folder4.gif" width="15" height="15"><%=rsBigClass("BigClassName")%></td>
          <td align="right" style="padding-right:10"><a href="News_ClassAddSmall.asp?BigClassName=<%=rsBigClass("BigClassName")%>"><font color="#000000">��Ӷ�������</font></a> | <a href="News_ClassModifyBig.asp?BigClassID=<%=rsBigClass("BigClassID")%>">�޸�</a> | <a href="News_ClassDelBig.asp?BigClassName=<%=rsBigClass("BigClassName")%>" onClick="return ConfirmDelBig();">ɾ��</a></td>
        </tr>
        <%
	  set rsSmallClass=server.CreateObject("adodb.recordset")
	  rsSmallClass.open "Select * From SmallClass_New Where BigClassName='" & rsBigClass("BigClassName") & "'",conn,1,1
	  if not(rsSmallClass.bof and rsSmallClass.eof) then
		do while not rsSmallClass.eof
	%>
        <tr bgcolor="#E3E3E3" class="tdbg">
          <td width="50%" height="22">&nbsp;&nbsp;<img src="../Images/tree_folder3.gif" width="15" height="15"><%=rsSmallClass("SmallClassName")%></td>
          <td align="right" style="padding-right:10"><a href="News_ClassModifySmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>">�޸�</a> | <a href="News_ClassDelSmall.asp?SmallClassID=<%=rsSmallClass("SmallClassID")%>&SmallClassName=<%=rsSmallClass("SmallClassName")%>" onClick="return ConfirmDelSmall();">ɾ��</a></td>
        </tr>
        <%
			rsSmallClass.movenext
		loop
	  end if
	  rsSmallClass.close
	  set rsSmallClass=nothing	
	  rsBigClass.movenext
	loop
%>
      </table>
      <p>&nbsp; </p>
      <p>
        <%
rsBigClass.close
set rsBigClass=nothing
%> 
      </p></td>
  </tr>
</table>