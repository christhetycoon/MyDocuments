<!--#include file="syscode.asp"-->
<%
ShowSmallClassType=ShowSmallClassType_Article
dim ID
ID=trim(request("ID"))
if Id="" then
	response.Redirect("Download.asp")
end if

sql="select * from Download where ID=" & ID & ""
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if rs.bof and rs.eof then
	response.write"<SCRIPT language=JavaScript>alert('找不到此产品！');"
  response.write"javascript:history.go(-1)</SCRIPT>"
else	
	rs("Hits")=rs("Hits")+1
	rs.update
	if rs("hits")>=HitsOfHot then
		rs("Hot")=True
		rs.update
	end if
	BigClassName=rs("BigClassName")
	SmallClassName=rs("SmallClassName")
%>
<%if not(rsBigClass.bof and rsBigClass.eof) and ShowSmallClassType="Menu" then response.write " onmousemove='HideMenu()'"%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">下载列表</td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowSmallClass_Down_Tree() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">下 
                        载 中 心</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <TR> 
                      <TD width="441"> 
                        <%
response.write "|&nbsp;<a href='Download.asp?BigClassName=" & rs("BigClassName") & "'>" & rs("BigClassName") & "</a>&nbsp;&gt;&gt;&nbsp;"
if rs("SmallClassName") & ""<>"" then
	response.write "<a href='Download.asp?BigClassName=" & rs("BigClassName")&"&SmallClassName=" & rs("SmallClassName") & "'>" & rs("SmallClassName") & "</a>&nbsp;&gt;&gt;&nbsp;"
end if
response.write rs("Title")
%>
                  </TD>
                      <TD width="109">&nbsp;</TD>
                    </TR>
                <TR> 
                      <TD colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                </TR>
                <TR> 
                      <TD colspan="3"> 
                        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><%=rs("Content")%></td>
                          </tr>
                        </table>
                        
                      </TD>
                </TR>
                <TR> 
                      <TD colspan="3" background=img/naBialym.gif><IMG height=1 src="img/1x1_pix.gif" 
              width=10></TD>
                </TR>
                <TR> 
                      <TD>
<div align="right">下载次数：<%=rs("Hits")%>&nbsp; 更新时间：<%= rs("Infotime")%>&nbsp;【<a href='javascript:history.back()'>返回</a>】</div></TD>
                      <TD>
<div align="center"><a href="<%=rs("DownloadUrl")%>"><img src="Img/download.gif" width="80" height="80" border="0"></a></div></TD>
                </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
<%
end if
rs.close
set rs=nothing
call CloseConn()
%>