package com.h2cg.accommodation.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.RequestContext;

import com.h2cg.accommodation.dto.UsersDTO;
import com.h2cg.accommodation.service.IUserService;
import com.h2cg.accommodation.utils.DateUtils;

@Controller
public class UserController extends BaseController {
	@Autowired
	private IUserService userService;

	/*-------------------------      Html       -------------------------------- */
	@RequestMapping("/userLoginView")
	public String toUserLogin(@RequestParam(required = false) String backUrl, Model model) {
//		model.addAttribute("backUrl",backUrl);
		return "user/userLoginView";
	}

	@RequestMapping("/userRegisterView")
	public String toUserRegister(@ModelAttribute UsersDTO userDTO) {
		return "user/userRegister";
	}
//	@RequestMapping("admin/toSearchUser")
//	public String toSearchUser() {
//
//		return "/admin/searchUserView";
//	}

	@RequestMapping("/toSearchUser2")
	public String toSearchUser2() {

		return "user/searchUserView2";
	}

//	@RequestMapping("admin/toUserActivity")
//	public String toUserActivity(@ModelAttribute UsersDTO userDTO, Model model) {
//		userDTO.setPageSize(1);
//		List<UsersDTO> userList = userService.searchUserByIdOrName(userDTO);
//		if (userList.size() != 0) {
//			userDTO = userService.searchUserByIdOrName(userDTO).get(0);
//			model.addAttribute("user", userDTO);
//
//		}
//		return "/admin/userActivityView";
//	}

	@RequestMapping("/toUpdateUser")
	public String toUpdateUser(@ModelAttribute UsersDTO user, Model model, HttpSession session) {
		user = (UsersDTO) session.getAttribute("userSession");
		model.addAttribute("user", user);
		return "user/editProfile";
	}

	@RequestMapping("/toUserProfile")
	public String toUserProfile(@ModelAttribute UsersDTO user, Model model, HttpSession session) {
//		user.setPageSize(1);
//		user = userService.searchUserByIdOrName(user).get(0);
		user = (UsersDTO) session.getAttribute("userSession");
		model.addAttribute("user", user);
		return "user/userProfile";
	}

