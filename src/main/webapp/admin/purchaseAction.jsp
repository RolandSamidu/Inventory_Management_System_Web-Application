<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String pid = request.getParameter("ITEMNO");
String product_name = request.getParameter("ITEMNAME");
int quantity=1;
double product_price = 0;
double product_total = 0;
double cart_total = 0;

int z=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from stockdetails where ITEMNO='"+pid+"' ");
	while(rs.next()){
		product_price = rs.getDouble(4);
		product_total = product_price;
	}
	ResultSet rs1 = st.executeQuery("select * from cart where pid='"+pid+"' ");
	while(rs1.next())
	{
		cart_total = rs1.getDouble(5);
		cart_total = cart_total + product_total;
		quantity = rs.getInt(3);
		quantity = quantity + 1;
		z=1;
	}
	if(z==1){
		st.executeUpdate("update cart set total = '"+cart_total+"', quantity='"+quantity+"' where pid='"+pid+"' ");
		response.sendRedirect("viewStockDetails.jsp?msg=exist");
	}
	if(z==0){
		PreparedStatement ps = con.prepareStatement("insert into cart(pid,quantity,price,total) values(?,?,?,?)");
		ps.setString(1, pid);
		ps.setInt(2, quantity);
		ps.setDouble(3, product_price);
		ps.setDouble(4, product_total);
		ps.executeUpdate();
		response.sendRedirect("viewStockDetails.jsp?msg=addToCart");
	}
	
}
catch(Exception e){

	System.out.println(e);
	response.sendRedirect("viewStockDetails.jsp?msg=wrong");
}

%>