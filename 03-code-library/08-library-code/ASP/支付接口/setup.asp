<%
'#############################################################
'#               ��ϲ֧��ƽ̨֧���ӿڰ�װ����
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
on error resume next
'��ȡ���ļ���
thisfilename=right(Request.ServerVariables("SCRIPT_NAME"),len(Request.ServerVariables("SCRIPT_NAME"))-InStrRev(Request.ServerVariables("SCRIPT_NAME"),"/"))
if request.form("submit")<>"" then
	reg_userid=request.form("reg_userid")
	reg_key=request.form("reg_key")
	servicename=request.form("servicename")
	receive_url=request.form("receive_url")
	use_custom1=request.form("use_custom1")
	custom1_name=request.form("custom1_name")
	use_custom2=request.form("use_custom2")
	custom2_name=request.form("custom2_name")
	fee_mode=request.form("fee_mode")
	pay_fee=request.form("pay_fee")
	payvia_list=request.form("payvia_list")
	payvia_mode=request.form("payvia_mode")
	order_mode=request.form("order_mode")
	orderuser=request.form("orderuser")
	orderpass=request.form("orderpass")
	pay_mode=request.form("pay_mode")
	deletefile=request.form("deletefile")
	if reg_userid="" then%>
	<script language=vbscript>
	  MsgBox "�����̻���ű�����д��"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	else
		if not isNumeric(reg_userid) then%>
		<script language=vbscript>
		  MsgBox "�����̻���ű���Ϊ���֣�"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	if reg_key="" then%>
	<script language=vbscript>
	  MsgBox "�����̻���Կ������д��"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if len(reg_key)>30 then%>
	<script language=vbscript>
	  MsgBox "�����̻���Կ���ȱ���С��30���ַ���"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if servicename="" then%>
	<script language=vbscript>
	  MsgBox "���󣺷������Ʊ�����д��"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if receive_url="" then%>
	<script language=vbscript>
	  MsgBox "����֧��������ص�ַ������д��"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if use_custom1 then
		if custom1_name="" then%>
		<script language=vbscript>
		  MsgBox "���������Զ����ֶ�1���Զ����ֶ�1��ʾ���Ʊ�����д��"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	if use_custom2 then
		if custom2_name="" then%>
		<script language=vbscript>
		  MsgBox "���������Զ����ֶ�2���Զ����ֶ�2��ʾ���Ʊ�����д��"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	if fee_mode then
		if pay_fee="" then%>
		<script language=vbscript>
		  MsgBox "���󣺹̶�֧������̶�֧����������д��"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		else
			if not isNumeric(pay_fee) then%>
			<script language=vbscript>
			  MsgBox "���󣺹̶�֧��������Ϊ���֣�"
			  location.href = "javascript:history.back()"
			</script>
			<%Response.end
			end if
		end if
	end if
	if instr(payvia_list, "|")<=0 then%>
		<script language=vbscript>
		  MsgBox "����֧��;���б�������Ҫ����һ�"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
	end if
	if not isNumeric(left(payvia_list,1)) then%>
	<script language=vbscript>
	  MsgBox "����֧��;���б��һλ����Ϊ���֣�"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	if order_mode then
		if orderuser="" then%>
		<script language=vbscript>
		  MsgBox "����ʹ�ö�������ϵͳ���¼�û���������д��"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
		if orderpass="" then%>
		<script language=vbscript>
		  MsgBox "����ʹ�ö�������ϵͳ���¼���������д��"
		  location.href = "javascript:history.back()"
		</script>
		<%Response.end
		end if
	end if
	Set Fso = Server.CreateObject("Scripting.FileSystemObject")
	Set FsoTEXT = Fso.OpenTextFile(Server.MapPath("paysettings.mb"),1,True)
	If Not FsoTEXT.AtEndOfStream Then 
		Fso_Read=FsoTEXT.ReadAll
		set FsoTEXT=Nothing
		Set Fso=Nothing
	else%>
	<script language=vbscript>
	  MsgBox "����paysettings.mb����ģ���ļ���ʧ�������ݣ���װʧ�ܣ�"
	  location.href = "javascript:history.back()"
	</script>
	<%Response.end
	end if
	'�滻ģ���е��������
	Fso_Read=replace(Fso_Read,"$reg_userid$",reg_userid,1,1)
	Fso_Read=replace(Fso_Read,"$paykey$",reg_key,1,1)
	Fso_Read=replace(Fso_Read,"$servicename$",servicename,1,1)
	Fso_Read=replace(Fso_Read,"$receive_url$",receive_url,1,1)
	Fso_Read=replace(Fso_Read,"$use_custom1$",use_custom1,1,1)
	Fso_Read=replace(Fso_Read,"$custom1_name$",custom1_name,1,1)
	Fso_Read=replace(Fso_Read,"$use_custom2$",use_custom2,1,1)
	Fso_Read=replace(Fso_Read,"$custom2_name$",custom2_name,1,1)
	Fso_Read=replace(Fso_Read,"$fee_mode$",fee_mode,1,1)
	Fso_Read=replace(Fso_Read,"$pay_fee$",pay_fee,1,1)
	Fso_Read=replace(Fso_Read,"$payvia_list$",payvia_list,1,1)
	Fso_Read=replace(Fso_Read,"$payvia_mode$",payvia_mode,1,1)
	Fso_Read=replace(Fso_Read,"$pay_mode$",pay_mode,1,1)
	Fso_Read=replace(Fso_Read,"$order_mode$",order_mode,1,1)
	Fso_Read=replace(Fso_Read,"$orderuser$",orderuser,1,1)
	Fso_Read=replace(Fso_Read,"$orderpass$",orderpass,1,1)

	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	Set fout = fso.CreateTextFile(server.mappath("paysettings.asp"))
	fout.Write Fso_Read
	fout.close
	Response.write "<html><head>" & vbcrlf
	Response.write "<title>��ϲ��;��֧��ϵͳ��װ�ɹ�</title>" & vbcrlf
	Response.write "<meta http-equiv='refresh' content='3;url=index.asp'>" & vbcrlf
	Response.write "</head>" & vbcrlf
	Response.write "<body text='#FF0000'>" & vbcrlf
	Response.write "<p align='center'>��ϲ����ϲ��;��֧��ϵͳ�Ѿ���װ�ɹ�������ת������֧��ҳ��...</p>" & vbcrlf
	Response.write "</body></html>" & vbcrlf
	Set fout = nothing
	if deletefile then
		Fso.DeleteFile Server.MapPath("paysettings.mb"),True
		Fso.DeleteFile Server.MapPath("setup.asp"),True
	end if
	Set Fso=Nothing
