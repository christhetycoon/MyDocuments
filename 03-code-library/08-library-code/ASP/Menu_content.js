<!--#include file="Inc/syscode.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left" width="190" height="179" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�û���½ 
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowUserLogin() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;��ҵ��� 
                </td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="About.asp">�� ҵ �� 
                    ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Culture.asp">�� ҵ 
                    �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Structure.asp">�� 
                    ֯ �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="History.asp">�� �� 
                    �� �� </a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Contact.asp">�� ϵ 
                    �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border  width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        ҵ �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <TR> 
                      <TD> 
                        <%
flag="��δ����"
set rs=server.createobject("adodb.recordset")
sqltext="select * from culture Order BY id desc"
rs.open sqltext,conn,1,1
dim PerPage
PerPage=10
'����û������ʱ
If rs.eof and rs.bof then
response.write "<p align='center'><font color='#ff0000'>��û�κ�����</font></p>"
response.end
End if
'ȡ��ҳ��,���ж��û�������Ƿ��������͵����ݣ��粻�ǽ��Ե�һҳ��ʾ
text="0123456789"
Rs.PageSize=PerPage
for i=1 to len(request("page"))
checkpage=instr(1,text,mid(request("page"),i,1))
if checkpage=0 then
exit for
end if
next

If checkpage<>0 then
  If NOT IsEmpty(request("page")) Then
   CurrentPage=Cint(request("page"))
   If CurrentPage < 1 Then CurrentPage = 1 
   If CurrentPage > Rs.PageCount Then CurrentPage = Rs.PageCount 
  Else
   CurrentPage= 1
  End If
   If not Rs.eof Then Rs.AbsolutePage = CurrentPage end if
Else
 CurrentPage=1
End if

call list

'��ʾ���ӵ��ӳ���
Sub list()%> 
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                        <td width="18%" bgcolor="#eeeeee">&nbsp;&nbsp;��ҳ����ҵ�Ļ�</td>
                    <td width="82%" bgcolor="#eeeeee"> <%
Response.write "<strong><font color='#000000'>-> ȫ��-</font>"
Response.write "��</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>������</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>��</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='culture.asp?&page="+cstr(1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='culture.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>��һҳ </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='culture.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font>"
Response.write "<a href='culture.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>βҳ</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>��һҳ</font></strong>&nbsp;&nbsp;"
End if
%> </td>
                  </tr>
                  <tr> 
                    <td colspan="2" bgcolor="#999999"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="3" bgcolor="#FBFEFF">
                  <tr> 
                    <td height="8"></td>
                  </tr>
                  <%
if not rs.eof then
i=1
do while not rs.eof
%>
                  <tr> 
                    <td>&nbsp;&nbsp;<img src="Img/dot.gif" width="7" height="11">&nbsp;<a href="culturenewsInfo.asp?id=<%=rs("id")%>"><%=rs("title")%></a>&nbsp;&nbsp;<font color="#0066CC" face="Arial"><%=rs("time")%></font>&nbsp; <%if rs("time")=date() then%> <strong><font color="#FF0000" face="Arial">New</font></strong> 
                      <%end if%> </td>
                  </tr>
                  <%
i=i+1
if i > Perpage then exit do
rs.movenext
loop
end if
%>
                  <tr> 
                    <td height="8"></td>
                  </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                        <td width="18%" bgcolor="#eeeeee">&nbsp;&nbsp;��ҳ����ҵ�Ļ�</td>
                    <td width="82%" bgcolor="#eeeeee"> <%
Response.write "<strong><font color='#000000'>-> ȫ��-</font>"
Response.write "��</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>������</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>��</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='culture.asp?&page="+cstr(1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='culture.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>��һҳ </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='culture.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font>"
Response.write "<a href='culture.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>βҳ</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>��һҳ</font></strong>&nbsp;&nbsp;"
End if
%> </td>
                  </tr>
                  <tr> 
                    <td colspan="2" bgcolor="#999999"></td>
                  </tr>
                </table>
<%
End sub
rs.close
%> </TD>
            </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
