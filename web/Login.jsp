<%-- 
    Authenticate User is valid or not
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.*,org.hibernate.Transaction,org.hibernate.Criteria,org.hibernate.criterion.Criterion"%>
<%@page import="hib_beans.*"%>
<%@page session="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ServletContext ctx=request.getServletContext();
            SessionFactory sf=(SessionFactory)ctx.getAttribute("hibsessionf");
            Session ss=sf.openSession();
            Criteria cr=ss.createCriteria("hib_beans.User");
            Criterion cr1=Restrictions.eq("uemail",request.getParameter("uemail"));
            Criterion cr2=Restrictions.eq("upass",request.getParameter("upass"));
            cr.add(cr1);
            cr.add(cr2);
            User u=(User)cr.uniqueResult();
            if(u!=null){
                HttpSession hs=request.getSession();
                hs.setMaxInactiveInterval(180);
                hs.setAttribute("uid",u.getUid());
                hs.setAttribute("uemail",u.getUemail());
                hs.setAttribute("upass",u.getUpass());
                Transaction t=ss.beginTransaction();
                String hql="update User set uactive='true' where uid="+u.getUid();
                Query q=ss.createQuery(hql);
                q.executeUpdate();
                
                t.commit();
                ss.close();
                response.sendRedirect("index.jsp");
            }
            else{
                out.println("Invalid Emial or Password");
            }

        %>
    
    
    </body>
</html>
