package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import models.Guest;

public class GuestModelTest {

    @Test
    void testGuestConstructorAndGetters() {
        // 1. Arrange
        String name = "Nadeera Sampath";
        String email = "nadeera@example.com";
        String id = "950001112V";
        String addr = "123 Main St, Colombo";
        String phone = "0771234567";
        String date = "2026-05-10";
        String time = "10:30 AM";

        // 2. Act
        Guest guest = new Guest(name, email, id, addr, phone, date, time);

        // 3. Assert
        assertEquals(name, guest.getGuestName(), "Guest Name should be correctly retrieved.");
        assertEquals(email, guest.getEmail(), "Email should be correctly retrieved.");
        assertEquals(id, guest.getIdNumber(), "ID Number should be correctly retrieved.");
        assertEquals(addr, guest.getAddress(), "Address should be correctly retrieved.");
        assertEquals(phone, guest.getContact(), "Contact number should be correctly retrieved.");
        
        
        assertEquals(date, guest.getReservationDate(), "Reservation Date should be correctly retrieved.");
        assertEquals(time, guest.getReservationTime(), "Reservation Time should be correctly retrieved.");
    }

    @Test
    void testDefaultConstructor() {
        Guest guest = new Guest();
        assertNotNull(guest, "Guest object should not be null even with default constructor.");
    }
}