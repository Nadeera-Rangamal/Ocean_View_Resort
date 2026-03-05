package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import models.AddRoomServlet;
import DAO.RoomDAO;

@WebServlet("/AddRoomServlet")
@MultipartConfig
public class roomadd extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomNum = request.getParameter("room_number");
        String type = request.getParameter("room_type");
        double price = Double.parseDouble(request.getParameter("price"));
        String desc = request.getParameter("description");

        // Image handling
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();
        
        
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); 

       
        try (InputStream is = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(uploadPath + File.separator + fileName)) {
            
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
        } catch (Exception e) {
            e.printStackTrace();
        }

        
        AddRoomServlet room = new AddRoomServlet(roomNum, type, price, desc, fileName);

        RoomDAO dao = new RoomDAO();
        boolean success = dao.addRoom(room);

        if (success) {
            response.sendRedirect("admin.jsp?status=success");
        } else {
            response.sendRedirect("admin.jsp?status=error");
        }
    }
}