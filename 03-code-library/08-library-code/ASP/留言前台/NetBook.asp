<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<!--#include file="Function.asp"-->
<!--#include file="SouthidcUbb.asp"-->
<!--#include file="Top.asp" -->
<%If Session("UserName")="" Then
response.redirect"Server.asp"
end if%>
<%
UserName=Session("UserName")
set Rst = Server.CreateObject("ADODB.recordset")
sql="select * from [User] where UserName='"&UserName&"'"
rst.open sql,conn,1,1
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">��Ա����</td>
              </tr>
              
              <tr> 
                <td height="20"> <div align="center"><a href="NetBook.asp">վ����������</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserLogout.asp">�˳���Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="
title_right" height="32">�� 
                        Ա �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">            
                    <TR> 
              <TD><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td height="10"></td>
                  </tr>
                </table>
                <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td><div align="center"><strong>&nbsp;&nbsp;<%=Session("UserName")%></strong>������ר��</div></td>
                  </tr>
                  <tr> 
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=Session("UserName")%>������������ר��˽�����Բ��������ڴ˸��������ԣ����ǻᾡ����24Сʱ���ڴ˴������벻Ҫ���ǻ����쿴�ظ�Ŷ��<br>
                            ����</td>
                  </tr>
                </table>
                <form method="post" action="SaveNetBook.asp">                
                  <table width="95%" border="0" align="center" cellpadding="4" cellspacing="1">
                    <tr> 
                      <td width="24%" align="right"></td>
                      <td width="76%"></td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right">�û����ƣ�</td>
                      <td width="76%"><font> 
                        <input type="text" readonly name="Name" maxlength="36" value="<%if Session("UserName")="" then response.write"δע���û�" end if%><%=Session("UserName")%>" style="background-color: #FFFFFF; border-style: solid; border-color: #FFFFFF" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">��˾���ƣ�</td>
                      <td width="76%"><font> 
                        <input type="text" name="CompanyName" size="30" maxlength="36" value="<%=rst("CompanyName")%>" style="font-size: 14px" class="smallInput">
                        </font> </td>
                    </tr>
                    <tr> 
                      <td align="right">��ϵ�ˣ�</td>
                      <td width="76%"><font> 
                        <input type="text" name="Receiver" size="12" maxlength="30" value="<%=rst("Receiver")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">��ϵ�绰��</td>
                      <td width="76%"><font> 
                        <input type="text" name="Phone" size="24" maxlength="36" value="<%=rst("Phone")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">��ϵ���棺</td>
                      <td width="76%"><font> 
                        <input type="text" name="Fax" size="18" maxlength="36" value="<%=rst("Fax")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td align="right">E-mail��</td>
                      <td width="76%"><font> 
                        <input type="text" name="Email" size="18" maxlength="36" value="<%=rst("Email")%>" style="font-size: 14px" class="smallInput">
                        </font></td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right">���Ա��⣺</td>
                      <td width="76%"><input type="text" name="Title" size="22" maxlength="36" style="font-size: 14px; width: 320; height: 19" class="smallInput"></td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right">�������ݣ�</td>
                      <td width="76%"><textarea rows="6" name="Content" cols="50" style="font-size: 14px" class="smallInput"></textarea> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="24%" align="right"></td>
                      <td width="76%"><input type="submit" value="�ύ�������"
name="cmdOk"> &nbsp; <input type="reset" value="��λ" name="cmdReset"> </td>
                    </tr>
                  </table>
                </form>
<%
name=Session("UserName")
set rs=server.createobject("adodb.recordset")
sql="select * from book where name='"&name&"' or name='����Ա' order by id desc"
rs.open sql,conn,1,1

dim MaxPerPage
MaxPerPage=10

'ȡ��ҳ��,���ж�����������Ƿ��������͵����ݣ��粻�ǽ��Ե�һҳ��ʾ
dim text,checkpage
text="0123456789"
Rs.PageSize=MaxPerPage
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
<table width="90%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td width="21%" height="18" bgcolor="#eeeeee"><img src="img/arrow.gif" width="16" height="13"><strong>�����б�</strong></td>
<td width="79%" bgcolor="#eeeeee"> 
<%Response.write "<strong><font color='#000000'>-> ȫ��-</font>"
Response.write "��</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>������</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.write "<strong><font color='#000000'>��</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font></strong>&nbsp;"
If currentpage > 1 Then
response.write "<strong><a href='NetBook.asp?&page="+cstr(1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'> </font></strong>"
Response.write "<strong><a href='NetBook.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font></strong>"
Else
Response.write "<strong><font color='#000000'>��һҳ </font></strong>"
End if
If currentpage < Rs.PageCount Then
Response.write "<strong><a href='NetBook.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>��һҳ</font></a><font color='#ffffff'> </font>"
Response.write "<a href='NetBook.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>βҳ</font></a></strong>&nbsp;&nbsp;"
Else
Response.write ""
Response.write "<strong><font color='#000000'>��һҳ</font></strong>&nbsp;&nbsp;"
End if
%> </td></tr>
<tr><td height="1" colspan="2" bgcolor="#999999"></td></tr>
</table>
<%
If rs.eof and rs.bof then
  response.write ""
  response.end
End if
%> <br> <table width="90%" height="18" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#666666">
                  <tr bgcolor="#99CCFF"> 
                    <td width="56%" height="25" align="center" bgcolor="#CCCCCC"> 
                      <p align="center"><font color="#000000"><b>��������</b></font></p></td>
                    <td width="22%" height="21" align="center" bgcolor="#CCCCCC"><font color="#000000"><b>ʱ��</b></font></td>
                    <td width="22%" height="21" align="center" bgcolor="#CCCCCC"><font color="#000000"><b>�ظ�</b></font></td>
                  </tr>
<%
if not rs.eof then
i=0
do while not rs.eof
%>
                  <tr bgcolor="#99CCFF"> 
                    <td height="22" bgcolor="#FFFFFF"> <%if rs("name")="����Ա"then%>
                              ������Ա���桻 
                              <%end if%> <a href="javascript:winopen('NetBookRe.asp?id=<%=rs("id")%>&amp;name=<%=rs("name")%>')"> 
                      <%=rs("title")%></a></td>
                    <td height="1" bgcolor="#FFFFFF" align="center">&nbsp; <%=rs("time")%></td>
                    <td height="1" bgcolor="#FFFFFF" align="center">&nbsp; <%If rs("rebook")<>"" Then%> <a href="javascript:winopen('NetBookRe.asp?id=<%=rs("id")%>&amp;name=<%=rs("name")%>')">�ظ�</a> 
                      <%else%>
                      �� 
                      <%End If%> &nbsp;</td>
                  </tr>
                  <%
i=i+1
if i >= MaxPerpage then exit do
rs.movenext
loop
end if
%>
<%end sub%>
                </table>
                <br> <br> </TD>
            </TR>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>