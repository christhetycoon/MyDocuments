<!--#include file="mysqlfire.asp"-->
<!--#include file="ordersec.asp"-->
<!--#include file="orderconn.asp"-->
<%
'#############################################################
'#              ��ϲ֧��ƽ̨֧���ӿڶ�������ϵͳ
'#                            v2.0
'#                   http://www.168reg.cn
'#
'#  ��Ȩ����: �����к�г����Ƽ���չ���޹�˾
'#
'#  ��ҳ��ַ: http://www.168reg.cn
'#  ����֧��: support@168reg.cn
'#  �� �� QQ: 359465724
'#  ����QQȺ��8246422��7048987
'#
'#############################################################
'# ��֣������:
'# ���˶���ϵͳ���ṩ���װ涨�������ܣ��������ܣ������п�����
'# �������û�ԭ�򣬿��ܵ��¶������ݶ�ʧ���뾭����¼�������鿴������
'# ���˳��򲻵����⹫�����������ۻ���������Ƿ�ת�á�
'# ����Դ˳������κ����ʣ����ڹ��������ԡ�
'#############################################################
%>
<HTML><HEAD><TITLE>�����鿴ϵͳ</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<%
   const MaxPerPage=30
   dim totalPut
   dim CurrentPage
   dim TotalPages
   dim i,j

   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   dim sql
   dim rs
   dim rstype
   if not isEmpty(request("viewtype")) then
	viewtype=request("viewtype")
   else
	viewtype=0
   end if

%>
<body text="#000000" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<DIV align=center><a href="vieworder.asp?viewtype=all">ȫ������</a>��<a href="vieworder.asp?viewtype=undispose">δ������</a>��<a href="vieworder.asp?viewtype=disposed">�Ѵ�����</a>��<a href="logout.asp">�˳�����</a>��
<div align="center"><%
if viewtype="all" or viewtype="" then
	sql="select * from myorder order by id desc"
elseif viewtype="undispose" then
	sql="select * from myorder where disposed=0 order by id desc"
elseif viewtype="disposed" then
	sql="select * from myorder where disposed=1 order by disposedate desc"
else
	sql="select * from myorder order by id desc"
end if
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'> �� û �� �� �� �� ��</p>"
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
           showpage totalput,MaxPerPage,"vieworder.asp"
            showContent
            showpage totalput,MaxPerPage,"vieworder.asp"
       else
          if (currentPage-1)*MaxPerPage<totalPut then
            rs.move  (currentPage-1)*MaxPerPage
            dim bookmark
            bookmark=rs.bookmark
           showpage totalput,MaxPerPage,"vieworder.asp"
            showContent
             showpage totalput,MaxPerPage,"vieworder.asp"
        else
	        currentPage=1
           showpage totalput,MaxPerPage,"vieworder.asp"
           showContent
           showpage totalput,MaxPerPage,"vieworder.asp"
	      end if
	   end if
   rs.close
   end if
	
   set rs=nothing
   conn.close


   sub showContent
       dim i
	   i=0

%>
      <div align="center"><center><table border="1" cellspacing="0" bordercolorlight="#5493AC" bordercolordark="#FFFFFF" cellpadding="0">
        <tr>
          <td align="center" bgcolor="#5493AC" height="20"><font color="#FFFFFF">ID</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">��������</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">������</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">�̻�������</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">�������</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">�Զ����ֶ�1</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">�Զ����ֶ�2</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">֧����ʽ</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">֧��״̬</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">����ʱ��</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">�û�IP</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">�Ƿ��Ѵ���</font></td>
          <td align="center" bgcolor="#5493AC"><font color="#FFFFFF">����ʱ��</font></td>
        </tr>
<%do while not rs.eof%>
        <tr>
          <td height="23" align="center"><%=rs("id")%></td>
          <td align="center"><%=rs("servicename")%></td>
          <td align="center"><%=rs("orderid")%></td>
          <td align="center"><%=rs("billno")%></td>
          <td align="center"><%=rs("price")%>Ԫ</td>
          <td align="center"><%=rs("custom1")%></td>
          <td align="center"><%=rs("custom2")%></td>
          <td align="center"><%=rs("payvia")%></td>
          <td align="center"><%=rs("pstring")%></td>
          <td align="center"><%=rs("orderdate")%></td>
          <td align="center"><%=rs("vip")%></td>
          <td align="center"><%if rs("disposed")<>0 then%><font color="#0000FF">�Ѵ���</font><%else%><a href="orderdispose.asp?id=<%=rs("id")%>&dispose=yes"><font color="#FF0000">��������</font></a><%end if%></td>
          <td align="center"><%=rs("disposedate")%></td>
        </tr>
<% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %>
      </table>
      </center></div><%
   end sub

function showpage(totalnumber,maxperpage,filename)
  dim n
  if totalnumber mod maxperpage=0 then
     n= totalnumber \ maxperpage
  else
     n= totalnumber \ maxperpage+1
  end if
  response.write "<form method=Post action="&filename&"?viewtype="&viewtype&">"
  if CurrentPage<2 then
    response.write "<font color='#000080'>��ҳ ��һҳ</font>&nbsp;"
  else
    response.write "<a href="&filename&"?page=1&viewtype="&viewtype&">��ҳ</a>&nbsp;"
    response.write "<a href="&filename&"?page="&CurrentPage-1&"&viewtype="&viewtype&">��һҳ</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "<font color='#000080'>��һҳ βҳ</font>"
  else
    response.write "<a href="&filename&"?page="&(CurrentPage+1)&"&viewtype="&viewtype&">"
    response.write "��һҳ</a> <a href="&filename&"?page="&n&"&viewtype="&viewtype&">βҳ</a>"
  end if
   response.write "<font color='#000080'>&nbsp;ҳ�Σ�</font><strong><font color=red>"&CurrentPage&"</font><font color='#000080'>/"&n&"</strong>ҳ</font> "
    response.write "<font color='#000080'>&nbsp;��<b>"&totalnumber&"</b>������ <b>"&maxperpage&"</b>������/ҳ</font> "
   response.write " <font color='#000080'>ת����</font><input type='text' name='page' size=4 maxlength=10 class=smallInput value="&currentpage&" style=""color: #000000"">"
   response.write "<input class=buttonface type='submit'  value='Goto'  name='cndok' style='color: #000000'></span></p></form>"

end function
'end if

%>

    </dd>
    </div></td>
  </tr>
</table>
</BODY></HTML>
