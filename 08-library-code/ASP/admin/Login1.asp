<%@language=vbscript codepage=936 %>
<%
'=================================
★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★
★                                                                  ★
☆ （请保留此处版权信息，这些内容并不会对您的网站运行有任何影响）   ☆
★                                                                  ★
☆                亚光（福建）有限公司                              ☆
★                                                                  ★
☆  版权所有: yagn.cn                                               ☆
★                                                                  ★
☆  程序制作: 亚光（福建）有限公司                                  ☆
★            email:syklw@hotmail.com                               ★
☆            Tel:13004808633    QQ:56786508                        ☆
★                                                                  ★
☆  相关网址: http://www.yagn.cn                                    ☆
★                                                                  ★
☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'=================================
%>
<%
option explicit
'强制浏览器重新访问服务器下载页面，而不是从缓存读取页面
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
'主要是使随机出现的图片数字随机
%>
<html>
<head>
<title>管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY
{
	FONT-FAMILY: "宋体";
	FONT-SIZE: 9pt;
	text-decoration: none;
	line-height: 150%;
	background-color: #FBFDFF;
	FONT-SIZE: 9pt;background:#ffffff;
text-decoration: none;
SCROLLBAR-FACE-COLOR: #C6EBDE;
SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #39867B; SCROLLBAR-3DLIGHT-COLOR: #39867B; SCROLLBAR-ARROW-COLOR: #330000; SCROLLBAR-TRACK-COLOR: #E2F3F1; SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
}
TD{	FONT-FAMILY: "宋体";	FONT-SIZE: 9pt;}
Input{	FONT-SIZE: 9pt;	HEIGHT: 20px;}
Button{	FONT-SIZE: 9pt;	HEIGHT: 20px; }
Select{	FONT-SIZE: 9pt;	HEIGHT: 20px;}
A{	TEXT-DECORATION: none;	color: #000000;}
A:hover{	COLOR: #428EFF;	text-decoration: underline;}
.title{	background:url(Images/topBar_bg.gif);}
.border{	border: 1px solid #39867B;}
.tdbg{	background:#E1F4EE;	line-height: 120%;}
.topbg{	background:url(Images/topbg.gif);	color: #FFFFFF;}
.bgcolor {	background-color: #91BCE3;}
-->
</style>
<script language=javascript>
<!--
function SetFocus()
{
if (document.Login.UserName.value=="")
	document.Login.UserName.focus();
else
	document.Login.UserName.select();
}
function CheckForm()
{
	if(document.Login.UserName.value=="")
	{
		alert("请输入用户名！");
		document.Login.UserName.focus();
		return false;
	}
	if(document.Login.Password.value == "")
	{
		alert("请输入密码！");
		document.Login.Password.focus();
		return false;
	}
	if (document.Login.CheckCode.value==""){
       alert ("请输入您的验证码！");
       document.Login.CheckCode.focus();
       return(false);
    }
}

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
    alert("亚光（福建）公司友情提示：\n    你使用的是Netscape浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      alert("亚光（福建）公司友情提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  }
}
//-->
</script>
</head>
<body class="bgcolor">
<p>&nbsp;</p>
<center>
<table border=1 borderColor=#6699CC cellPadding=4 cellSpacing=1 width=450 style="border-collapse: collapse" align=center >
	<tr valign="baseline"> 
		<td align="right" background=image/b1.gif>
        <div align="center"><font color="#000000" style="font-size: 10.5pt;"> 
          <strong>亚光（福建）公司 企业公司网站管理系统</strong></font></div>
      </td>
	</tr>
	<tr valign="baseline"> 
		<td bgcolor=#EFF1F3 align=center valign=middle height=60> 
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width=20> </td>
					
            <td width=150>
              <div align="center"><img src="Image/admin_p.gif" width="90" height="100" border="0" usemap="#Map"> 
              </div>
            </td>
					<td width=280>
<form name="Login" action="Admin_ChkLogin.asp" method="post" target="_parent" onSubmit="return CheckForm();">
	<table width="100%" border="0" cellspacing="8" cellpadding="0" align="center">
		<tr align="center"> 
			<td height="38" colspan="2"><font color="#000000" size="3"><strong>管理员登录</strong></font> 
			</td>
		</tr>
		<tr> 
			<td align="right"><font color="#000000">用户名称：</font></td>
			<td><input name="UserName"  type="text"  id="UserName4" maxlength="20" style="width:160px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onmouseover="this.style.background='#FDE8FE';" onmouseout="this.style.background='#FFFFFF'" onFocus="this.select(); "></td>
		</tr>
		<tr> 
			<td align="right"><font color="#000000">用户密码：</font></td>
			<td><input name="Password"  type="password" maxlength="20" style="width:160px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onmouseover="this.style.background='#FDE8FE';" onmouseout="this.style.background='#FFFFFF'" onFocus="this.select(); "></td>
		</tr>
		<tr> 
			<td align="right"><font color="#00000">验 证 码：</font></td>
			<td><input name="CheckCode" size="6" maxlength="4" style="border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onmouseover="this.style.background='#FDE8FE';" onmouseout="this.style.background='#FFFFFF'" onFocus="this.select(); ">
				<font color="#FF0000">请在左边输入</font>            <img src="inc/checkcode.asp"></td>
		</tr>
		<tr> 
			<td colspan="2"> <div align="center"> &nbsp;&nbsp;&nbsp;&nbsp;
				<input   type="submit" name="Submit" value=" 确&nbsp;认 " style="font-size: 9pt; height: 19; width: 60; color: #000000; background-color: #FFCCFF; border: 1 solid #336600" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#FFCCFF'">
				&nbsp; 
				<input name="reset" type="reset"  id="reset" value=" 清&nbsp;除 " style="font-size: 9pt; height: 19; width: 60; color: #000000; background-color: #FFCCFF; border: 1 solid #336600" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#FFCCFF'"><br>
				</div></td>
		</tr>
	</table>
</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
  <br>
  <a href="http://www.yagn.cn/"><font color="#990000"><b>亚光（福建）有限公司</b></font></a> 
  <a href="http://www.yagn.cn/"><font color="#990000"><b>Tel:13004808633 
  QQ:56786508 </b></font></a> 
</center>
<p align="center">&nbsp;</p>

<script language="JavaScript" type="text/JavaScript">
CheckBrowser();
SetFocus(); 
</script>
<map name="Map"> 
  <area shape="rect" coords="-15,33,108,68" href="http://www.yagn.cn/" target="_blank" alt="亚光（福建）有限公司" title="">
</map>
</body>
</html>
