<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim ID,rs_about,FoundErr,ErrMsg
dim sql
dim count
ID=trim(request("ID"))

sql="select * from AboutUs where ID=" & ID & ""
Set rs_about= Server.CreateObject("ADODB.Recordset")
rs_about.open sql,conn,1,1
%>
<script language = "JavaScript">
   
function AddItem(strFileName){
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
	return true;
}
</script>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top">
      <table  width="620" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <form method="POST" name="myform" onSubmit="return CheckForm();" action="about_save.asp" target="_self">
          <tr align="center"> 
            <td class="back_southidc" height="30">
             <b>
			  <%  
				  select case ID
				   case "1"
				    response.Write("��ҵ���")
				   case "2"
				    response.Write("��ҵ�Ļ�")
				   case "3"
				    response.Write("�ɳ�����")
				   case "4"
				    response.Write("��֯����")
				   case "5"
				    response.Write("��ϵ����")
				   case "6"
				    response.Write("�����г�")
				   case "7"
				    response.Write("�����г�")
				   case "8"
				    response.Write("�˲Ų���")
				   case else
				  end select
				  %>
			  </b>			</td>
          </tr>
          
          <tr bgcolor="#ECF5FF"> 
            <td align="center" valign="top" bgcolor="#E3E3E3">
			<textarea name="Content" style="display:none"><%=rs_about("Content")%></textarea> 
            <iframe ID="editor" src="../editor.asp?Action=about&ID=<%=ID%>" frameborder=1 scrolling=no width="620" height="405"></iframe></td>
          </tr>
          
          <tr align="center" bgcolor="#ECF5FF"> 
		   <input type="hidden" name="Id" value="<%=Id%>">
            <td height="35" bgcolor="#E3E3E3"> <input type="submit" name="Submit" value="�ύ" class="input">          
              �� 
              <input type="reset" name="Submit" value="����" class="input"> </td>
          </tr>
        </form>
      </table>
  </td>
  </tr>
</table>
<%
set rs_about=nothing
call CloseConn()
%>