package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import DAO.ReceptionistDAO;
import models.Receptionist;
import java.util.List;


public class ReceptionistDAOTest {

    ReceptionistDAO dao = new ReceptionistDAO();

    @Test
    void testReceptionistLifecycle() {
        
        Receptionist newRec = new Receptionist("Nimal", "Silva", "nimal@ocean.com", 
                                              "0715566778", "Galle Road, Colombo", 
                                              "nimal_admin", "pass123");
        
        boolean isRegistered = dao.registerReceptionist(newRec);
        assertTrue(isRegistered, "Registration should return true upon success.");

     
        boolean isValid = dao.validate("nimal_admin", "pass123");
        assertTrue(isValid, "Validation should pass for correct username and password.");

        
        boolean isUpdated = dao.updateReceptionist("nimal_new@ocean.com", "0112233445", 
                                                   "New Address, Kandy", "nimal_admin");
        assertTrue(isUpdated, "Update should return true for existing username.");

        
        List<Receptionist> list = dao.getAllReceptionists();
        assertNotNull(list, "Receptionist list should not be null.");
        
        
        boolean isDeleted = dao.deleteReceptionist("nimal_admin");
        assertTrue(isDeleted, "Deletion should be successful for the test user.");
    }
}