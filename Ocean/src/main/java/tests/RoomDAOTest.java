package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import DAO.RoomDAO;
import models.AddRoomServlet;
import java.util.List;

/**
 * Test Rationale:
 * This test suite automates the verification of Room Management logic.
 * It ensures that room data can be persisted (Saved) and retrieved (Fetched)
 * from the MySQL database correctly.
 */
public class RoomDAOTest {

    RoomDAO dao = new RoomDAO();

    @Test
    void testAddRoomSuccess() {
        // 1. Arrange: Define Test Data
        // Requirement: System must support adding a room with details and an image reference.
        AddRoomServlet room = new AddRoomServlet("R-101", "Luxury", 25000.0, "Ocean View", "luxury_room.jpg");

        // 2. Act: Execute Automation
        boolean isSaved = dao.addRoom(room);

        // 3. Assert: Verify Outcome
        assertTrue(isSaved, "The room should be saved successfully in the database.");
    }

    @Test
    void testGetAllRooms() {
        // 1. Act: Fetch all rooms using the DAO method
        List<AddRoomServlet> roomList = dao.getAllRooms();

        // 2. Assert: Verification for Data Traceability
        // Traceability: Ensures the 'SELECT *' query returns a valid list of rooms.
        assertNotNull(roomList, "The room list should not be null.");
        
        // At least one room should exist if testAddRoomSuccess() ran before this or data exists in DB.
        System.out.println("Total rooms fetched: " + roomList.size());
    }
}