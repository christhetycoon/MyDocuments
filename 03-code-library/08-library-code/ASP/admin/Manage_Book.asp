<%@ LANGUAGE="VBScript" %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="Inc/articlechar.inc"-->
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> 
      <table width="560" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#CCCCCC" class="table_southidc" >
        <tr> 
          <td height="28" class="back_southidc"> 
            <div align="center"><strong>���Թ��� <br>
              </strong></div></td>
        </tr>
        <tr class="td_southidc"> 
          <td> 
<div align="center"> 
<% 
const MaxPerPage=5 '��ҳ��ʾ�ļ�¼���� 
dim sql 
dim rs 
dim totalPut 
dim CurrentPage 
dim TotalPages 
dim i,j 
 
 
if not isempty(request("page")) then 
  currentPage=cint(request("page")) 
else 
  currentPage=1 
end if 
set rs=server.createobject("adodb.recordset") 
sql="select * from book order by id desc" 
rs.open sql,conn,1,1 
 
if rs.eof and rs.bof then 
  response.write "<p align='center'>��û���κ�����!</p>" 
else 
  totalPut=rs.recordcount  
if currentpage<1 then 
  currentpage=1 
end if 
if (currentpage-1)*MaxPerPage>totalput then 
  if (totalPut mod MaxPerPage)=0 then 
   currentpage= totalPut \ MaxPerPage 
  else 
   currentpage= totalPut \ MaxPerPage + 1 
  end if 
end if 
if currentPage=1 then 
  showpages 
  showContent 
  showpages 
else 
 if (currentPage-1)*MaxPerPage<totalPut then 
  rs.move (currentPage-1)*MaxPerPage 
  dim bookmark 
  bookmark=rs.bookmark 
  showpages 
  showContent 
  showpages 
 else 
  currentPage=1 
  showContent 
 end if 
end if 
rs.close 
end if 
set rs=nothing 
conn.close 
set conn=nothing 


sub showContent 
dim i 
i=0 
do while not (rs.eof or err) %>
              <table  width="560" border="0" cellpadding="2" cellspacing="1" bgcolor="#000000" class="table_southidc" >
              <tr bgcolor="#99CCFF"> 
                  <td height="25"> 
                  <div align="center">�� ��</div></td>
                  <td height="25"><%=rs("title")%>&nbsp;&nbsp;[<%=rs("time")%>]</td>
                </tr>
				
				
				
				<tr bgcolor="#99CCFF"> 
                  <td width="18%" height="25" bgcolor="#E3E3E3"> 
                    <div align="center"> 
                      <%if rs("name")="����Ա"then%>
                      ������Ա���桻 
                      <%else%>
                      �û��� 
                      <%end if%>
                  </div></td>
                  <td width="82%" bgcolor="#99CCFF" class="td_southidc"><%=rs("name")%> &nbsp; <a href="Delbook.asp?id=<%=rs("ID")%>">ɾ��</a>
                    <a href="Manage_Rebook.asp?id=<%=rs("id")%>"> 
                    <%if rs("name")<>"����Ա" then%>
                    <%if rs("name")<>"δע���û�" then 
response.write "�ظ�" 
end if 
%>
</a> <%if rs("name")="δע���û�" then 
response.write "û��ע��Ϊ��Աͨ��E-amil�ظ���" 
end if%> <%end if%> </td>
                </tr>
             
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">�� ��</div></td>
                  <td height="25" class="td_southidc"><%=rs("content")%></td>
                </tr>
				
				
				
				<%if rs("email")<>"" then%>
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">��˾����</div></td>
                  <td class="td_southidc"><%=rs("CompanyName")%></td>
                </tr>
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">��ϵ��</div></td>
                  <td class="td_southidc"><%=rs("Receiver")%></td>
                </tr>
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">��ϵ�绰</div></td>
                  <td class="td_southidc"><%=rs("Phone")%></td>
                </tr>
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">��ϵ����</div></td>
                  <td class="td_southidc"><%=rs("Fax")%></td>
                </tr>
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">E-mail</div></td>
                  <td class="td_southidc"><a href="AdminMaillist.asp?email=<%=rs("email")%>"><%=rs("email")%></a></td>
                </tr>
                <%end if%>
            
                <%if rs("rebook")<>""then%>
                <tr bgcolor="#ECF5FF"> 
                  <td height="25" bgcolor="#E3E3E3"> 
                  <div align="center">�ظ�����</div></td>
                  <td height="25" class="td_southidc"><%=rs("rebook")%></td>
                </tr>
                <%end if%>
              </table>
            </div></td>
        </tr>
      </table>
      <br> <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><div align="center">
              <% i=i+1 
 if i>=MaxPerPage then exit do 
 rs.movenext 
loop 
end sub 
sub showpages() 
 dim n 
 if (totalPut mod MaxPerPage)=0 then 
   n= totalPut \ MaxPerPage 
 else 
   n= totalPut \ MaxPerPage + 1 
 end if 
 if n=1 then 
  exit sub 
 end if 
 dim k 
 response.write "<p align='left'>&gt;&gt; ���Է�ҳ " 
 for k=1 to n 
 if k=currentPage then 
   response.write "[<b>"+Cstr(k)+"</b>] " 
 else 
   response.write "[<b>"+"<a href='Manage_Book.asp?page="+cstr(k)+"'>"+Cstr(k)+"</a></b>] " 
 end if 
 next 
end sub 
%>
            </div></td>
        </tr>
      </table>
      <br> <br> </td>
  </tr>
</table>