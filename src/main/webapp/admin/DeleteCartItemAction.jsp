<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String pid = request.getParameter("pid");

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where pid='"+pid+"' ");
	response.sendRedirect("purchase.jsp?msg=delete");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("purchase.jsp?msg=wrong");
}
%>
