package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import models.LoginServlet;
import DAO.ReceptionistDAO;
import models.Receptionist;


public class LoginModelTest {

    LoginServlet loginModel = new LoginServlet();
    ReceptionistDAO receptionistDao = new ReceptionistDAO();

    @Test
    void testLoginValidation() {
        
        String testUser = "temp_tester";
        String testPass = "test1234";
        
        Receptionist tempUser = new Receptionist("Test", "User", "test@ocean.com", 
                                                "0000000000", "Test Address", 
                                                testUser, testPass);
        
        receptionistDao.registerReceptionist(tempUser);

        
        boolean loginSuccess = loginModel.validate(testUser, testPass);
        assertTrue(loginSuccess, "Login should succeed with correct credentials.");

        
        boolean loginFail = loginModel.validate(testUser, "wrong_password");
        assertFalse(loginFail, "Login should fail with incorrect password.");

        // --- 4. CLEANUP: Delete the temporary user ---
        receptionistDao.deleteReceptionist(testUser);
    }
}