else
IsObj=false
set TestObj=server.CreateObject("Scripting.FileSystemObject")
If -2147221005 <> Err then
	IsObj = True
	VerObj = TestObj.version
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>��ϲ��;��֧��ϵͳ��װ����</title>
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

// ����Ƿ�Ϊ����
function checkIsInteger(str)
{
    if (str == "")
        return false;
    if (str.search(/^[0-9]+$/) < 0)
        return false;
    if (str <= 0)
        return false;
    else
        return true;
}

function Checkinput()
{
	with (document.setupform) 
	{
		var retVal;
		var amt = pay_fee.value;
		var Ms = 0 ;
		
		// ����̻���Ų���Ϊ��
	    if(reg_userid.value == "")
		{
			window.alert("����д��ȷ���̻���ţ�") ;
			reg_userid.focus();
			return false;
		}

		// ����̻���ű���Ϊ����
	    if (! checkIsInteger(reg_userid.value))
		{
			window.alert("�̻���ű���Ϊ�����Ҵ���0��") ;
			reg_userid.focus();
			return false;
		}
		// ����̻���Կ����Ϊ��
	    if(reg_key.value == "")
		{
			window.alert("����д��ȷ���̻���Կ��") ;
			reg_key.focus();
			return false;
		}

		// ���������Ʋ���Ϊ��
	    if(servicename.value == "")
		{
			window.alert("����д��ȷ�ķ������ƣ�") ;
			servicename.focus();
			return false;
		}

		// ���֧��������յ�ַ����Ϊ��
	    if(receive_url.value == "")
		{
			window.alert("����д��ȷ��֧��������յ�ַ��") ;
			receive_url.focus();
			return false;
		}

		if(use_custom1[0].checked)
		{
			// ����Զ����ֶ�1��ʾ���Ʋ���Ϊ��
		    if(custom1_name.value == "")
			{
				window.alert("����д��ȷ���Զ����ֶ�1��ʾ���ƣ�") ;
				custom1_name.focus();
				return false;
			}
		}

		if(use_custom2[0].checked)
		{
			// ����Զ����ֶ�2��ʾ���Ʋ���Ϊ��
		    if(custom2_name.value == "")
			{
				window.alert("����д��ȷ���Զ����ֶ�2��ʾ���ƣ�") ;
				custom2_name.focus();
				return false;
			}
		}

		if(fee_mode[0].checked)
		{
			// ���֧������Ϊ��
		    if(amt == "")
			{
				window.alert("����д��Ч��֧����") ;
				pay_fee.focus();
				return false;
			}
			// ���֧������Ƿ���Ч
			if (! checkValidAmount(amt))
			{
				window.alert("��Ч��֧�����ֻ��Ϊ����(����С����С��������ֻ�ܰ�����������)");
				pay_fee.focus();
				return false;
			}
			// �������֧������С��֧�����
			if ((retVal = checkValidSaveAmount(amt)) != "true")
			{
				window.alert(retVal);
				pay_fee.focus();
				return false;
			}
		}

		// ���֧��;���б���Ϊ��
	    if(payvia_list.value == "")
		{
			window.alert("����д��ȷ��֧��;���б�") ;
			payvia_list.focus();
			return false;
		}
		
		if(order_mode[0].checked)
		{
			// ����¼�û�������Ϊ��
		    if(orderuser.value == "")
			{
				window.alert("����д��ȷ�ĵ�¼�û�����") ;
				orderuser.focus();
				return false;
			}
			// ����¼���벻��Ϊ��
		    if(orderpass.value == "")
			{
				window.alert("����д��ȷ�ĵ�¼���룡") ;
				orderpass.focus();
				return false;
			}
		}

	}

	return true;
}

