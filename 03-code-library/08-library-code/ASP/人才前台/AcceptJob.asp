<!--#include file="syscode.asp" -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="1" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">�˲���Ƹ</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="Job.asp">�� �� �� Ƹ</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="Jobs.asp">�� �� �� 
                    ��</a></div></td>
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
                        �� �� Ƹ</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <TR vAlign=top > 
                      <TD  width="80%" height="18"> <form method="post" action="SaveAcceptJob.asp">
                          <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr> 
                              <td width="100%"> <div align="center"> 
                                  <table width="100%" height="79"
border="0" align="center" cellpadding="0" cellspacing="3">
                                    <tr> 
                                      <%job=request("job")%>
                                      <td width="23%" height="25" align="right">ӦƸ��λ�� 
                                      </td>
                                      <td width="77%" height="25"><b><%=job%></b> <input name="jobname" type="hidden" value="<%=job%>"></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">�� 
                                        ����</td>
                                      <td width="77%" height="-6"><font> 
                                        <input name="mane" type="text" class="smallInput" id="mane" style="font-size: 14px" size="12" maxlength="16">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">�� ��</td>
                                      <td width="77%" height="-2"><font> 
                                        <select name="sex">
                                          <option value="��" selected>��</option>
                                          <option value="Ů">Ů</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">�������ڣ�</td>
                                      <td width="77%" height="-1"> <input name="birthday" type="text" class="smallInput" id="birthday" style="font-size: 14px" size="14" maxlength="30">
                                        ��ʽ��1976-02-02 </td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">����״����</td>
                                      <td width="77%" height="11"><font> 
                                        <select name="marry">
                                          <option value="δ��" selected>δ��</option>
                                          <option value="�ѻ�">�ѻ�</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ҵԺУ��</td>
                                      <td width="77%" height="11"><font> 
                                        <input name="school" type="text" class="smallInput" id="school" style="font-size: 14px" size="30" maxlength="50">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="25" align="right">ѧ 
                                        ���� </td>
                                      <td width="77%" height="-6"><input name="studydegree" type="text" class="smallInput" id="studydegree" style="font-size: 14px" size="10" maxlength="16"></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">ר ҵ��</td>
                                      <td width="77%" height="-3"><font> 
                                        <input name="specialty" type="text" class="smallInput" id="specialty" style="font-size: 14px" size="10" maxlength="30">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ҵʱ�䣺</td>
                                      <td width="77%" height="-2"> <input name="gradyear" type="text" class="smallInput" id="gradyear" style="font-size: 14px" size="14" maxlength="30">
                                        ��ʽ��1998-7��</td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">�� ����</td>
                                      <td width="77%" height="-1"><font> 
                                        <input name="telephone" type="text" class="smallInput" id="telephone" style="font-size: 14px" size="16" maxlength="30">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">E-mail��</td>
                                      <td width="77%" height="-6"><font> 
                                        <input name="email" type="text" class="smallInput" id="email" style="font-size: 14px" size="20" maxlength="30">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">��ϵ��ַ��</td>
                                      <td width="77%" height="-3"><font> 
                                        <input name="address" type="text" class="smallInput" id="address" style="font-size: 14px" size="30" maxlength="50">
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">ˮƽ��������</td>
                                      <td width="77%" height="-2"><font> 
                                        <textarea name="ability" cols="50" rows="8" class="smallInput" id="ability" style="font-size: 14px"></textarea>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td height="25" align="right">���˼�����</td>
                                      <td width="77%" height="-1"><font> 
                                        <textarea name="resumes" cols="50" rows="8" class="smallInput" id="resumes" style="font-size: 14px"></textarea>
                                        </font></td>
                                    </tr>
                                    <tr> 
                                      <td width="23%" height="0" valign="top"> 
                                      </td>
                                      <td width="77%" height="0" valign="top"> 
                                        <input type="submit" value="�ύ����"
name="cmdOk"> <input type="reset" value="��д" name="cmdReset"> </td>
                                    </tr>
                                  </table>
                                </div></td>
                            </tr>
                          </table>
                        </form></TD>
                    </TR>
                  </table> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY></HTML>
