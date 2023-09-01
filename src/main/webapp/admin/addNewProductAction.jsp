<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String ITEMNO=request.getParameter("ITEMNO");
String ITEMNAME=request.getParameter("ITEMNAME");
String QTY=request.getParameter("QTY");
String UNITPRICE=request.getParameter("UNITPRICE");
String IMAGENAME=request.getParameter("IMAGENAME");
String IMAGEPATH=request.getParameter("IMAGEPATH");
String REORDERLEVEL=request.getParameter("REORDERLEVEL");

try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("Insert into stockdetails values(?,?,?,?,?,?,?)");
	ps.setString(1, ITEMNO);
	ps.setString(2, ITEMNAME);
	ps.setString(3, UNITPRICE);
	ps.setString(4, UNITPRICE);
	ps.setString(5, IMAGENAME);
	ps.setString(6, IMAGEPATH);
	ps.setString(7, REORDERLEVEL);
	ps.executeUpdate();
	response.sendRedirect("viewStockDetails.jsp?msg=add");
}
catch(Exception e){
	String errorMessage = "An error occurred: " + e.getMessage();
	request.setAttribute("errorMessage", errorMessage);
	RequestDispatcher dispatcher = request.getRequestDispatcher("AddItem.jsp");
	dispatcher.forward(request, response);

	System.out.println(e);
	response.sendRedirect("viewStockDetails.jsp?msg=wrong");
}

%>