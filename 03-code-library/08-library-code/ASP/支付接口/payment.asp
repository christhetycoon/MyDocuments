<!--#include file="md5char.asp"-->
<!--#include file="paysettings.asp"-->
<%
'#############################################################
'#               ��ϲ֧��ƽ̨֧���ӿ��ύ����
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

'֧�����Է�Ϊ��λ�����֧����10000Ԫ
amount=Request("amount")
if not isNumeric(amount) then%>
<script language=vbscript>
  MsgBox "����֧��������Ϊ���֣�"
  location.href = "javascript:history.back()"
</script>
<%Response.end
end if
amount=amount*100
'��������,���ȣ�8
yy=year(date)
mm=month(now)
if len(mm)=1 then mm="0"&mm
dd=day(Date)
if len(dd)=1 then dd="0"&dd
'������������
ymd=yy&mm&dd
'�̻�������,���ȣ�30�ɱ䣬��ʾ������ϵͳʱ���4λ��������������ţ���ʽ��YYYYMMDDHHMMSS+4λ���������18λ
'����̻���վ���Լ��Ķ�������ϵͳ�������̻������Ű����Լ���վ�Ķ����Ž�������
'���ɶ�������������Ԫ��,��ʽΪ��Сʱ�����ӣ���
xiaoshi=right("00"&hour(time),2)
fenzhong=right("00"&minute(time),2)
miao=right("00"&second(time),2)
'����4λ�����
Randomize
sjj=cstr(Int((8999 * Rnd) + 1000))
'����billnoΪ��ϲ֧��ƽ̨�Ƽ���׼������
billno=ymd&xiaoshi&fenzhong&miao&sjj

'�Զ����ֶ�1��2
custom1=Request("custom1")
custom2=Request("custom2")

'ѡ���֧��;��,1�����п�֧����2����Ѷ�绰֧����3�������ǿ�֧����4���ֻ�����ע�ᣬ5����Ѷ�Ƹ�֧ͨ����6����ѶQ��֧����7�������г�ֵ��֧����8��ʢ����Ϸ�㿨֧����9��֧����֧����10���ֻ�����֧����11���������֧����
payvia=Request("payvia")

post_md5info=Ucase(trim(md5(reg_userid&amount&ymd&receive_url&billno&custom1&custom2&payvia&paykey&pay_mode)))

%>
<HTML><HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE>�����ύҳ��</TITLE>
</HEAD>
<BODY onload='document.forms[0].submit();'>
<form name=form1 method="get" action="http://pay.168reg.cn/pay.do">
<input type=hidden name="reg_userid" value="<%=reg_userid%>">
<input type=hidden name="servicename" value="<%=servicename%>">
<input type=hidden name="amount" value="<%=amount%>">
<input type=hidden name="ymd" value="<%=ymd%>">
<input type=hidden name="receive_url" value="<%=receive_url%>">
<input type=hidden name="billno" value="<%=billno%>">
<input type=hidden name="custom1name" value="<%=custom1_name%>">
<input type=hidden name="custom1" value="<%=custom1%>">
<input type=hidden name="custom2name" value="<%=custom2_name%>">
<input type=hidden name="custom2" value="<%=custom2%>">
<input type=hidden name="paymode" value="<%=pay_mode%>">
<input type=hidden name="payvia" value="<%=payvia%>">
<input type=hidden name="post_md5info" value="<%=post_md5info%>">
</form>
<form name=form2 method="get" action="http://pay.168reg.cn/pay.do">
<input type=hidden name="reg_userid" value="<%=reg_userid%>">
<input type=hidden name="servicename" value="<%=servicename%>">
<input type=hidden name="amount" value="<%=amount%>">
<input type=hidden name="ymd" value="<%=ymd%>">
<input type=hidden name="receive_url" value="<%=receive_url%>">
<input type=hidden name="billno" value="<%=billno%>">
<input type=hidden name="custom1name" value="<%=custom1_name%>">
<input type=hidden name="custom1" value="<%=custom1%>">
<input type=hidden name="custom2name" value="<%=custom2_name%>">
<input type=hidden name="custom2" value="<%=custom2%>">
<input type=hidden name="paymode" value="<%=pay_mode%>">
<input type=hidden name="payvia" value="<%=payvia%>">
<input type=hidden name="post_md5info" value="<%=post_md5info%>">
���������ɣ�����<input type="submit" value="����֧��" name="submit">��
</form>
</BODY></HTML>