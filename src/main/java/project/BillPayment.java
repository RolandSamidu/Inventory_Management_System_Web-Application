package project;
import jpos.*;
import jpos.events.*;

public class BillPayment implements JposListener {
    private POSPrinter printer;
    
    public BillPayment() {
        printer = new POSPrinter();
		/* printer.addJposListener(this); */ 
    }
    
    public void openPrinter(String printerName) {
        try {
            printer.open(printerName);
            printer.claim(1000);  // Timeout in milliseconds
            printer.setDeviceEnabled(true);
        } catch (JposException e) {
            e.printStackTrace();
            // Handle any exceptions thrown during printer setup
        }
    }
    
    public void closePrinter() {
        try {
            printer.setDeviceEnabled(false);
            printer.release();
            printer.close();
        } catch (JposException e) {
            e.printStackTrace();
            // Handle any exceptions thrown during printer shutdown
        }
    }
    
    public void printBill(String billText) {
        try {
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, billText);
        } catch (JposException e) {
            e.printStackTrace();
            // Handle any exceptions thrown during printing
        }
    }
    
    // Implement the JposListener methods
    // You can add more event handlers as needed
    
    public void directIOOccurred(DirectIOEvent event) {
        // Handle DirectIO events
    }
    
    public void errorOccurred(ErrorEvent event) {
        // Handle error events
    }
    
    public void outputCompleteOccurred(OutputCompleteEvent event) {
        // Handle output complete events
    }
    
    public void statusUpdateOccurred(StatusUpdateEvent event) {
        // Handle status update events
    }
}