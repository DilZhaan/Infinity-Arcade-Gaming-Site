package com.InfinityArcade.util;

import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

public class FileUploadUtil {

    private String uploadDirPath;

    public FileUploadUtil(String uploadDirPath) {
        this.uploadDirPath = uploadDirPath;
    }

    public String uploadFile(Part filePart) throws IOException {
        if (filePart == null) {
            throw new IOException("No file uploaded.");
        }

        // Get the file name
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        File uploadDir = new File(uploadDirPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        File uploadedFile = new File(uploadDir, fileName);

        // Write the file content to the destination file
        try (InputStream fileContent = filePart.getInputStream()) {
            filePart.write(uploadedFile.getAbsolutePath());
        }

        return "uploads/" + fileName; // Return the relative path
    }
}
