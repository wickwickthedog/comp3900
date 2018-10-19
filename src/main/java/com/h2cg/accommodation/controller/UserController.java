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


	@RequestMapping("/toSearchUser2")
	public String toSearchUser2() {

		return "user/searchUserView2";
	}


	@RequestMapping("/toUpdateUser")
	public String toUpdateUser(@ModelAttribute UsersDTO user, Model model, HttpSession session) {
		user = (UsersDTO) session.getAttribute("userSession");
		model.addAttribute("user", user);
		return "user/editProfile";
	}

	@RequestMapping("/toUserProfile")
	public String toUserProfile(@ModelAttribute UsersDTO user, Model model, HttpSession session) {

		user = (UsersDTO) session.getAttribute("userSession");
		model.addAttribute("user", user);
		return "user/userProfile";
	}

	/*-------------------------      Methods       -------------------------------- */

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

		user.setValid(1);
		int id = userService.addUser(user);
		if (id > 0) {

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
