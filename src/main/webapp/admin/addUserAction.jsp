<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String pnumber=request.getParameter("pnumber");
String email=request.getParameter("email");
String password=request.getParameter("password");
String privilege=request.getParameter("privilege");

try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("Insert into users values(?,?,?,?,?,?,?)");
	ps.setString(1, firstname);
	ps.setString(2, lastname);
	ps.setString(3, username);
	ps.setString(4, pnumber);
	ps.setString(5, email);
	ps.setString(6, password);
	ps.setString(7, privilege);
	ps.executeUpdate();
	response.sendRedirect("viewUserDetails.jsp?msg=valid");
}
catch(Exception e){
	/* String errorMessage = "An error occurred: " + e.getMessage();
	request.setAttribute("errorMessage", errorMessage);
	RequestDispatcher dispatcher = request.getRequestDispatcher("viewUserDetails.jsp");
	dispatcher.forward(request, response); */

	System.out.println(e);
	response.sendRedirect("viewUserDetails.jsp?msg=wrong");
	
}

%>
