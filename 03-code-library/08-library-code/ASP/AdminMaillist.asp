
<script language="javascript">
<!--  
  if (window == top)top.location.href = "Default.asp"; 
// -->
</script>
<html>
<head>
<title>�Ϸ�������ҵ��վ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.back_southidc{BACKGROUND-IMAGE:url('image/titlebg.gif');COLOR:000000;}
.table_southidc{BACKGROUND-COLOR: A4B6D7;}
.td_southidc{BACKGROUND-COLOR: F2F8FF;}
.tr_southidc{BACKGROUND-COLOR: ECF5FF;}

.t1 {font:12px ����;color:#000000} 
.t2 {font:12px ����;color:#ffffff} 
.t3 {font:12px ����;color:#ffff00} 
.t4 {font:12px ����;color:#800000} 
.t5 {font:12px ����;color:#191970} 

.weiqun:hover{
	Font-unline:yes;
	font-family: "����";
	color: #FFFFFF;
	text-decoration: underline;
	background-color: #CCCCCC;
}
td {
	font-size: 12px;
}

a:link {
	color: #000000;
	text-decoration: none;
}
a:active {
	color: #000000;
	text-decoration: none;
}
a:visited {
	color: #000000;
	text-decoration: none;
}

-->
</style>
<body>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000" class="border">
  <tr class="topbg"> 
    <td class="back_southidc" height="28" colspan="2" align="center" bgcolor="#FFFFFF"><strong>�� 
      �� �� �� �� ��</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF" class="tdbg"> 
    <td width="101" height="30" bgcolor="#A4B6D7"><div align="right">��������</div></td>
    <td width="595" height="30"><a href="AdminMaillist.asp">�����ʼ��б�</a> | <a href="AdminMaillist.asp?Action=Export">�����ʼ��б�</a> 
  </tr>
</table>
<br>

<form method="POST" action="AdminMaillist.asp?Action=Send">
  <table width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#000000" Class="border">
    <tr bgcolor="#FFFFFF" class="title"> 
      <td class="back_southidc" height="28" colspan=2 align=center><b> �� �� �� ��</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td rowspan="3" align="right" bgcolor="#A4B6D7">�ռ��ˣ�</td>
      <td width="85%"> 
        <input type="radio" name="incepttype" value="1">
        �ʼ���������ע���û�</td>
    </tr>
    <tr class="tdbg"> 
      <td width="85%" bgcolor="#FFFFFF"> 
        <input type="radio" name="incepttype" value="2">
        ���û����������ʼ�&nbsp;
        <input type="text" name="inceptname" size="35">
        ����û�������<font color="#0000FF">Ӣ�ĵĶ���</font>�ָ���</td>
    </tr>
    <tr class="tdbg"> 
      <td width="85%" bgcolor="#FFFFFF"> 
        <input name="incepttype" type="radio" value="3" checked>
        ���û�Email�����ʼ� 		
        <input name="inceptemail" type="text" value="" size="35">
        ����û�Email����<font color="#0000FF">Ӣ�ĵĶ���</font>�ָ���</td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">�ʼ����⣺</td>
      <td width="85%"> 
        <input type=text name=subject size=64>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td align="right" bgcolor="#A4B6D7">�ʼ����ݣ�</td>
      <td> 
        <textarea cols=80 rows=8 name="content"></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">�����ˣ�</td>
      <td width="85%"> 
        <input type="text" name="sendername" size="64" value="�Ϸ�������ҵ��վ����ϵͳ">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">������Email��</td>
      <td width="85%"> 
        <input type="text" name="senderemail" size="64" value="hdz2008@163.com">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td align="right" bgcolor="#A4B6D7">�ʼ����ȼ���</td>
      <td> 
        <input type="radio" name="Priority" value="1">
        �� 
        <input type="radio" name="Priority" value="3" checked>
        ��ͨ 
        <input type="radio" name="Priority" value="5">
        ��</td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td width="15%" align="right" bgcolor="#A4B6D7">ע�����</td>
      <td width="85%"> 
        ��Ϣ�����͵�����ע��ʱ������д��������û����ʼ��б��ʹ�ý����Ĵ����ķ�������Դ��������ʹ�á�
      </td>
    </tr>
    <tr bgcolor="#FFFFFF" class="tdbg"> 
      <td colspan=2 align=center> 
        <input name="Action" type="hidden" id="Action" value="Send">
        <input name="Submit" type="submit" id="Submit" value=" �� �� " >
        &nbsp; 
        <input  name="Reset" type="reset" id="Reset2" value=" �� �� ">
      </td>
    </tr>
  </table>
</form>

</body>
</html>