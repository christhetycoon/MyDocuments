<%@ LANGUAGE="VBScript" %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="Inc/articlechar.inc"-->
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"> <br> <br> <table width="560" border="0" cellpadding="2" cellspacing="1" class="table_southidc" >
        <tr> 
          <td class="back_southidc" height="28"> 
            <div align="center"><strong>应聘管理 <br>
              </strong></div></td>
        </tr>
        <tr> 
          <td bgcolor="#FFFFFF"><div align="center"> 
<% 
const MaxPerPage=5 '分页显示的纪录个数 
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
sql="select * from jobbook order by id desc" 
rs.open sql,conn,1,1 
 
if rs.eof and rs.bof then 
response.write "<p align='center'>还没有任何应聘信息!</p>" 
else 
totalPut=rs.recordcount 
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
              <table class="table_southidc" width="560" border="0" cellspacing="1" cellpadding="2">
                <tr> 
                  <td width="17%" height="25" bgcolor="#A4B6D7" class="tr_southidc"> 
                  <div align="center">应聘岗位</div></td>
                  <td bgcolor="#A4B6D7" class="tr_southidc">&nbsp;&nbsp;<b><%=rs("jobname")%></b> &nbsp; </td>
                  <td bgcolor="#A4B6D7" class="tr_southidc"><div align="center"><font color="#FF0000">应聘日期</font></div></td>
                  <td bgcolor="#A4B6D7" class="tr_southidc"><font color="#FF0000"><%=rs("time")%></font></td>
                </tr>
                <%if rs("email")<>"" then%>
                <tr> 
                  <td height="10" bgcolor="#ECF5FF"> 
                    <div align="center">姓 名</div></td>
                  <td width="34%" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("mane")%></td>
                  <td width="13%" bgcolor="#ECF5FF"> 
                    <div align="center">性 别</div></td>
                  <td width="36%" bgcolor="#ECF5FF"><%=rs("sex")%></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">出生日期</div></td>
                  <td bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("birthday")%></td>
                  <td bgcolor="#ECF5FF"> 
                    <div align="center">婚姻状况</div></td>
                  <td bgcolor="#ECF5FF"><%=rs("marry")%></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">毕业院校</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("school")%></td>
                </tr>
                <tr>
                  <td height="22" bgcolor="#ECF5FF"><div align="center">专 业</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("specialty")%></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">学 历</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("studydegree")%></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">毕业时间</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("gradyear")%></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">电 话</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("telephone")%></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">E-mail</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<a href="Sendmail.asp?email=<%=rs("email")%>"><%=rs("email")%></a></td>
                </tr>
                <tr> 
                  <td height="22" bgcolor="#ECF5FF"> 
                    <div align="center">联系地址</div></td>
                  <td colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("address")%></td>
                </tr>
                <%end if%>
                <tr> 
                  <td height="25" bgcolor="#ECF5FF">
<div align="center">水平与能力</div></td>
                  <td height="25" colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("ability")%></td>
                </tr>
                <tr> 
                  <td height="25" bgcolor="#ECF5FF"> 
                    <div align="center">个人简历</div></td>
                  <td height="25" colspan="3" bgcolor="#ECF5FF">&nbsp;&nbsp;<%=rs("resumes")%></td>
                </tr>
                <tr>
                  <td height="25" colspan="2" align="center" bgcolor="#e3e3e3"><a href="Deljobbook.asp?id=<%=rs("ID")%>">删除</a>&nbsp;</td>
                  <td height="25" colspan="2" align="center" bgcolor="#e3e3e3"><a href="mailto:<%=rs("email")%>">发信</a></td>
                </tr>
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
response.write "<p align='left'>&gt;&gt; 鎷涜仒鍒嗛〉 " 
for k=1 to n 
if k=currentPage then 
response.write "[<b>"+Cstr(k)+"</b>] " 
else 
response.write "[<b>"+"<a href='Manage_JobBook.asp?page="+cstr(k)+"'>"+Cstr(k)+"</a></b>] " 
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