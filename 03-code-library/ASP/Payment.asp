<!--#include file="inc/conn.asp" -->
<%on error resume next%>
<%
'�ж��Ƿ���Ҫע��
if reg<>"1" then
	'�ж��Ƿ���������������ǣ���Ҫ��½
	if session("UserName")="" then 
		response.redirect "error.asp?error=006"
		response.end
	end if
end if

username=Session("username")
set Rs = Server.CreateObject("ADODB.recordset")
sql="select * from [User] where username='"&username&"'"
rs.open sql,conn,1,1

'�жϹ��ﳵ�Ƿ�Ϊ��
ProductList = Session("ProductList")
if productlist<>"" then
  sql="select * from Product where Product_Id in ("&productlist&") order by     Product_Id"
  Set rs = conn.Execute( sql )
else
  response.redirect "error.asp?error=007"
  response.end
end if
%> 
<html>
<head>
<title>��д������ϸ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Contact" content="www.bingzhi.cn ��֮���� QQ��101563903">
<link href="mt_style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function CheckForm()
{
	if (document.payment.Recname.value.length == 0) {
		alert("�������ջ��˵� ����.");
		document.payment.Recname.focus();
		return false;
	}

	if (document.payment.address.value.length == 0) {
		alert("�������ջ��˵� ��ַ.");
		document.payment.address.focus();
		return false;
	}

    if (document.payment.paytype.value.length == 0) {
		alert("��ѡ������֧����ʽ.");
		document.payment.paytype.focus();
		return false;
	}

	if (document.payment.Recmail.value.length == 0) {
		alert("������˶����ջ��˵�EMAIL.");
		document.payment.Recmail.focus();
		return false;
	}
	if (document.payment.Recmail.value.length > 0 && !document.payment.Recmail.value.match( /^.+@.+$/ ) ) {
	    alert("EMAIL ��������������");
	    document.payment.Recmail.focus();
		return false;
	}
	
	if (document.payment.RecPhone.value.length == 0) {
		alert("���ջ��˵ĵ绰.");
		document.payment.RecPhone.focus();
		return false;
	}

	return true;
}

</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0">
 <br>
<table border="0" cellspacing="1" cellpadding="0" align="center" width="520" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" height="25">&nbsp;&nbsp;<font color=B0266D><%=session("UserName")%> ��ѡ������Ʒ�嵥���£�</font> 
    </td>
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
    Session("sum")=sum
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
<br>
<br>
<table border="0" cellspacing="1" cellpadding="3" align="center" width="520" bgcolor="#000000">
  <form name="payment" action="previeworder.asp" method="POST"  onSubmit="return CheckForm();">
<%
sql="select * from [User] where UserName='"&session("UserName")&"'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
Postcode=rs("Postcode")
Phone=rs("Phone")
Add=rs("Add")
Email=rs("Email")
Receiver=rs("Receiver")
CompanyName=rs("CompanyName")
Fax=rs("Fax")
rs.close
set rs=nothing
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%">�ջ�������</td>
      <td width="30%"><input type="text" name="Receiver" class="form" size="15" value=<%=Receiver%>> 
        <b><font color="#FF3333">*</font></b> </td>
      <td>�ջ��˵绰</td>
      <td><input type="text" name="Phone" class="form" size="15" value=<%=Phone%>> 
        <b><font color="#FF3333">*</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="27">�ջ�������</td>
      <td height="27"><input type="text" name="Email"  size="16" value=<%=Email%>> 
        <b><font color="#FF3333">*</font></b></td>
      <td height="30">֧����ʽ</td>
      <td><select name="Paytype">
          <option value="" selected>��ѡ��֧����ʽ</option>
<%
sqlp="select paytype from paydefault"
set rsp=server.createobject("ADODB.Recordset")
rsp.open sqlp,conn,1,1
while not rsp.eof
%>
<option value="<%=rsp("paytype")%>"><%=rsp("paytype")%></option>
<%
rsp.movenext
wend
rsp.close
set rsp=nothing
%>
 </select>
        <b><font color="#FF3333">*</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30">��������</td>
      <td> <input type="text" name="Postcode" size="15" value=<%=Postcode%>></td>
      <td>��ϵ����</td>
      <td><input type="text" name="Fax" size="15" value=<%=Fax%>></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30" >��˾����</td>
      <td colspan=3><input type="text" name="CompanyName" size="45" value=<%=CompanyName%>></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30" > �ջ��˵�ַ</td>
      <td colspan=3><input name="Add" size=45 value='<%=Add%>'> 
        <b><font color="#FF3333">*</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="30" >��ע����</td>
      <td colspan="3"> &nbsp; <textarea name="Notes" cols="35" rows="4"></textarea> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="35" colspan="4" align="center"> <input type=hidden name="Sum" value="<%=Sum%>"> 
        <input type="button" name="Submit21" onclick="javascript:history.go(-1)" value="&lt;&lt; �����޸�"> 
        &nbsp;&nbsp;&nbsp; <input type="submit" name="nextstep" value="ȷ�϶��� >>"> 
        &nbsp;&nbsp;&nbsp; <input type="reset" name="reset" value="������д��Ϣ"> </td>
    </tr>
  </form>
</table>
</body>
</html>
<%
set conn=nothing
%>
<!--
������������������������������������
��                                                                  ��
�� ���뱣���˴���Ȩ��Ϣ����Щ���ݲ������������վ�������κ�Ӱ�죩   ��
��                                                                  ��
��                �ǹ⣨���������޹�˾                              ��
��                                                                  ��
��  ��Ȩ����: yagn.cn                                               ��
��                                                                  ��
��  ��������: �ǹ⣨���������޹�˾                                  ��
��            email:syklw@hotmail.com                               ��
��            Tel:13004808633    QQ:56786508                        ��
��                                                                  ��
��  �����ַ: http://www.yagn.cn                                    ��
��                                                                  ��
������������������������������������
-->