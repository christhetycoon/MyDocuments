<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="../Inc/Config.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
ID=Request.Form("ID")
Content=trim(request.form("Content"))
UploadFiles=trim(request.form("UploadFiles"))
Action=trim(request("Action"))



if founderr=false then
	Title=dvhtmlencode(Title)	
	if Infotime<>"" and IsDate(Infotime)=true then
		Infotime=CDate(Infotime)
	else
		Infotime=now()
	end if
	
	if Hits<>"" then
		Hits=CLng(Hits)
	else
		Hits=0
	end if
	
	set rs=server.createobject("adodb.recordset")
  		if ID<>"" then
			sql="select * from AboutUs where id="&ID
			rs.open sql,conn,1,3
			if not (rs.bof and rs.eof) then
			    
				call SaveData()				
				rs.update
				rs.close
				set rs=nothing
	            response.redirect "Default.asp"
 			else
				founderr=true
				errmsg=errmsg+"<li>���ݿ����</li>"
				call WriteErrMsg()
			end if
		else
			founderr=true
			errmsg=errmsg+"<li>����ȷ��ID��ֵ</li>"
			call WriteErrMsg()
		end if
	call CloseConn()
else
	WriteErrMsg
end if
%>

<%
sub SaveData()  
  rs("Content")=Content
   
  '***************************************
	'ɾ�����õ��ϴ��ļ�
	if ObjInstalled=True and UploadFiles<>"" then
		dim fso,strRubbishFile
		Set fso = Server.CreateObject("Scripting.FileSystemObject")
		if instr(UploadFiles,"|")>1 then
			dim arrUploadFiles,intTemp
			arrUploadFiles=split(UploadFiles,"|")
			UploadFiles=""
			for intTemp=0 to ubound(arrUploadFiles)
				if instr(Content,arrUploadFiles(intTemp))<=0 and arrUploadFiles(intTemp)<>FirstImageName then
					strRubbishFile=server.MapPath("../" & arrUploadFiles(intTemp))
					if fso.FileExists(strRubbishFile) then
						fso.DeleteFile(strRubbishFile)
						response.write "<br><li>" & arrUploadFiles(intTemp) & "��������û���õ���Ҳû�б���Ϊ��ҳͼƬ�������Ѿ���ɾ����</li>"
					end if
				else
					if intTemp=0 then
						UploadFiles=arrUploadFiles(intTemp)
					else
						UploadFiles=UploadFiles & "|" & arrUploadFiles(intTemp)
					end if
				end if
			next
		else
			if instr(Content,UploadFiles)<=0 and UploadFiles<>FirstImageName then
				strRubbishFile=server.MapPath("../" & UploadFiles)
				if fso.FileExists(strRubbishFile) then
					fso.DeleteFile(strRubbishFile)
					response.write "<br><li>" & UploadFiles & "��������û���õ���Ҳû�б���Ϊ��ҳͼƬ�������Ѿ���ɾ����</li>"
				end if
				UploadFiles=""
			end if
		end if
		set fso=nothing
	end If
	'����
	'***************************************  
  rs("UploadFiles")=UploadFiles
end sub
%>

