<!--#include file="Inc/syscode.asp"-->
<!--#include file="inc/Skin_css.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from job order by id desc"
rs.open sqltext,conn,1,1

dim MaPerPage
MaPerPage=4

dim text,checkpage
text="0123456789"
Rs.PageSize=MaPerPage
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
<!-- #include file="Head.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�˲���Ƹ</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="Job.asp">�� �� �� Ƹ</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Jobs.asp">�� �� �� 
                    ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td  valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        �� �� Ƹ</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
if not rs.eof then
i=0
do while not rs.eof
%>
            <TR> 
              <TD 
                  height=1><br> 
                <table width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
                          <tr> 
                            <td width="24%" bgcolor="#CDE0F3"> 
                              <div align="center">��Ƹ����</div></td>
                    <td width="76%" bgcolor="#F8FCF8"><%=rs("Duix")%></td>
                  </tr>
                  <tr> 
                            <td bgcolor="#CDE0F3"> 
                              <div align="center">��Ƹ����</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("Rens")%></td>
                  </tr>
                  <tr> 
                            <td bgcolor="#CDE0F3"> 
                              <div align="center">�����ص�</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("did")%></td>
                  </tr>
                  <tr> 
                            <td bgcolor="#CDE0F3"> 
                              <div align="center">���ʴ���</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("daiy")%></td>
                  </tr>
                  <tr> 
                            <td bgcolor="#CDE0F3"> 
                              <div align="center">����ʱ��</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("time")%></td>
                  </tr>
                  <tr> 
                            <td bgcolor="#CDE0F3"> 
                              <div align="center">��Ч����</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("Qix")%></td>
                  </tr>
                  <tr> 
                            <td height="22" bgcolor="#CDE0F3"> 
                              <div align="center">��ƸҪ��</div></td>
                    <td bgcolor="#F8FCF8"><%=rs("yaoq")%></td>
                  </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td height="22" colspan="2"><div align="right"><a href="AcceptJob.asp?job=<%=rs("Duix")%>">ӦƸ�˸�λ</a> 
                      </div></td>
                  </tr>
                </table></TD>
            </TR>
            <% 
i=i+1 
if i >= MaPerpage then exit do 
rs.movenext 
loop 
end if 
%>
                  </table> </td>
              </tr>
			  <tr>
                <td height="15"></td>
              </tr>
			   <TR> 
              <TD 
                  height=25 bgcolor="#D8D8D8"> &nbsp; <%
Response.write "<strong><font color='#000000'>-> ȫ��-</font>"
Response.write "��</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>����Ƹ��Ϣ</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>��</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='Job.asp?&page="+cstr(1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='Job.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>��һҳ </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='Job.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font>"
Response.write "<a href='Job.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>βҳ</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>��һҳ</font></strong>&nbsp;&nbsp;"
End if
%> <%
End sub
rs.close
%> </TD>
            </TR>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
