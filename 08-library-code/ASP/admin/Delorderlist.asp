<%@ LANGUAGE="VBScript" %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<%
dim SQL, Rs, contentID,CurrentPage
CurrentPage = request("Page")
contentID=clng(request("ID"))

set rs=server.createobject("adodb.recordset")
sqltext="delete from OrderList where id="&contentID
rs.open sqltext,conn,3,3
set rs=nothing

conn.close

response.redirect "Manage_Eshop.asp?page="&CurrentPage
%>