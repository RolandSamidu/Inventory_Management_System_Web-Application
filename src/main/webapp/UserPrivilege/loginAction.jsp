<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%

String email=request.getParameter("email");
String password=request.getParameter("password");
/* String privilege=request.getParameter("privilege"); */
if ("admin@gmail.com".equals(email) && "admin".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("../admin/adminDashboard.jsp");
}
else
{
	int z= 0;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
		while(rs.next())
		{
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("../userHome.jsp");
		}
		if (z==0)
		     response.sendRedirect("login.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
		
		String errorMessage = "An error occurred: " + e.getMessage();
		request.setAttribute("errorMessage", errorMessage);
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
		
	}
}

%>