var minSaveAmount = 0.01;     // ��С��֧�����
var maxSaveAmount = 10000;   // ����֧�����
// ����Ƿ�Ϊ��Ч�Ľ��(����С������λ)����ԪΪ��λ
// ����ֵ��
// 		true : ��ȷ
//      false: ����
function checkValidAmount(num)
{
	var len = num.length;
	
	// "." ���ܳ����ڵ�һ���ַ������һ���ַ�
	if (num.charAt(0) == '.' || num.charAt(len - 1) == '.')
		return false;
	// С��������ֻ�ܰ���������Ч����(�����.���Ŵ��ڣ��������Ĵ���λ���ڵ�����2����������Ϊ����)
	var idx = 0;
	if ((idx = num.indexOf('.')) >= 0 && idx < len - 1 - 2)
		return false;
	// ���ֿ�ͷ�����԰���С����
    if(num.search(/^[0-9]+[.]?[0-9]*$/) >= 0)
        return true;
    else
        return false;
        
    return true;
}

// ����Ƿ�Ϊ����֧����Χ
// ����ֵ��
//      "true" : ��ȷ
//      ����   : ����
function checkValidSaveAmount(num)
{
	var retVal = "true";
	if (num < minSaveAmount)
	{
		retVal = "�Բ��𣬵���֧���Ľ������Ϊ" + minSaveAmount + "Ԫ";
	}
    else if (num > maxSaveAmount)
    {
    	retVal = "�Բ��𣬵���֧���Ľ�����Ϊ" + maxSaveAmount + "Ԫ";
    }

	return retVal;
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
                                      <td width="518" height="356" bgcolor="#FFFFFF"><div align="center">
                                          <Table bgColor="#CCCCCC" Width="100%" Border=0 CellSpacing=1 CellPadding=5>
                                            <Tr bgColor="#FFFFFF">
                                              <Td colspan="2" align=Right><div align="left"><SPAN 
                              class=style3><IMG height=11 
                              src="images/icon_01.gif" width=18>  
                                                  ��ϲ��;��֧��ϵͳ��װ����</SPAN></div></Td>                     
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>��һ����</b></p>
      </td>
      <td width="70%">
  <p>����ͨ��<a href="http://www.168reg.cn/register.asp" target="_blank">http://www.168reg.cn/register.asp</a>ע���Ϊ�̻���</p>
      </td>
                                            </TR>
                                            <form method="POST" name="setkeyform" action="http://merchant.168reg.cn/168setkey.asp" target="_blank">
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>�ڶ�����</b></p>
      </td>
      <td width="70%">
  <p>�������ú�ϲ֧���ӿ��̻���Կ(<b><font color="#0000FF">�����õĴ˲�������</font></b>)��<br>�̻���¼����<input type="text" name="devusername" size="20" maxlength="15"><br>����¼���룺<input type="password" name="devpassword" size="20" maxlength="16"><br>���̻���Կ��<input type="password" name="devreg_key" size="20" maxlength="30">(С��30���ַ�)<br><input type="submit" value="��������" name="submit1">(�������ú����������̻����)</p>
      </td>
                                            </TR>
                                            </form>
<%if IsObj then%>
                                            <form method="POST" name="setupform" action="<%=thisfilename%>" onsubmit='return(Checkinput());'>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>��������</b>
      </td>
      <td width="70%">
  ���������Ϣ�������á�
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>�̻���ţ�</b>
      </td>
      <td width="70%">
  <input type="text" name="reg_userid" size="5" maxlength="5" value="0">(�̻���ſ�ͨ����������ҳ��֧��ƽ̨���������û��)
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>�̻���Կ��</b>
      </td>
      <td width="70%">
  <input type="password" name="reg_key" size="15" maxlength="30">
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>�������ƣ�</b></p>
      </td>
      <td width="70%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="50"
  --><input type="text" name="servicename" size="20" value="XXXX����Ա" maxlength="50">���50�ַ���</p>
      </td>
                                            </TR>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>֧��������յ�ַ��</b></p>
      </td>
      <td width="70%">
  <p><input type="text" name="receive_url" size="40" value="http://www.yourdomain.com/payreceive.asp"><br>
  (֧����������ش˵�ַ��������Ϊpayreceive.asp������վ��ַ)</p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>�Ƿ������Զ����ֶ�1��</b></p>
      </td>
      <td width="70%">
  <p><input type="radio" value="true" checked name="use_custom1" id="use_custom11"><label for="use_custom11">����</label>��<input type="radio" value="false" name="use_custom1" id="use_custom12"><label for="use_custom12">������</label></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p>
  <b>
  �Զ����ֶ�1��ʾ���ƣ�</b></p>
      </td>
      <td width="70%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
  --><input type="text" name="custom1_name" size="10" value="�û���" maxlength="30"></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p>
  <b>�Ƿ������Զ����ֶ�2��</b></p>
      </td>
      <td width="70%">
  <p><input type="radio" value="true" name="use_custom2" id="use_custom21"><label for="use_custom21">����</label>��<input type="radio" value="false" name="use_custom2" checked id="use_custom22"><label for="use_custom22">������</label></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p>
  <b>
  �Զ����ֶ�2��ʾ���ƣ�</b></p>
      </td>
      <td width="70%">
  <p><!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
  --><input type="text" name="custom2_name" size="10" maxlength="30"></p>
      </td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><font color="#FF0000"><b>�Զ����ֶ�˵����</b></font></p>
      </td>
      <td width="70%">
  <p>�����ڱ����̻���վ�ύ���������ݣ����û�����Email���������͡����кŵ���Ϣ��</p>
      </td>
                                            </Tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <b>�Ƿ�̶�֧����</b>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <input type="radio" value="true" checked name="fee_mode" id="fee_mode1"><label for="fee_mode1">�̶����</label>��<input type="radio" value="false" name="fee_mode" id="fee_mode2"><label for="fee_mode2">���û�����֧�����</label>
      </td>
                                            </tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <p><b>�̶�֧����</b></p>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <p><input type="text" name="pay_fee" size="5" value="1" maxlength="5"> Ԫ</p>
      </td>
                                            </tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <b>֧��;���б�</b>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <textarea rows="5" name="payvia_list" cols="45">1|���п�֧��,2|��Ѷ�绰֧��,3|�����ǿ�֧��,4|�ֻ�����ע��,5|��Ѷ�Ƹ�֧ͨ��,6|��ѶQ��֧��,7|�����г�ֵ��֧��(���500Ԫ),8|ʢ����Ϸ�㿨֧��(���1Ԫ�����100Ԫ),9|֧����֧��,10|�ֻ�����֧��,11|�������֧��(���200Ԫ)</textarea><br>
  ��ʽ��֧��;��1���|֧��;��1����,֧��;��2���|֧��;��2���ƣ���ű�����<a href="http://www.168reg.cn" target="_blank">www.168reg.cn</a>��վ������һ�¡�˳��ɵ�����
      </td>
                                            </tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <b>ѡ��֧��;��ģʽ��</b>
      </td>
      <td width="70%" bgcolor="#FFFFFF">
  <input type="radio" value="1" checked name="payvia_mode" id="payvia_mode1"><label for="payvia_mode1">��ѡ</label>��<input type="radio" value="2" name="payvia_mode" id="payvia_mode2"><label for="payvia_mode2">��ѡ</label>
      </td>
                                            </tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>�Ƿ�ʹ��֧���ӿ��Դ��ļ��׶�������ϵͳ��</b>
      </td>
                                              <Td id="postid" name="postid" width="70%">
      <input type="radio" value="true" checked name="order_mode" id="order_mode1"><label for="order_mode1">ʹ��</label>��<input type="radio" value="false" name="order_mode" id="order_mode2"><label for="order_mode2">��ʹ��</label><br>
      <a href="order/" target="_blank"><font color="#FF0000"><b>��˽�����׶�������ϵͳ</b></font></a>
      </Td>  
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>����ϵͳ��¼�û�����</b>
      </td>
                                              <Td id="postid" name="postid" width="70%">
      <!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
      --><input type="text" name="orderuser" size="15" maxlength="30" value="admin">(Ĭ��ֵ��admin)</Td>  
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <b>����ϵͳ��¼���룺</b>
      </td>
                                              <Td id="postid" name="postid" width="70%">
      <!--webbot bot="Validation" B-Value-Required="TRUE" I-Maximum-Length="30"
      --><input type="password" name="orderpass" size="15" maxlength="30" value="admin">(Ĭ��ֵ��admin)</Td>  
                                            </Tr>
                                            <tr>
      <td align="right" width="30%" bgcolor="#FFFFFF">
  <p><b>����ģʽ��</b></p>
      </td>
                                              <Td width="70%" bgcolor="#FFFFFF">
      <input type="checkbox" name="pay_mode" value="testmode" id="paymodeid"><label for="paymodeid">����ģʽ��֧���ӿڵ�����ģʽ������ѡ��������ʽģʽ��</label></Td>  
                                            </tr>
                                            <Tr bgColor="#FFFFFF">
                                              <Td Align=right width="30%"><b><font color="#FF0000">ɾ������װ����</font></b></Td>
                                              <Td Align=left width="70%"><input type="radio" value="true" checked name="deletefile" id="deletefile1"><label for="deletefile1">��</label>��<input type="radio" name="deletefile" value="false" id="deletefile2"><label for="deletefile2">��</label></Td>
                                            </Tr>
                                            <Tr bgColor="#FFFFFF">
                                              <Td Align=center colspan="2"><input type="submit" value=">>�� װ<<" name="submit"></Td>
                                            </Tr>
                                            </form>
<%else%>
                                            <Tr bgColor="#FFFFFF">
      <td align="right" width="30%">
  <p><b>��������</b></p>
      </td>
      <td width="70%">
  <p>�������ķ�������֧��Scripting.FileSystemObject���������ֱ�Ӵ�paysettings.asp�ļ��������á�</p>
      </td>
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
<%end if%>
