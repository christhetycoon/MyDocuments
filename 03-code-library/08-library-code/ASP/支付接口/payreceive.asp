<!--#include file="md5char.asp"-->
<!--#include file="paysettings.asp"-->
<%
'#############################################################
'#               ��ϲ֧��ƽ̨֧���ӿڽ��ճ���
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
'# ���˳��򲻵����⹫�����������ۻ���������Ƿ�ת�á�
'# ����Դ˳������κ����ʣ����ڹ��������ԡ�
'#############################################################
'���ļ����ܽ��ܣ�
'1�������Լ�����Կ������֤���صļ����ַ����Ƿ���ȷ��
'2����ʾ����֧���ɹ�ҳ�档
'3��������ص��ύ�д��󣬼���ʾ������Ϣ��
'4��Ϊ����ǿ���ض����İ�ȫ�ԣ�ϵͳ���صļ����ַ����ɶ��������Ϣƴ����һ��󾭹�MD5���ܺ�����ġ�����ĳ����Ѿ�����˴˼����ַ�������֤��
'5��Ϊ�˷�ֹ�ڿ�ͨ�����������ֶζ��ⷵ��(ˢ��)�ɹ�ҳ�棬�����ڴ˳����м�����֤�����ŵĹ��ܣ���ÿһ���ɹ�����ֻ�ܷ���һ�δ�ҳ�档����ĳ���������֤�����ŵ�ʾ�����򣬹����о���ʹ�á�
'6�������Ķ��������������Գ�����ò���ӵ����Լ������ݿ��С�����ĳ����и�������������һ���Ǳ��涨����Ϣ�����ݿ��е�ʾ�����򣬹����о���ʹ�á�

'Ϊ��ֹ�û����ˢ�³ɹ�ҳ�棬ʹ�����ҳ����������
Response.expires = 0
Response.expiresabsolute = now() - 1
Response.addHeader "pragma","no-cache"
Response.addHeader "cache-control","private"
Response.cachecontrol = "no-cache"
'�����Գ���������·�����Ϣ����ӵ����Լ������ݿ��С�
vip=Request.ServerVariables("Remote_Addr")   '�ύ��IP��ַ
v_orderid=Request("v_orderid")   '��ϲ֧��ƽ̨�����Ķ�����
v_orderdate=Request("v_orderdate")   '�����ɽ�ʱ��
v_price=Request("v_price")   '�����ɽ��۸��Է�Ϊ��λ
v_billno=Request("v_billno")   '�̻�������
v_custom1=Request("v_custom1")   '�Զ����ֶ�1
v_custom2=Request("v_custom2")   '�Զ����ֶ�2
v_mobileno=Request("v_mobileno")   '�û�֧�����ֻ�����
v_servicename=Request("v_servicename")   '֧�������ķ�������
v_payvia=Request("v_payvia")   '�û�ѡ���֧��;����1�����п�����֧����2����Ѷ�绰֧����3�������ǿ�֧����4���ֻ�����ע�᣻5����Ѷ�Ƹ�֧ͨ����6����ѶQ��֧����7�������г�ֵ��֧����8��ʢ����Ϸ�㿨֧����9��֧����֧����10���ֻ�����֧����11���������֧��
v_payviastr=Request("v_payviastr")   '�û�ѡ���֧��;����������
v_md5=Request("v_md5")   '���صļ����ַ���
v_pstatus=Request("v_pstatus")   '�����ɹ��������ַ�������1��0�����������Ҫ������֤�Ƿ�������������
v_pstring=Request("v_pstring")   '����֧��״̬˵����
v_paymode=Request("v_paymode")   '��ǰ��������ģʽ�������ò���ģʽʱ��Ч��ֵΪtestmode��
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>��ϲ��;��֧��ƽ̨֧������ҳ��</title>
<STYLE type="text/CSS">
Body {text-Align:Center;Font-Size:9pt}
TD {Font-Size:9pt}
input {font-size:9pt}
.style3 {	COLOR: #000000
}
</STYLE>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body>
<div align="center">
  <center>
  <map name="MapMapMapMap2">
    <area shape="rect" coords="3,36,73,54" href="#" onClick="MM_openBrWindow('http://www.168reg.cn/','','scrollbars=yes')">
    <area shape="rect" coords="76,36,140,54" href="#" onClick="MM_openBrWindow('http://www.168reg.com/help.asp','','scrollbars=yes')">
  </map>  
  <TABLE height=400 cellSpacing=1 cellPadding=0 width=370 align=center 
