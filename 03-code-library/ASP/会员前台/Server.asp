<!--#include file="syscode.asp" -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td valign="top" bgcolor="#FFFFFF">
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">��Ա����</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="Manage.asp">�޸Ļ�Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="ManagePwd.asp">�޸Ļ�Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="E_shop.asp">���ﶩ����ѯ</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="NetBook.asp">վ����������</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="UserLogout.asp">�˳���Ա����</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">�� 
                        Ա �� ��</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <TR> 
              <TD> <%If Session("UserName")="" Then
%> <br> <br> <table width="100%" border="0" cellpadding="0" cellspacing="3">
                  <tr> 
                    <td width="19%" align="right"></td>
                    <td width="81%"> <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><font color="#006699">����û�е�¼���޷������Ա���ģ����ȵ�¼��</font></p>
                      <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"><font color="#006699">��������������ǵĻ�Ա��������<a href="UserReg.asp"><font color="#006699">ע��</font></a>��</font></p></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"></td>
                    <td width="81%"> <div align="center"> 
                        <table class="main" cellSpacing="0" cellPadding="2" width="100%" border="0" height="1">
                          <tbody>
                            <tr> 
                              <td width="100%" height="1"><% call ShowUserLogina() %></td>
                            </tr>
                          </tbody>
                        </table>
                      </div></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"></td>
                    <td width="81%"><font color="#990000"><b><font color="#006699">��Ա���������¹��ܣ�</font></b></font></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"><font color="#666666">1��</font></td>
                    <td width="81%"><font color="#666666">�޸����Ļ�Աע������</font></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right" height="14"><font color="#666666">2��</font></td>
                    <td width="81%" height="14"> <p><font color="#666666">��ѯ���Ķ������Լ������Ĵ������</font></p></td>
                  </tr>
                  <tr> 
                    <td width="19%" align="right"><font color="#666666">3��</font></td>
                    <td width="81%"><font color="#666666">ר��˽�����Բ��������ڴ˸��������ԺͲ鿴���ǵĻظ�</font></td>
                  </tr>
                  <tr> 
                    <td height="25" align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
                <%else%> 
                <TABLE width="85%" align="center" cellPadding=0 cellSpacing=0>
                          <TBODY>
                            <TR vAlign=top > 
                              <TD  width="100%"> <p style="margin-bottom: 0"><br>
                                  <br>
                                  ����<%=Session("UserName")%>��</p>
                                <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0">&nbsp; 
                                </p>
                                <p style="word-spacing: 0; margin-top: 0; margin-bottom: 0"> 
                                  �����������Ѿ������Ա�������ģ�����ֻ��ע���Ա���ܷ��ʡ������������޸�����ע����Ϣ�����������ԡ��鿴���Ƕ������ԵĴ𸴣�Ҳ���Բ�ѯ���Ķ������������������</p></TD>
                            </TR>
                          </TBODY>
                        </TABLE>
                <%end if%> </TD>
            </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
