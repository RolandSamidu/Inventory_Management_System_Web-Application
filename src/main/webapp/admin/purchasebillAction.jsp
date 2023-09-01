<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date" %>

<%
String pid=request.getParameter("purchaseId");
String quantity=request.getParameter("quantity");
String TOTALCOST=request.getParameter("TOTALCOST");
Date currentDate = new Date(); // Get the current date

try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("Insert into purchase (pid, no_items, totalprice, date) values(?,?,?,?)");
	ps.setString(1, pid);
	ps.setString(2, quantity);
	ps.setString(3, TOTALCOST);
	ps.setDate(4, new java.sql.Date(currentDate.getTime())); // Set the current date
	ps.executeUpdate();
	response.sendRedirect("purchase.jsp?msg=add");
}
catch(Exception e){
	String errorMessage = "An error occurred: " + e.getMessage();
	request.setAttribute("errorMessage", errorMessage);
	RequestDispatcher dispatcher = request.getRequestDispatcher("purchase.jsp");
	dispatcher.forward(request, response);

	System.out.println(e);
	response.sendRedirect("purchase.jsp?msg=wrong");
}

%>