bgColor=#666666 border=0>
    <TBODY>
      <TR bgColor=#f7fef1>
        <TD width="100%" bgColor=#ffffff><TABLE height=400 cellSpacing=0 cellPadding=0 width=570 border=0>
            <TBODY>
              <TR>
                <TD vAlign=top height=63><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                      <TR>
                        <TD valign="top"><table width="101%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%"><a href="http://www.168reg.cn" target="_blank"><img src="images/logo.gif" width="173" height="62" border="0"></a></td>
                            <td width="71%">&nbsp;</td>
                            <td width="14%"><img src="images/top_right.gif" width="148" height="62" usemap="#MapMapMapMap2" border="0">
                            </td>
                          </tr>
                          <tr bgcolor="#666666">
                            <td colspan="3" height="2"></td>
                          </tr>
                        </table></TD>
                        </TR>
                      <TR bgColor=#666666>
                        <TD height=1 valign="top"></TD>
                      </TR>
                    </TBODY>
                </TABLE></TD>
              </TR>
              <TR>
                <TD vAlign=top height=337><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                      <TR>
                        <TD background=images/bg.gif height=312><TABLE height=301 cellSpacing=3 cellPadding=3 width=557 
                  align=center border=0>
                            <TBODY>
                              <TR>
                                <TD colSpan=3></TD>
                              </TR>
                              <TR>
                                <TD width=5></TD>
                                <TD width=547 vAlign=top bgColor=#FFFFFF><div align="center">
                                  <table width="524" height="360" border="0" align="center">
                                    <tr>
                                      <td width="518" height="356" bgcolor="#FFFFFF" valign="top"><div align="center">
                                          <Table bgColor="#CCCCCC" Width="100%" height="356" Border=0 CellSpacing=1 CellPadding=5>
<%
if v_pstatus="1" then
if v_orderid="" or v_orderdate="" or v_price="" or v_md5="" or v_payvia="" then%>
<script language=vbscript>
  MsgBox "�Ƿ����������������ݲ���ȷ��"
  location.href = "/"
</script>
<%Response.end
end if
'���³�����֤���صļ����ַ����Ƿ���ȷ
encrypt_string=Ucase(trim(md5(v_orderid&v_billno&v_custom1&v_custom2&v_price&v_payvia&reg_userid&v_pstatus&paykey&v_paymode)))
if v_md5<>encrypt_string then%>
<script language=vbscript>
  MsgBox "�������󣺷��صļ����ַ�������ȷ�����ǷǷ��ύ��"
  location.href = "/"
</script>
<%Response.end
end if
'��֤���صļ����ַ����Ƿ���ȷ�������

'������֧��������ԪΪ��λ
payfee=FormatNumber(v_price/100,2,True)

'��ϲ֧��ƽ̨ǿ���Ƽ������ж�������֤��������ö������ɣ��뵽�̻��������˶ԡ���Ϊ��վ��ȫ��ʩδ���ö���ɵ���ʧ����ϲ֧��ƽ̨�Ų�����

