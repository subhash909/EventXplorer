<%-- 
    Document   : Demo
    Created on : Feb 9, 2017, 12:00:33 AM
    Author     : sureaj negi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="beans.Demo,java.io.*" %>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.util.*,java.text.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin page</h1>
        <a href="pages/index.html">Admin</a>
        <%
            
            SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");      
            Date d=new Date();
            out.println(d);
            String s1=dt.format(d).toString();
        %>
        <%= s1%>
    
    
    </body>
</html>
