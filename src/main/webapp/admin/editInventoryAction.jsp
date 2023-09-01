<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
String ITEMNO = request.getParameter("ITEMNO");
String ITEMNAME = request.getParameter("ITEMNAME");
String QTY = request.getParameter("QTY");
String UNITPRICE = request.getParameter("UNITPRICE");
String IMAGENAME = request.getParameter("IMAGENAME");
String IMAGEPATH = request.getParameter("IMAGEPATH");
String REORDERLEVEL = request.getParameter("REORDERLEVEL");

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update stockdetails set ITEMNO='"+ITEMNO+"' , ITEMNAME='"+ITEMNAME+"' , QTY='"+QTY+"' , UNITPRICE='"+UNITPRICE+"' , IMAGENAME='"+IMAGENAME+"' , IMAGEPATH='"+IMAGEPATH+"' , REORDERLEVEL='"+REORDERLEVEL+"' where ITEMNO='"+ITEMNO+"' ");
	response.sendRedirect("viewStockDetails.jsp?msg=done");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("viewStockDetails.jsp?msg=wrong");
}
%>