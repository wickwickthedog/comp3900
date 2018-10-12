package com.h2cg.accommodation.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.h2cg.accommodation.dto.UsersDTO;

@WebServlet(name = "uploadServlet", urlPatterns = { "/upload" }, loadOnStartup = 1)
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
		maxFileSize = 10485760L, // 10 MB
		maxRequestSize = 20971520L // 20 MB
)
public class UploadPhoto extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response, @ModelAttribute UsersDTO user, HttpSession session) throws IOException, ServletException {
		response.setContentType("text/html");
	
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent) {
			System.out.println("fail");
			return;
		}
		user = (UsersDTO) session.getAttribute("userSession");
		// gets absolute path of the web application
		String applicationPath = request.getServletContext().getRealPath("");
		// constructs path of the directory to save uploaded file
		String uploadFilePath = applicationPath + File.separator + "users";

		// creates upload folder if it does not exists
		File uploadFolder = new File(uploadFilePath);
		if (!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		Part part = (Part) request.getParts();
		part.write(uploadFilePath + File.separator + user.getUserName());
	}
}
		