'�ж��Ƿ�ʹ�ü��װ涨������ϵͳ����֤�����涨����Ϣ
if order_mode then
	connstr="DBQ="+server.mappath("order/168regorder.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
	set conn=server.createobject("ADODB.CONNECTION")
	conn.open connstr
	set rs=server.createobject("adodb.recordset")
	'��ⶨ�����Ƿ��Ѵ��������ݿ��У��ɸ����Լ������ݿ��޸Ļ�ʹ�������ṩ��ʾ�����ݿ⡣
	sql="SELECT orderid FROM myorder where orderid='" & v_orderid & "'"
	rs.open sql,conn,1,1
	hassave=false
	if not rs.eof then
		hassave=true
		'������ʾ�û����ˢ�»��ύ�Ĵ���ҳ�棬�ɸ����Լ���վ����������
		%>
		<script language=vbscript>
		  MsgBox "���󣺸ö����Ѿ��ɹ�֧�����ɹ����أ������ظ�ˢ��ҳ�棡"
		</script>
		<%
	end if
	rs.close
	if not hassave then
		'��������ӵ��Լ������ݿ���
		sql="SELECT * FROM myorder"
		rs.open sql,conn,1,3
		rs.addnew
		rs("orderid")=v_orderid
		rs("billno")=v_billno
		rs("servicename")=v_servicename
		rs("price")=payfee
		rs("custom1")=v_custom1
		rs("custom2")=v_custom2
		rs("payvia")=v_payviastr
		rs("pstring")=v_pstring
		rs("orderdate")=v_orderdate
		rs("vip")=vip
		rs.update
		rs.close
	end if
	set rs=nothing
	conn.close
else
	'���³����ܼ򵥵ط�ֹ�û��Ƿ���ˢ�³ɹ�ҳ�棬��õķ����������ɴ��Լ������ݿ��м��v_orderid�������Ƿ��ѳɽ�������ѳɽ����Ͳ���ʾҳ�档
	if session("reg168_orderid")<>"" then
		if session("reg168_orderid")=v_orderid then%>
		<script language=vbscript>
		  MsgBox "����ͬһ�����ɽ�ҳ�治������ˢ�»��ύ��"
		  location.href = "/"
		</script>
		<%Response.end
		else
			session("reg168_orderid")=v_orderid
		end if
	else
		session("reg168_orderid")=v_orderid
	end if
end if

'��������붨���ɹ�ҳ���HTML���룬���Զ���%>
    <Tr bgColor="#FFFFFF">
      <Td colspan="2" align=Right><div align="left">
          <p align="center"><SPAN 
class=style3><font color="#FF0000" size="3"><b>֧���ɹ�</b></font></SPAN></div></Td>         
    </TR>

    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>�������ƣ�</p>
</td>
<td width="73%">
<p><%=v_servicename%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>֧����</p>
</td>
<td width="73%">
<p><%=payfee%> Ԫ</p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>�̻������ţ�</p>
</td>
<td width="73%">
<p><%=v_billno%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>��ϲ֧��ƽ̨�����ţ�</p>
</td>
<td width="73%">
<p><%=v_orderid%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>֧��;����</p>
</td>
<td width="73%">
<p><%=v_payviastr%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>����״̬��</p>
</td>
<td width="73%">
<p><%=v_pstatus%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>����״̬˵����</p>
</td>
<td width="73%">
<p><%=v_pstring%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>IP��ַ��</p>
</td>
<td width="73%">
<p><%=vip%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>�����ɽ�ʱ�䣺</p>
</td>
<td width="73%">
<p><%=v_orderdate%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>�Զ����ֶ�1��</p>
</td>
<td width="73%">
<p><%=v_custom1%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>�Զ����ֶ�2��</p>
</td>
<td width="73%">
<p><%=v_custom2%></p>
</td>
    </TR>
<%
'�û�ѡ���ֻ�����ע��ʱ�������ֻ�����
if v_payvia=4 then%>
		<Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>�û��ֻ����룺</p>
</td>
<td width="73%">
<p><%=v_mobileno%></p>
</td>
    </TR>
<%end if%>
		<Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>���صļ����ַ�����</p>
</td>
<td width="73%">
<p><%=v_md5%></p>
</td>
    </TR>
		<Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p>����ģʽ��</p>
</td>
<td width="73%">
<p><%if v_paymode="testmode" then%>����ģʽ<%else%>��ʽģʽ<%end if%></p>
</td>
    </TR>
    <Tr bgColor="#FFFFFF">
<td align="right" width="27%">
<p><font color="#FF0000"><b>˵����</b></font></p>
</td>
<td width="73%">
<p>֧������ҳ���в���Ҫ��ʾ����Ϣ������ɾ����</p>
</td>
    </TR>
<%
else
'��������붨��ʧ��ҳ���HTML����
%>
    <Tr bgColor="#FFFFFF">
      <Td colspan="2" align=Right><div align="left">
          <p align="center"><SPAN 
class=style3><font color="#FF0000" size="3"><b>֧��ʧ��<br><br>
ԭ��
<%if v_pstring="" then
	Response.write "�Ƿ����뷵��ҳ��"
else
	Response.write v_pstring
end if%>
</b></font></SPAN></div></Td>         
    </TR>
<%end if%>

                                          </Table>
                                      </div></td>
                                    </tr>
                                  </table>
                                  </div></TD>
                                <TD width=5></TD>
                              </TR>
                              <TR>
                                <TD colSpan=3 height=5></TD>
                              </TR>
                            </TBODY>
                        </TABLE></TD>
                      </TR>
                      <TR>
                        <TD bgColor=#f7f3ef background="images/copy.gif" height="22"><DIV align=center>
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                              <TBODY>
                                <TR>
                                  <TD bgColor=#999999 height=1></TD>
                                </TR>
                                <TR>
                                  <TD height=1></TD>
                                </TR>
                                <TR>
                                  <TD bgColor=#999999 height=1></TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                            �汾��2.0</DIV></TD>
                      </TR>
                    </TBODY>
                </TABLE></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  </center>
</div>
</body>

</html>