	/*-------------------------      Methods       -------------------------------- */
//	@ResponseBody
//	@RequestMapping(value = "/searchUser", method = RequestMethod.POST)
//	public Map<String, Object> searchUser(HttpServletRequest request, @ModelAttribute("userUI") UsersDTO userDTO,
//			@RequestParam(required = false, defaultValue = "1") Integer page, Model model) throws Exception {
//		// RequestContext requestContext = new RequestContext(request);
//		String res = "success";
//		if (userDTO.getPageSize() == 0) {
//			userDTO.setPageSize(10);
//		}
//		userDTO.setRecordStart((page - 1) * userDTO.getPageSize());
//		int total = userService.countUser(userDTO);
//		List<UsersDTO> userList = userService.searchUserByIdOrName(userDTO);
//		for (UsersDTO user : userList) {
//			// user.setDobFormat(dob);
//			switch (user.getValid()) {
//			case 0:
//				user.setStatus("Invalid");
//				break;
//			case 1:
//				user.setStatus("Active");
//				break;
//			}
//		}
//		if (userList.size() == 0 || userList == null) {
//			res = "failed";
//		}
//		this.setListJson(res, userList, total);
//		return json;
//	}
//	@ResponseBody
//	@RequestMapping(value = "admin/searchUser", method = RequestMethod.POST)
//	public Map<String, Object> searchUser2(HttpServletRequest request, @ModelAttribute("userUI") UsersDTO userDTO,
//			@RequestParam(required = false, defaultValue = "1") Integer page, Model model) throws Exception {
//		// RequestContext requestContext = new RequestContext(request);
//		String res = "success";
//		if (userDTO.getPageSize() == 0) {
//			userDTO.setPageSize(10);
//		}
//		userDTO.setRecordStart((page - 1) * userDTO.getPageSize());
//		int total = userService.countUser(userDTO);
//		List<UsersDTO> userList = userService.searchUserByIdOrName(userDTO);
//		for (UsersDTO user : userList) {
//			// user.setDobFormat(dob);
//			switch (user.getBan()) {
//			case 0:
//				user.setBanName("Invalid");
//				break;
//			case 1:
//				user.setBanName("Active");
//				break;
//			}
//		}
//		if (userList.size() == 0 || userList == null) {
//			res = "failed";
//		}
//		this.setListJson(res, userList, total);
//		return json;
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "admin/changeUserStatus", method = RequestMethod.POST)
//	public Map<String, Object> changeUserStatus(HttpServletRequest request, @ModelAttribute("userUI") UsersDTO user) {
//		user.setBan(1 - user.getBan());
//		if (userService.updateUser(user) > 0) {
//			this.setTitleJson("success", "User status has been changed successfully", "Success");
//		} else {
//			this.setTitleJson("failed", "Fail to change user status", "Failue");
//		}
//		return json;
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "admin/searchUserActivity", method = RequestMethod.POST)
//	public Map<String, Object> searchUserActivity(HttpServletRequest request, @ModelAttribute("userUI") UsersDTO userDTO,
//			Model model) throws Exception {
//		// RequestContext requestContext = new RequestContext(request);
//		String res = "success";
//		// int total = userService.countUser(userDTO);
//		List<UserActivityDTO> userActList = userService.searchUserActivity(userDTO);
//		if (userActList.size() == 0 || userActList == null) {
//			res = "failed";
//		}
//		this.setListJson(res, userActList, userActList.size());
//		return json;
//	}

	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute UsersDTO userDto, Model model, HttpSession session,
			@RequestParam(value = "backUrl", required = false) String url) {
		// model.addAttribute("errorFlag",false);

		UsersDTO userUi = userService.loginCheck(userDto);
		if (userUi != null) {
			session.setAttribute("userSession", userUi);
			// return "redirect:/EventOrganizing";
			if (url != null && url != "") {
				url = url.split("'")[1];
				return "redirect:/" + url;
			}
			return "redirect:/toIndex";

		} else {
			model.addAttribute("error", "Login Failure");
			return "user/userLoginView";
		}
	}

	@RequestMapping(value = "userLogout")
	public String userLogout(HttpSession session) {
		// model.addAttribute("errorFlag",false);

		session.removeAttribute("userSession");
		return "redirect:/toIndex";

	}

	@ResponseBody
	@RequestMapping(value = "/isUserExist", method = RequestMethod.POST)
	public Map<String, Object> isUserExist(@ModelAttribute("userDTO") UsersDTO user) {

		UsersDTO checkUser = new UsersDTO();
		checkUser = userService.checkUserExist(user.getUserName());
		if (checkUser != null) {
			if (checkUser.getId() != user.getId()) {

				this.setTitleJson("fail", "The user name has been registered", "Failure");
			} else {
				this.setTitleJson("success", "", "");

			}
		} else {
			this.setTitleJson("success", "", "");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public Map<String, Object> registerUser(HttpServletRequest request, @ModelAttribute("userDTO") UsersDTO user)
			throws IOException {
		user.setTime(new Date());
		// user.setPassword(EncoderByMd5(user.getPassword()));
//		if (photo != null) {
//			InputStream is = photo.get(0).getInputStream();
//			byte[] photoData = new byte[(int) photo.get(0).getSize()];
//			is.read(photoData);
////			user.setPhoto_data(photoData);
//		}
		user.setValid(1);
		int id = userService.addUser(user);
		if (id > 0) {
//			String email = user.getEmail();
//			userService.processregister(id, email);// 发邮箱激活
			this.setTitleJson("success", "Your account has been registered successfully", "Success");
		} else {
			this.setTitleJson("failed", "Fail to register", "Failure");
		}
		return json;
	}

	@RequestMapping(value = "/activateUser")
	public String activateUser(HttpServletRequest request, @ModelAttribute("userDTO") UsersDTO user) {
		user.setValid(1);
		if (userService.updateUser(user) > 0) {
			this.setTitleJson("success", "User status has been changed successfully", "Success");
		} else {
			this.setTitleJson("failed", "Fail to change user status", "Failue");
		}
		return "/activatingSuccess";
	}

	@ResponseBody
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public Map<String, Object> updateUser(HttpServletRequest request, @ModelAttribute UsersDTO user) throws IOException {

		if (userService.updateUser(user) > 0) {
			this.setTitleJson("success", "Save Profile Successfully", "Success");
		} else {
			this.setTitleJson("failed", "Fail to save profile", "Failure");
		}

		return json;
	}

//	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
//	public void getImage(@RequestParam("id") int id, HttpServletRequest request, HttpServletResponse response,
//			Model model) throws IOException {
//		UsersDTO user = new UsersDTO();
//		user.setId(id);
//		user.setPageSize(1);
//		user = userService.searchUserByIdOrName(user).get(0);
//		byte[] data = user.getPhoto_data();
//		response.setContentType("img/jpeg");
//		response.setCharacterEncoding("utf-8");
//		if(data != null) {
//			data = scaleImage(data, 300, 300);
//			try {
//
//				OutputStream outputStream = response.getOutputStream();
//				InputStream in = new ByteArrayInputStream(data);
//
//				int len = 0;
//				byte[] buf = new byte[1024];
//				while ((len = in.read(buf, 0, 1024)) != -1) {
//					outputStream.write(buf, 0, len);
//				}
//				outputStream.close();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//
//	}

	public static byte[] scaleImage(byte[] data, int width, int height) throws IOException {
		BufferedImage buffered_oldImage = ImageIO.read(new ByteArrayInputStream(data));
		int imageOldWidth = buffered_oldImage.getWidth();
		int imageOldHeight = buffered_oldImage.getHeight();
		double scale_x = (double) width / imageOldWidth;
		double scale_y = (double) height / imageOldHeight;
		double scale_xy = Math.min(scale_x, scale_y);
		int imageNewWidth = (int) (imageOldWidth * scale_xy);
		int imageNewHeight = (int) (imageOldHeight * scale_xy);
		BufferedImage buffered_newImage = new BufferedImage(imageNewWidth, imageNewHeight, BufferedImage.TYPE_INT_RGB);
		buffered_newImage.getGraphics().drawImage(
				buffered_oldImage.getScaledInstance(imageNewWidth, imageNewHeight, BufferedImage.SCALE_SMOOTH), 0, 0,
				null);
		buffered_newImage.getGraphics().dispose();
		ByteArrayOutputStream outPutStream = new ByteArrayOutputStream();
		ImageIO.write(buffered_newImage, "jpeg", outPutStream);
		return outPutStream.toByteArray();
	}

}
