<!--#include file="inc/conn.asp" -->
<%
UserName=session("UserName")			'��½�û�id
Receiver=request.form("Receiver")			'�����ֶ�
Phone=request.form("Phone")		'�����ֶ�
Add=request.form("Add")	'�����ֶ�
PayType=request.form("PayType")			'�����ֶ�
Notes=request.form("Notes")				'
Email=request.form("Email")			'
RecTime=request.form("RecTime")			'
Postcode=request.form("Postcode")			'
CompanyName=request.form("CompanyName")			
Fax=request.form("Fax")		
if UserName="" then UserName="�ο�" 

'�жϹ��ﳵ�Ƿ�Ϊ��
ProductList = Session("ProductList")
if productlist="" then
 response.redirect "error.asp?error=007"
 response.end
else
  sql="select * from Product where Product_Id in ("&productlist&") order by Product_Id"
  Set rs = conn.Execute(sql)
end if

if session("sum")="" then response.redirect "error.asp?error=007"
Total=session("sum")

'���������ţ��ڲ����ⲿ���������������ڼ�������Ϣ
BranchID="0022"
CoNo="000040"

'�������ڣ���ʽ��YYYYMMDD
yy=right(year(date),2)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
riqi=yy & mm & dd

'���ɶ�������������Ԫ��,��ʽΪ��Сʱ�����ӣ���
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
miao=right("00"&second(time),2)

'�����ⲿ���ڲ�������
BillNo=xiaoshi & fenzhong & miao
inBillNo=yy & mm & dd & "-" & xiaoshi & fenzhong & miao

Set rsadd=server.createobject("adodb.recordset")
rsadd.Open "OrderList" ,conn,3,3
Set rsdetail=server.createobject("adodb.recordset")
rsdetail.Open "OrderDetail" ,conn,3,3

'�����忪ʼ
'conn.Begintrans

'����֮һ��ʼд�붩���б���Ϣ
rsadd.AddNew 
rsadd("UserName")=UserName
rsadd("OrderNum")=inBillNo
rsadd("Receiver")=Receiver
rsadd("OrderSum")=Total
rsadd("Phone")=Phone
rsadd("Add")=Add
rsadd("RecTime")=now()
if Postcode<>"" then rsadd("Postcode")=Postcode
if Email<>"" then rsadd("Email")=Email
if CompanyName<>"" then rsadd("CompanyName")=CompanyName
if Fax<>"" then rsadd("Fax")=Fax
rsadd("PayType")=PayType
if Notes<>"" then rsadd("Notes")=Notes
if error>0 then
	response.write " ���������б����ɴ��󣡣�"
    return
end if
rsadd.Update


'������������ϸ��Ϣд������ı���
Sum = 0
While Not rs.EOF '�ѹ���Ĳ�Ʒ���϶�������д�붨����ϸ���ϱ���
     Quatity = CInt( Request( "Q_" & rs("Product_Id")) )
     If Quatity <= 0 Then 
        Quatity = CInt(Session(rs("Product_Id")) )
        If Quatity <= 0 Then Quatity = 1
     End If
     Session(rs("Title")) = Quatity
     Sum = Sum + csng(rs("Price")) * Quatity
     Sum = FormatNumber(Sum,2) 

 rsdetail.AddNew 
 if UserName<>"" then rsdetail("UserName")=UserName		'�µ��û���
 rsdetail("OrderNum")=inBillNo		'��������
 rsdetail("Product_Id")=rs("Product_Id")		'��Ʒ����
 rsdetail("ProductUnit")=Quatity		'��������
 rsdetail("BuyPrice")=rs("Price")'���򵥼�
 rsdetail("OrderTime")=date()

 IF ERROR>0 THEN
	response.write "����������ϸ��Ϣ�����ɴ��󣡣�"
	RETURN
 END if

 rsdetail.Update
 rs.MoveNext
Wend
'�����������
'conn.CommitTrans

rsdetail.close
set rsdetail=nothing
rsadd.close
set rsadd=nothing
Conn.Close
set conn=nothing
Session("ProductList") =""
%>

<HTML>
<HEAD>
<TITLE>�����ύ�ɹ�</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Contact" content="www.bingzhi.cn ��֮���� QQ��101563903">
<link href="mt_style.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY>
<table border="0" cellspacing="1" cellpadding="0" align="center" valign=absmiddle width="100%" height="100%" bgcolor="B0266D">
  <tr bgcolor="eeeeee"> 
    <td  bgcolor="eeeeee" align="center"><font color="B0266D">лл���������ύ�ɹ���������ס���Ķ������룬�Ա��ѯ��</font></td>
  </tr> <tr bgcolor="#FFFFFF"> 
    <td width="100%" height="100%" align="center" valign="middle"> <font color="B0266D"><b>��л���Ķ������ǵĲ�Ʒ!</font><br>
	<br><font color="B0266D">���Ķ��������ǣ�<b><%=inBillNo%></b><br>
      <br>
      </font>
<%
  response.write message
%>
    <br><br>
	<a href="javascript:self.close()">����رմ���</a></td>
  </tr>
</table>
</BODY>
</HTML>
