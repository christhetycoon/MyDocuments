<!--#include file="class.asp"-->
<%
Server.ScriptTimeout = 300
Response.CacheControl = "no-cache"
Session.TimeOut = 60

'�ļ�����·��
path="files/"

'�ļ���С����K
fsize=200

'�����ϴ�����
ext=Array("jpg","gif","bmp","zip","rar","doc","xls")

'����ļ�����
function checkext(str)
	flat=false
	if str<>"" then
		for i=0 to ubound(ext)
			if str=ext(i) then
				flat=true
			end if
		next
	end if
	checkext=flat
end function

'�����ϴ��ļ���
function MakedownName()
	dim fname
	randomize
	fname = now()
	fname = replace(fname,"-","")
	fname = replace(fname," ","") 
	fname = replace(fname,":","")
	fname = replace(fname,"PM","")
	fname = replace(fname,"AM","")
	fname = replace(fname,"����","")
	fname = replace(fname,"����","")
	fname = int(fname) + int((100-1+1)*Rnd + 1)
	MakedownName=fname
end function

set upload=new upload_5xsoft
for each filea in upload.objFile
	set file=upload.file(filea)
	if checkext(lcase(right(file.filename,3))) then
		file.SaveAs Server.MapPath(path & MakedownName & right(file.filename,4))
		'�˴����д�����ݿ��¼
		response.Write(path & MakedownName & right(file.filename,4)) 
	end if
next
%>