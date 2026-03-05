package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import models.Receptionist;

public class ReceptionistModelTest {

    @Test
    void testReceptionistConstructorAndGetters() {
        // 1. Arrange: Prepare test data
        String fName = "Nadeera";
        String lName = "Sampath";
        String email = "nadeera@example.com";
        String contact = "0778899112";
        String address = "Colombo, Sri Lanka";
        String user = "nadeera_admin";
        String pass = "securePass123";

        // 2. Act: Create a new instance using the parameterized constructor
        Receptionist receptionist = new Receptionist(fName, lName, email, contact, address, user, pass);

        
        assertEquals(fName, receptionist.getFirstName(), "First Name should match");
        assertEquals(lName, receptionist.getLastName(), "Last Name should match");
        assertEquals(email, receptionist.getEmail(), "Email should match");
        assertEquals(contact, receptionist.getContact(), "Contact should match");
        assertEquals(address, receptionist.getAddress(), "Address should match");
        assertEquals(user, receptionist.getUsername(), "Username should match");
        assertEquals(pass, receptionist.getPassword(), "Password should match");
    }

    @Test
    void testDefaultConstructor() {
        // Rationale: Testing if the object can be instantiated without initial data.
        Receptionist receptionist = new Receptionist();
        assertNotNull(receptionist, "Receptionist object should be created successfully.");
    }
}