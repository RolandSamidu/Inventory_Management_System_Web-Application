<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String username = request.getParameter("username");
String pnumber = request.getParameter("pnumber");
String email = request.getParameter("email");
String password = request.getParameter("password");
String privilege = request.getParameter("privilege");

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update users set firstname='"+firstname+"' , lastname='"+lastname+"' , username='"+username+"' , pnumber='"+pnumber+"' , email='"+email+"' , password='"+password+"' , privilege='"+privilege+"' where email='"+email+"' ");
	response.sendRedirect("viewUserDetails.jsp?msg=done");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("viewUserDetails.jsp?msg=wrong");
}
%>