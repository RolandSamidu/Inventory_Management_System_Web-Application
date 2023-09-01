<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String pid = request.getParameter("pid");
String incDec = request.getParameter("quantity");
double price = 0;
double total = 0;
int quantity = 0;
double final_total = 0;

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE pid='" + pid + "'");
    if (rs.next()) {
        price = rs.getDouble(4);
        total = rs.getDouble(5);
        quantity = rs.getInt(3);

        if (quantity == 1 && incDec.equals("dec"))
            response.sendRedirect("purchase.jsp?msg=notPossible");
        else if (quantity != 1 && incDec.equals("dec")) {
            total = total - price;
            quantity = quantity - 1;

            PreparedStatement updateCartStmt = con.prepareStatement("UPDATE cart SET total=?, quantity=? WHERE pid=?");
            updateCartStmt.setDouble(1, total);
            updateCartStmt.setInt(2, quantity);
            updateCartStmt.setString(3, pid);
            updateCartStmt.executeUpdate();

         // Get the current stock quantity from stockdetails
            ResultSet stockRs = st.executeQuery("SELECT QTY FROM stockdetails WHERE ITEMNO='" + pid + "'");
            if (stockRs.next()) {
                int stockQuantity = stockRs.getInt(1);

                // Update the stock quantity
                int updatedStockQuantity = stockQuantity + 1;
                PreparedStatement updateStockStmt = con.prepareStatement("UPDATE stockdetails SET QTY='" + updatedStockQuantity + "' WHERE ITEMNO='" + pid + "'");
                updateStockStmt.executeUpdate();
            }

            response.sendRedirect("purchase.jsp?msg=dec");
        } else {
            total = total + price;
            quantity = quantity + 1;

            PreparedStatement updateCartStmt = con.prepareStatement("UPDATE cart SET total=?, quantity=? WHERE pid=?");
            updateCartStmt.setDouble(1, total);
            updateCartStmt.setInt(2, quantity);
            updateCartStmt.setString(3, pid);
            updateCartStmt.executeUpdate();

            // Get the current stock quantity from stockdetails
            ResultSet stockRs = st.executeQuery("SELECT QTY FROM stockdetails WHERE ITEMNO='" + pid + "'");
            if (stockRs.next()) {
                int stockQuantity = stockRs.getInt(1);

                // Update the stock quantity
                int updatedStockQuantity = stockQuantity - 1;
                PreparedStatement updateStockStmt = con.prepareStatement("UPDATE stockdetails SET QTY='" + updatedStockQuantity + "' WHERE ITEMNO='" + pid + "'");
                updateStockStmt.executeUpdate();
            }

            response.sendRedirect("purchase.jsp?msg=inc");
        }
    }

} catch (Exception e) {
    System.out.println(e);
}
%>
