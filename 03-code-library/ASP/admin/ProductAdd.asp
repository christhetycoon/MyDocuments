<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="sql.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from SmallClass order by SmallClassID asc"
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

function AddItem(strFileName){
  document.myform.IncludePic.checked=true;
  document.myform.DefaultPicUrl.value=strFileName;
  document.myform.DefaultPicList.options[document.myform.DefaultPicList.length]=new Option(strFileName,strFileName);
  document.myform.DefaultPicList.selectedIndex+=1;
  if(document.myform.UploadFiles.value==''){
	document.myform.UploadFiles.value=strFileName;
  }
  else{
    document.myform.UploadFiles.value=document.myform.UploadFiles.value+"|"+strFileName;
  }
}

function CheckForm()
{
  if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  else
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 

  if (document.myform.Title.value=="")
  {
    alert("��Ʒ���Ʋ���Ϊ�գ�");
	document.myform.Title.focus();
	return false;
  }
  if (document.myform.Product_Id.value=="")
  {
    alert("��Ʒ��Ų���Ϊ�գ�");
	document.myform.Key.focus();
	return false;
  }
  
  if (document.myform.Content.value=="")
  {
    alert("��Ʒ���ݲ���Ϊ�գ�");
	editor.HtmlEdit.focus();
	return false;
  }
  return true;  
}

</script>
<!-- #include file="Inc/Head.asp" -->

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <b><br>
      </b>
<form method="POST" name="myform" onSubmit="return CheckForm();" action="ProductSave.asp?action=add" target="_self">
        <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" class="border">
          <tr align="center"> 
            <td class="tdbg"> <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
                <tr> 
                  <td class="back_southidc" height="22" colspan="2" align="right" bgcolor="#A4B6D7"><div align="center"><b>�� 
                      �� �� Ʒ</b> </div></td>
                </tr>
                <tr> 
                  <td width="159" height="22" align="right" bgcolor="#E3E3E3">�������</td>
                  <td width="450" bgcolor="#E3E3E3"> <strong> 
                    <%
        sql = "select * from BigClass"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "���������Ŀ��"
		else
		%>
                    <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
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
                    </select>
                    <select name="SmallClassName">
                      <option value="" selected>��ָ��С��</option>
                      <%
			sql="select * from SmallClass where BigClassName='" & selclass & "'"
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
                    </select>
                    </strong></td>
                </tr>
                <tr> 
                  <td width="159" height="22" align="right" bgcolor="#E3E3E3">��Ʒ��ţ�</td>
                  <td bgcolor="#E3E3E3"> <strong> 
                    <input name="Product_Id" type="text"
           id="Product_Id" value="<%=iddata%>" size="10" maxlength="10">
                    </strong><font color="#FF0000">*��Ʒ��Ų�������ͬ�����㲻��ȷ�����ظ�������Ķ�����</font></td>
                </tr>
                <tr> 
                  <td width="159" height="21" align="right" bgcolor="#E3E3E3">��Ʒ���ƣ�</td>
                  <td bgcolor="#E3E3E3"> <strong> 
                    <input name="Title" type="text"
           id="Title2" size="50" maxlength="80">
                    </strong><font color="#FF0000">*</font></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#E3E3E3">��Ʒ�ۼۣ�</td>
                  <td bgcolor="#E3E3E3"><strong> 
                    <input name="Price" type="text"
           id="Price" size="10" maxlength="80">
                    </strong></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#E3E3E3">���</td>
                  <td bgcolor="#E3E3E3"><input name="Spec" type="text"
           id="Title" size="20" maxlength="80"></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#E3E3E3">��λ��</td>
                  <td bgcolor="#E3E3E3"><input name="Unit" type="text"
           id="spec" size="20" maxlength="80"></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#E3E3E3">��ע��</td>
                  <td bgcolor="#E3E3E3"><input name="Memo" type="text"
           id="unit" size="50" maxlength="80"></td>
                </tr>
                <tr> 
                  <td height="22" colspan="2" align="center" valign="middle" bgcolor="#A4B6D7" class="back_southidc">��Ʒ˵���� </td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td colspan="2" align="center" valign="middle">
				  <textarea name="Content" style="display:none"></textarea>
				  <iframe ID="editor" src="../editor.asp" frameborder=1 scrolling=no width="620" height="405"></iframe></td>
                </tr>
                <tr> 
                  <td align="right" bgcolor="#E3E3E3">��ҳͼƬ��                    </td>
                  <td bgcolor="#E3E3E3"> 
                  <input name="IncludePic" type="hidden" id="IncludePic" value="yes">
                  <input name="DefaultPicUrl" type="hidden" id="DefaultPicUrl" value="img/nopic.gif">
                  <select name="DefaultPicList" id="select" onChange="DefaultPicUrl.value=this.value;">
                    <option selected>��ָ����ҳͼƬ</option>
                  </select>
                  <input name="UploadFiles" type="hidden" id="UploadFiles"></td>
                </tr>
                
                <tr> 
                  <td width="159" height="22" align="right" bgcolor="#E3E3E3">��ͨ����ˣ�</td>
                  <td bgcolor="#E3E3E3"> <input name="Passed" type="checkbox" id="Passed2" value="yes" checked>
                    ��<font color="#0000FF">��ֱ�ӷ�����</font></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#E3E3E3">��ҳ��ʾ��</td>
                  <td bgcolor="#E3E3E3"><input name="Elite" type="checkbox" id="Passed" value="yes">
                    ��<font color="#0000FF">������ҳ��Ʒ�б�����ʾ��</font></td>
                </tr>
                <tr>
                  <td height="22" align="right" bgcolor="#E3E3E3">��ҳ��Ʒ��ʾ��</td>
                  <td bgcolor="#E3E3E3"><input name="Newproduct" type="checkbox" id="Newproduct" value="yes" checked>
                    ��<font color="#0000FF">������ҳ��Ʒչʾ����ʾ��</font></td>
                </tr>
                <tr> 
                  <td width="159" height="22" align="right" bgcolor="#E3E3E3">¼��ʱ�䣺</td>
                  <td bgcolor="#E3E3E3"> <input name="UpdateTime" type="text" id="UpdateTime" value="<%=now()%>" maxlength="50">
                    ��ǰʱ��Ϊ��<%=now()%> ע�ⲻҪ�ı��ʽ��</td>
                </tr>
              </table></td>
          </tr>
        </table>
        <div align="center">
          <p> 
            <input
  name="Add" type="submit"  id="Add" value=" �� �� " onClick="document.myform.action='ProductSave.asp?action=add';document.myform.target='_self';">
            &nbsp; </p>
        </div>
    </form></td>
  </tr>
</table>