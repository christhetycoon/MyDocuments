<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from SmallClass_down order by SmallClassID asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    



function CheckForm()
{
     if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
    else
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 

	if (document.myform.title.value.length == 0) {
		alert("��������û����д.");
		document.myform.title.focus();
		return false;
	}
	if (document.myform.System.value.length == 0) {
		alert("����ϵͳû����д");
		document.myform.System.focus();
		return false;
	}
		if (document.myform.DownloadUrl.value.length == 0) {
		alert("���ص�ַû����д");
		document.myform.DownloadUrl.focus();
		return false;
	}
		
	return true;
}
</script>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><table width="620" border="0" cellpadding="2" cellspacing="1" bgcolor="#E3E3E3" class="table_southidc">
        <form method="POST" name="myform" onSubmit="return CheckForm();" action="Down_Save.asp?action=Add" target="_self">
          <tr> 
            <td height="30" colspan="3" align="center" class="back_southidc" style="font-weight: bold">�� �� �� ��</td>
          </tr>
          <tr> 
            <td width="120" bgcolor="#E3E3E3"><font color="#FF0000">*</font>�������ƣ�</td>
            <td colspan="2" bgcolor="#E3E3E3"> <input name="title" type="text" class="input" size="30"></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#E3E3E3"><font color="#FF0000">*</font>�������</td>
            <td colspan="2" bgcolor="#E3E3E3"> <%		
        sql = "select * from BigClass_down"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "���������Ŀ��"
		else
		%> <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
                <option selected value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                <%
			dim selclass
		    selclass=rs("BigClassName")
        	rs.movenext
		    do while not rs.eof
			%>
                <option value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
              </select> <select name="SmallClassName">
                <option value="" selected>��ָ��С��</option>
                <%
			sql="select * from SmallClass_down where BigClassName='" & selclass & "'"
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
			%>
                <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                <% rs.movenext
				do while not rs.eof%>
                <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
                <%
			ranNum=int(9*rnd)+10
			iddata=month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum
			%>
              </select></td>
          </tr>
          <tr bgcolor="#E3E3E3" class="back_southidc">
            <td height="22" colspan="3" align="center" valign="top" bgcolor="#E3E3E3">����˵��</td>
          </tr>
          <tr> 
            <td colspan="3" align="center" valign="top" bgcolor="#E3E3E3"> <textarea name="Content" style="display:none"></textarea> 
              <iframe ID="editor" src="../editor.asp?DownClass=Down" frameborder=1 scrolling=no width="620" height="405"></iframe></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#E3E3E3"><font color="#FF0000">*</font>����ϵͳ��</td>
            <td colspan="2" bgcolor="#E3E3E3"> <input name="System" type="text"  id="System" value="Win98, Win2000, WinXP" size="30"></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#E3E3E3"><font color="#FF0000">*</font>������ͣ�</td>
            <td colspan="2" bgcolor="#E3E3E3"> <input name="Softclass" type="text"  id="Softclass" value="��Ʒ����" size="30"></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#E3E3E3">��ƷͼƬ��</td>
            <td bgcolor="#E3E3E3"> <input name="PhotoUrl" type="text" id="PhotoUrl" size="30" maxlength="200"></td>
            <td bgcolor="#E3E3E3"> <iframe style="top:2px" ID="UploadFiles" src="../upload_Photo.asp?PhotoUrlID=0" frameborder=0 scrolling=no width="320" height="25"></iframe></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="25" bgcolor="#E3E3E3"><font color="#FF0000">*</font>���ص�ַ��</td>
            <td bgcolor="#E3E3E3"> <input name="DownloadUrl" type="text" id="PhotoUrl2" size="30" maxlength="200"></td>
            <td bgcolor="#E3E3E3"> <iframe style="top:2px" ID="UploadFiles" src="../upload_Photo.asp?PhotoUrlID=1" frameborder=0 scrolling=no width="320" height="25"></iframe></td>
          </tr>
          <tr> 
            <td height="25" bgcolor="#E3E3E3"><font color="#FF0000">*</font>�ļ���С��</td>
            <td colspan="2" bgcolor="#E3E3E3"> <input name="FileSize" type="text" class="input" id="fileSize" size="30">
              K </td>
          </tr>
          <tr> 
            <td height="30" align="center" bgcolor="#E3E3E3"><div align="left">¼��ʱ�䣺</div></td>
            <td height="30" colspan="2" align="center" bgcolor="#E3E3E3"><div align="left"> 
                <input name="Infotime" type="text" id="Infotime" value="<%=now()%>" maxlength="50">
              </div></td>
          </tr>
          <tr> 
            <td height="30" colspan="3" align="center" bgcolor="#E3E3E3"> <input type="submit" name="Submit" value="�ύ" class="input">
              �� 
              <input type="reset" name="Submit2" value="����" class="input"> </td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>