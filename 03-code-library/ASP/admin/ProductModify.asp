<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim ID,rsArticle,FoundErr,ErrMsg
ID=trim(request("ID"))
FoundErr=False
if ID="" then 
	response.Redirect("ProductManage.asp")
end if
sql="select * from Product where ID=" & ID & ""
Set rsArticle= Server.CreateObject("ADODB.Recordset")
rsArticle.open sql,conn,1,1
if FoundErr=True then
	call WriteErrMsg()
else
%>
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
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br>
      <b> </b>
<form method="POST" name="myform" onSubmit="return CheckForm();" action="ProductSave.asp?action=Modify">
        <table width="620" border="0" align="center" cellpadding="2" cellspacing="1" class="table_southidc">
          <tr> 
            <td class="back_southidc" height="22" colspan="2" align="right" bgcolor="#C0C0C0"><div align="center"><b>�� �� �� Ʒ</b> </div></td>
          </tr>
          <tr> 
            <td width="152" height="22" align="right" bgcolor="#E3E3E3">������Ŀ��</td>
            <td width="462" bgcolor="#E3E3E3"> <%
	if session("purview")=3 or session("purview")=4 then
		response.write rsArticle("BigClassName") & "<input name='BigClassName' type='hidden' value='" & rsArticle("BigClassName") & "'>&gt;&gt;"
	else		
        sql = "select * from BigClass"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "���������Ŀ��"
		else
		%> <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
                <%
		    do while not rs.eof
			%>
                <option <% if rs("BigClassName")=rsArticle("BigClassName") then response.Write("selected") end if%> value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
              </select> <%
	end if
	if session("purview")=4 then
		response.write rsArticle("SmallClassName") & "<input name='SmallClassName' type='hidden' value='" & rsArticle("SmallClassName") & "'>"
	else
	%> <select name="SmallClassName">
                <option value="" <%if rsArticle("SmallClassName")="" then response.write "selected"%>>��ָ��С��</option>
                <%
			sql="select * from SmallClass where BigClassName='" & rsArticle("BigClassName") & "'"
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
				do while not rs.eof%>
                <option <% if rs("SmallClassName")=rsArticle("SmallClassName") then response.Write("selected") end if%> value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
              </select> <%
	end if
	%> </td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��Ʒ��ţ�</td>
            <td bgcolor="#E3E3E3"> <input name="Product_Id" type="text"
           id="Product_Id" value="<%=rsArticle("Product_Id")%>" size="9" maxlength="9">
            <font color="#FF0000">*��Ʒ��Ų�������ͬ�����㲻��ȷ�����ظ�������Ķ�����</font></td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��Ʒ���ƣ�</td>
            <td bgcolor="#E3E3E3"> <input name="Title" type="text"
           id="Title" value="<%=rsArticle("Title")%>" size="50" maxlength="80"> 
              <font color="#FF0000">*</font></td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��Ʒ�ۼۣ�</td>
            <td bgcolor="#E3E3E3"><input name="Price" type="text"
           id="Price" value="<%=rsArticle("Price")%>" size="10" maxlength="80"></td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">���</td>
            <td bgcolor="#E3E3E3"><input name="Spec" type="text"
           id="Spec" value="<%=rsArticle("Spec")%>" size="20" maxlength="80"></td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��λ��</td>
            <td bgcolor="#E3E3E3"><input name="Unit" type="text"
           id="spec" value="<%=rsArticle("Unit")%>" size="20" maxlength="80"></td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��ע��</td>
            <td bgcolor="#E3E3E3"><input name="Memo" type="text"
           id="unit" value="<%=rsArticle("Memo")%>" size="50" maxlength="80"></td>
          </tr>
          <tr> 
            <td height="22" colspan="2" align="center" valign="middle" bgcolor="#C0C0C0" class="back_southidc">��Ʒ˵���� </td>
          </tr>
          <tr bgcolor="#E3E3E3"> 
            <td colspan="2" align="center" valign="middle"> 
                <textarea name="Content" style="display:none"><%=rsArticle("Content")%></textarea>
                <iframe ID="editor" src="../editor.asp?Action=Modify&ID=<%=ID%>" frameborder=1 scrolling=no width="620" height="405"></iframe>            </td>
          </tr>
          <tr> 
            <td width="152" align="right" bgcolor="#E3E3E3">��ҳͼƬ�� 
              <input name="IncludePic" type="hidden" id="IncludePic" value="yes"></td>
            <td  bgcolor="#E3E3E3"> 
              ��ҳ��ͼƬ,ֱ�Ӵ��ϴ�ͼƬ��ѡ�� 
              <select name="DefaultPicList" id="DefaultPicList" onChange="DefaultPicUrl.value=this.value;">
                <option value=""<% if rsArticle("DefaultPicUrl")="" then response.write "selected" %>>��ָ����ҳͼƬ</option>
                <%
				if rsArticle("UploadFiles")<>"" then
					dim IsOtherUrl
					IsOtherUrl=True
					if instr(rsArticle("UploadFiles"),"|")>1 then
						dim arrUploadFiles,intTemp
						arrUploadFiles=split(rsArticle("UploadFiles"),"|")						
						for intTemp=0 to ubound(arrUploadFiles)
							if rsArticle("DefaultPicUrl")=arrUploadFiles(intTemp) then
								response.write "<option value='" & arrUploadFiles(intTemp) & "' selected>" & arrUploadFiles(intTemp) & "</option>"
								IsOtherUrl=False
							else
								response.write "<option value='" & arrUploadFiles(intTemp) & "'>" & arrUploadFiles(intTemp) & "</option>"
							end if
						next
					else
						if rsArticle("UploadFiles")=rsArticle("DefaultPicUrl") then
							response.write "<option value='" & rsArticle("UploadFiles") & "' selected>" & rsArticle("UploadFiles") & "</option>"
							IsOtherUrl=False
						else
							response.write "<option value='" & rsArticle("UploadFiles") & "'>" & rsArticle("UploadFiles") & "</option>"		
						end if
					end If
					if IsOtherUrl=True then
						response.write "<option value='" & rsArticle("DefaultPicUrl") & "' selected>" & rsArticle("DefaultPicUrl") & "</option>"
					end if
				end if
				 %>
              </select> <input name="UploadFiles" type="hidden" id="UploadFiles" value="<%=rsArticle("UploadFiles")%>">            </td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��ͨ����ˣ�</td>
            <td bgcolor="#E3E3E3"> <input name="Passed" type="checkbox" id="Passed" value="yes" <% if rsArticle("Passed")=true then response.Write("checked") end if%>>
              ��<font color="#0000FF">��ֱ�ӷ�����</font></td>
          </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">��ҳ��ʾ��</td>
            <td bgcolor="#E3E3E3"> <input name="Elite" type="checkbox" id="Elite" value="yes" <% if rsArticle("Elite")=true then response.Write("checked") end if%>>
              ��<font color="#0000FF">������ҳ��Ʒ�б�����ʾ��</font></td>
          </tr>
                <tr>
                  <td height="22" align="right" bgcolor="#E3E3E3">��ҳ��Ʒ��ʾ��</td>
                  <td bgcolor="#E3E3E3"><input name="Newproduct" type="checkbox" id="Newproduct" value="yes" <% if rsArticle("Newproduct")=true then response.Write("checked") end if%>>
                    ��<font color="#0000FF">������ҳ��Ʒչʾ����ʾ��</font></td>
                </tr>
          <tr> 
            <td height="22" align="right" bgcolor="#E3E3E3">¼��ʱ�䣺</td>
            <td bgcolor="#E3E3E3"> <input name="UpdateTime" type="text" id="UpdateTime" value="<%=now()%>" maxlength="50">
              ��ǰʱ��Ϊ��<%=now()%> ע�ⲻҪ�ı��ʽ��</td>
          </tr>
        </table>
        <div align="center"> 
          <p> 
            <input name="ID" type="hidden" id="ID" value="<%=rsArticle("ID")%>">
            <input  name="Save" type="submit"  id="Save" value="�����޸Ľ��">
          </p>
        </div>
    </form></td>
  </tr>
</table>
<%
end if
rsArticle.close
set rsArticle=nothing
call CloseConn()
%>