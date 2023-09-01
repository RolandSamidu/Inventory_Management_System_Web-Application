<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String Email = request.getParameter("email");

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from users where email='"+Email+"' ");
	response.sendRedirect("viewUserDetails.jsp?msg=delete");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("viewUserDetails.jsp?msg=wrong");
}
%>
