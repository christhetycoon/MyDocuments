<!--#include file="inc/conn.asp" -->
<%
UserName=session("UserName")
Receiver=request.form("Receiver")
Postcode=request.form("Postcode")
Phone=request.form("Phone")
Add=request.form("Add")
Email=request.form("Email")
paytype=request.form("paytype")
Notes=request.form("Notes")
CompanyName=request.form("CompanyName")
Fax=request.form("Fax")


'�жϹ��ﳵ�Ƿ�Ϊ��
ProductList = Session("ProductList")
if productlist<>"" then
sql="select * from Product where Product_Id in ("&productlist&") order by Product_Id"
Set rs = conn.Execute( sql )
else
response.redirect "error.asp?error=007"
response.end
end if
%>

<HTML>
<HEAD>
<TITLE>�����ύԤ��</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Contact" content="www.bingzhi.cn ��֮���� QQ��101563903">
<link href="mt_style.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY>
<table width=100% cellpadding=0 cellspacing=0><tr><td><form name=confirm action="ordersent.asp" method=post><%=name%> <br>&nbsp;&nbsp;���ã�<br>&nbsp;&nbsp;���������Ķ��������û�������� <input type="submit" value="�����ύ����">�����߷��� <input type="button" name="Submit21" onclick="javascript:history.go(-1)" value="�����޸Ķ���"><br><br>&nbsp;&nbsp;���κ������뼰ʱ��������ϵ&nbsp;&nbsp;�绰��<%=adm_tel%>&nbsp;�ʼ���<%=adm_mail%><br><br><br>
<input type=hidden value="ok" name="confirm">
        <table border="0" cellspacing="1" cellpadding="0" align="center" width="520" bgcolor="#000000">
          <tr bgcolor="#FFFFFF"> 
  <td height="25" colspan=4>&nbsp;�ջ�����Ϣ</td></tr>
<tr bgcolor="#FFFFFF"> 
            <td height="25" colspan=4><font color="B0266D"> &nbsp;&nbsp;&nbsp;&nbsp;�ջ�������:<%=Receiver%><br>
              &nbsp;&nbsp;&nbsp;&nbsp;�ջ��˵绰��<%=Phone%><br>
              &nbsp;&nbsp;&nbsp;&nbsp;�ջ������䣺<%=Email%><br>
              &nbsp;&nbsp;&nbsp;&nbsp;�ջ���ַ��<%=Add%><br>             
              &nbsp;&nbsp;&nbsp; ��˾���ƣ�<%=CompanyName%><br>
              &nbsp;&nbsp;&nbsp;&nbsp;��ϵ���棺<%=Fax%><br>
              &nbsp;&nbsp;&nbsp;&nbsp;֧�����ͣ�<%=Paytype%> <br>
              &nbsp;&nbsp;&nbsp;&nbsp;����˺ţ� 
              <%
sqlp="select paytype,paymentmessage from paydefault where paytype='"&paytype&"'"
set rsp=server.createobject("ADODB.Recordset")
rsp.open sqlp,conn,1,1
response.write rsp("paymentmessage")
rsp.close
set rsp=nothing
%>
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;��ע˵����<%=Notes%><br>
              <INPUT TYPE="hidden" name="Receiver" value="<%=Receiver%>">
              <INPUT TYPE="hidden" name="Phone" value="<%=Phone%>">
              <INPUT TYPE="hidden" name="Add" value="<%=Add%>">
              <INPUT TYPE="hidden" name="Email" value="<%=Email%>">
              <INPUT TYPE="hidden" name="Postcode" value="<%=Postcode%>">
              <INPUT TYPE="hidden" name="PayType" value="<%=paytype%>">       
              <INPUT TYPE="hidden" name="Notes" value="<%=Notes%>">
              <INPUT TYPE="hidden" name="CompanyName" value="<%=CompanyName%>">
              <INPUT TYPE="hidden" name="Fax" value="<%=Fax%>">
              </font></td>
    </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="50%" height="25" align="center"> 
      <font color="B0266D">�� Ʒ �� ��</font>
    </td>
    <td width="10%" align="center"> 
      <font color="B0266D">�� ��</font>
    </td>
    <td width="20%" align="center"> 
     <font color="B0266D">�� ��</font>
    </td> 
	<td width="20%" align="center"> 
     <font color="B0266D">�� ��</font>
    </td>
  </tr>
<%
   Sum = 0
   While Not rs.EOF
     Quatity = CInt( Request( "Q_" & rs("Product_Id")) )
     If Quatity <= 0 Then 
        Quatity = CInt( Session(rs("Product_Id")) )
        If Quatity <= 0 Then Quatity = 1
     End If
     Session(rs("Title")) = Quatity
     Sum = Sum + csng(rs("Price")) * Quatity
     Sum=FormatNumber(Sum,2) 
     session("sum")=sum
%> 
  <tr bgcolor="#FFFFFF"> 
    <td width="50%" height="20">&nbsp;<font color="B0266D"><%=rs("Title")%></font></td>
    <td width="10%">&nbsp;<font color="B0266D"><%=Quatity%></font></td>
    <td width="20%">&nbsp;<font color="B0266D"><%=FormatNumber(rs("Price"),2)%></font></td>
	<td width="20%">&nbsp;<font color="B0266D"><%=FormatNumber(csng(rs("Price"))*Quatity,2)%></font></td>
  </tr>
<%
rs.MoveNext
Wend
rs.close
set rs=nothing
%> 
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="25" align="right"> 
      <b><font color="#B0266D">�ܼ۸�=<%=Sum%></font>&nbsp;&nbsp;
    </td>
  </tr>
</table>
</form></table>
</BODY>
</HTML>
<%
set conn=nothing
%>