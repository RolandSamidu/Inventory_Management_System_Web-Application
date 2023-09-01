<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String loginIdentifier = request.getParameter("loginIdentifier");
String password = request.getParameter("password");

int z = 0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM users WHERE (email = '" + loginIdentifier + "' OR username = '" + loginIdentifier + "') AND password = '" + password + "'");
	while (rs.next()) {
		z = 1;
		String privilege = rs.getString("privilege");
	    session.setAttribute("email", loginIdentifier);
	    if (privilege.equals("admin")) {
	        response.sendRedirect("admin/adminDashboard.jsp");
	    } else {
	        response.sendRedirect("user/userHome.jsp");
	    }
	}
	if (z == 0)
		response.sendRedirect("login.jsp?msg=valid");
} catch (Exception e) {
	String errorMessage = "An error occurred: " + e.getMessage();
	request.setAttribute("errorMessage", errorMessage);
	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	dispatcher.forward(request, response);

	System.out.println(e);
	response.sendRedirect("login.jsp?msg=invalid");

}
%>