<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String ITEMNO = request.getParameter("ITEMNO");

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from stockdetails where ITEMNO='"+ITEMNO+"' ");
	response.sendRedirect("viewStockDetails.jsp?msg=delete");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("viewStockDetails.jsp?msg=wrong");
}
%>