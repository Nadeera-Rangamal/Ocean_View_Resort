package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import DAO.BillingDAO;
import models.GuestBilling;

public class BillingDAOTest {

    @Test
    void testSaveBillingSuccess() {
        
        BillingDAO dao = new BillingDAO();
        GuestBilling bill = new GuestBilling();
        
        bill.setReservation_no("RES1001");
        bill.setGuest_name("Nadeera");
        bill.setRoom_no("A01");
        bill.setCheck_in("2026-03-01");
        bill.setCheck_out("2026-03-05");
        bill.setNum_nights(4);
        bill.setRoom_rate(5000.0);
        bill.setRoom_charges(20000.0);
        bill.setAdditional_charges(1000.0);
        bill.setTax(2100.0);
        bill.setTotal_amount(23100.0);
        bill.setPayment_method("Credit Card");

        
        boolean result = dao.saveBilling(bill);

        
        assertTrue(result, "Billing details should be saved successfully to the database");
    }
}