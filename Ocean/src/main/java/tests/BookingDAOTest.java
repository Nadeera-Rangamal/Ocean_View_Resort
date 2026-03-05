package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import DAO.BookingDAO;
import models.Booking;
import java.util.List;
import java.sql.Date;

public class BookingDAOTest {

    BookingDAO dao = new BookingDAO();

    @Test
    void testSaveBooking() {
        
        Date checkIn = Date.valueOf("2026-04-01");
        Date checkOut = Date.valueOf("2026-04-05");
        
        Booking booking = new Booking("BOK-999", "Kamal Perera", "kamal@email.com", 
                                      "0771234567", "R-101", checkIn, checkOut, 
                                      "No 45, Colombo", "199012345V");

        // 2. Execution (Automation)
        boolean isSaved = dao.saveBooking(booking);

        // 3. Verification
        assertTrue(isSaved, "The booking should be successfully saved to the database.");
    }

    @Test
    void testGetAllBookings() {
        
        List<Booking> list = dao.getAllBookings();
        
        
        assertNotNull(list, "Booking list must not be null.");
        assertFalse(list.isEmpty(), "The booking list must not be empty.");
    }

    @Test
    void testDeleteBooking() {
        
        String resNo = "BOK-999";
        
        boolean isDeleted = dao.deleteBooking(resNo);
        
        
        assertTrue(isDeleted, "The deletion of the booking with reservation number BOK-999 should be successful.");
    }
}