package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import models.AddRoomServlet;


public class AddRoomModelTest {

    @Test
    void testRoomModelConstructorAndGetters() {
        // 1. Arrange: Setup test data
        String roomNum = "R-101";
        String type = "Deluxe";
        double price = 12500.00;
        String desc = "Spacious room with ocean view";
        String img = "ocean_deluxe.jpg";

        // 2. Act: Create instance using the parameterized constructor
        AddRoomServlet room = new AddRoomServlet(roomNum, type, price, desc, img);

        // 3. Assert: Verify each field through Test Automation
        // Traceability: Verifies that the model correctly encapsulates room data.
        assertEquals(roomNum, room.getRoomNumber(), "Room number should match.");
        assertEquals(type, room.getRoomType(), "Room type should match.");
        assertEquals(price, room.getPrice(), "Room price should match.");
        assertEquals(desc, room.getDescription(), "Description should match.");
        assertEquals(img, room.getImageName(), "Image name should match.");
    }

    @Test
    void testDefaultConstructor() {
        // Rationale: Ensuring the object can be instantiated without parameters
        AddRoomServlet room = new AddRoomServlet();
        assertNotNull(room, "Room object should be successfully instantiated.");
    }
}