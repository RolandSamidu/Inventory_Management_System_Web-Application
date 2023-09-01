<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String NOOFITEMS = request.getParameter("NOOFITEMS");
String CASH = request.getParameter("CASH");
String TOTAL = request.getParameter("TOTAL");
String DISCOUNT = request.getParameter("DISCOUNT");
String DESCRIPTION = "";

double cash = Double.parseDouble(CASH);
double total = Double.parseDouble(TOTAL);
double discount = Double.parseDouble(DISCOUNT);

double BALANCE = 0;

try {
	int z = 0;
	total = total * (discount / 100);
	BALANCE = cash - total;

	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("Insert into transaction values(?,?,?,?,?,?)");
	ps.setString(1, NOOFITEMS);
	ps.setDouble(2, cash);
	ps.setDouble(3, total);
	ps.setDouble(4, discount);
	ps.setDouble(5, BALANCE);
	ps.setString(6, DESCRIPTION);

	ps.executeUpdate();
	response.sendRedirect("purchase.jsp?msg=good");

} catch (Exception e) {
	String errorMessage = "An error occurred: " + e.getMessage();
	request.setAttribute("errorMessage", errorMessage);
	RequestDispatcher dispatcher = request.getRequestDispatcher("purchase.jsp");
	dispatcher.forward(request, response);

	System.out.println(e);
	response.sendRedirect("purchase.jsp?msg=wrong");
}
%>