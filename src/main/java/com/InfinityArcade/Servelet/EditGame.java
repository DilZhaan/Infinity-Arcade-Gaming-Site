package com.InfinityArcade.Servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

import com.InfinityArcade.models.*;
import com.InfinityArcade.util.FileUploadUtil;
import com.InfinityArcade.util.GameManager;

@MultipartConfig // Required annotation to handle file uploads
public class EditGame extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Game newGame = new Game();
        
        // Retrieve form data
        newGame.setGameID(request.getParameter("gameID"));
        newGame.setGameName(request.getParameter("gameName"));
        newGame.setGameTitle(request.getParameter("gameTitle"));
        newGame.setDesc(request.getParameter("desc"));
        newGame.setDevName(request.getParameter("devName"));
        newGame.setPrice(Double.parseDouble(request.getParameter("price")));
        newGame.setGenre(request.getParameter("genre"));
        newGame.setTags(request.getParameter("tags"));

        Part filePart = request.getPart("img");
        
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        FileUploadUtil fileUploadUtil = new FileUploadUtil(uploadPath);
        
        try {
            String relativePath = fileUploadUtil.uploadFile(filePart);  // Upload file and get relative path
            newGame.setImg(relativePath);
        } catch (IOException e) {
            response.getWriter().println("File upload failed: " + e.getMessage());
            return;
        }

        GameManager.updateGame(newGame);
        response.sendRedirect("shop.jsp");
    }
}
