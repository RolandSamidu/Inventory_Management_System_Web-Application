package Servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class PrintBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        double cash = Double.parseDouble(request.getParameter("CASH"));
        double total = Double.parseDouble(request.getParameter("TOTAL"));
        double discount = Double.parseDouble(request.getParameter("DISCOUNT"));
    
        double totalCost = Double.parseDouble(request.getParameter("TOTALCOST"));
        double balance = Double.parseDouble(request.getParameter("BALANCE"));
        String description = request.getParameter("DESCRIPTION");

        // Calculate total cost and balance
        totalCost = total - discount;
        balance = cash - totalCost;

        // Generate bill
        out.println("<h2>Bill Details: </h2>");
        out.println("<p>Total: " + total + "</p>");
        out.println("<p>Discount: " + discount + "</p>");
        out.println("<p>Total Cost: " + totalCost + "</p>");
        out.println("<p>Cash: " + cash + "</p>");
        out.println("<p>Balance: " + balance + "</p>");
        out.println("<p>Description: " + description + "</p>");

        // Further processing and printing logic (e.g., save bill details in a database, print bill)

        // Close PrintWriter
        out.close();
    }
}

