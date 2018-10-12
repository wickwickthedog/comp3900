package com.h2cg.accommodation.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.ReviewDTO;
import com.h2cg.accommodation.dto.RoomDTO;
import com.h2cg.accommodation.dto.UsersDTO;
import com.h2cg.accommodation.service.IAdvertiseService;
import com.h2cg.accommodation.service.IBookService;
import com.h2cg.accommodation.service.IReviewService;
import com.h2cg.accommodation.service.IRoomService;
import com.h2cg.accommodation.utils.DateUtils;
import com.h2cg.accommodation.utils.PhotoUtil;

@Controller
public class AdvController extends BaseController {
	@Autowired
	private IAdvertiseService advService;

	@Autowired
	private IBookService bookService;

	@Autowired
	private IRoomService roomService;

	@Autowired
	private IReviewService reviewService;

	private String photoDir = "photo/";

	/*-------------------------      Html       -------------------------------- */

	@RequestMapping("/toSearchAdv")
	public String toSearchUser2(Model model, @ModelAttribute AdvertiseDTO advDto) {
//		List<AdvertiseDTO> advList = advService.selectAdv(advDto);
//		model.addAttribute("advList", advList);
		return "adv/searchAdvView";
	}

	@RequestMapping("/toAdvDetail")
	public String toUserProfile(@ModelAttribute AdvertiseDTO advDto, @ModelAttribute("bookDto") BookDTO bookDto,
			@ModelAttribute RoomDTO roomDto, Model model, HttpServletRequest request) throws ParseException {
//		user.setPageSize(1);
//		user = userService.searchUserByIdOrName(user).get(0);
//		Date OStime = sdf.parse(time);
		if (bookDto.getStayBeginStr() != null && bookDto.getStayBeginStr() != "") {
			bookDto.setStayBegin(DateUtils.DateString2Date(bookDto.getStayBeginStr()));
			bookDto.setStayEnd(DateUtils.DateString2Date(bookDto.getStayEndStr()));
		}
		advDto = advService.selectAdvById(advDto);
		String pathval = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/";

		ArrayList<String> advPhotoList = PhotoUtil.getPhotoPath(pathval + photoDir + advDto.getId(),
				photoDir + advDto.getId() + "/");
		RoomDTO room = new RoomDTO();
		room.setAdv(advDto);
		bookDto.setRoom(room);
//		List<RoomDTO> roomList = roomService.selectAvailableRoom(bookDto);

		List<BookDTO> housemateList = bookService.selectHousemate(bookDto);
		model.addAttribute("advDto", advDto);
		if (advPhotoList.size() > 0) {
			model.addAttribute("advPhotoCover", advPhotoList.remove(0));
			model.addAttribute("advPhotoList", advPhotoList);
		}
		model.addAttribute("bookDto", bookDto);
//		if (roomList.size() > 0) {
//			model.addAttribute("roomList", roomList);
////			for (RoomDTO rm : roomList) {
//////				ArrayList<String> roomPhotoList = getPhotoPath(
////						pathval + photoDir + "/" + rm.getId() + "/" + advDto.getId());
////				if (roomPhotoList.size() > 0) {
////					model.addAttribute("roomPhotoCover" + rm.getId(), roomPhotoList.get(0));
////					model.addAttribute(rm.getId().toString(), roomPhotoList);
////				}
////			}
//		}
		model.addAttribute("housemateList", housemateList);
		List<ReviewDTO> reviewList =reviewService.selectByAdvId(advDto.getId());
		float avgRating =0;
		for(ReviewDTO review:reviewList) {
			avgRating += review.getRating();
		}
		if(reviewList.size()>0) {
			avgRating = avgRating/reviewList.size();
			
		}
		String avgRatingStr = String.format("%.1f", avgRating);

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("avgRating", avgRatingStr);

		return "adv/advDetail";
	}

	@RequestMapping("/toIndex")
	public String toIndex(@ModelAttribute("bookDto") BookDTO bookDto, @ModelAttribute UsersDTO user, Model model,
			HttpSession session) throws ParseException {
//		List<AdvertiseDTO> advDto = advService.selectAdv(new AdvertiseDTO());
//		model.addAttribute("advDto", advDto);
//		Date OStime = sdf.parse(time);

//		model.addAttribute("scrollFlag", 0);
//		if (bookDto.getStayBeginStr() != null && bookDto.getStayEndStr() != null) {
//			bookDto.setStayBegin(DateUtils.DateString2Date(bookDto.getStayBeginStr()));
//			bookDto.setStayBegin(DateUtils.DateString2Date(bookDto.getStayEndStr()));
//			List<AdvertiseDTO> advList = advService.selectAdv(bookDto);
//			model.addAttribute("advList", advList);
//			model.addAttribute("book", bookDto);
//			model.addAttribute("scrollFlag", 1);
//		}
//		user = (UsersDTO) session.getAttribute("userSession");
//		if (user != null)
//			model.addAttribute("user", user);
		return "adv/index";
	}

	@RequestMapping(value = "/toHostView")
	public String toAddAdv(@ModelAttribute UsersDTO user, Model model, HttpSession session) {

		return "adv/hostAdv";
	}

	@RequestMapping(value = "/toAddRoomView")
	public String toAddRoomView(@ModelAttribute UsersDTO user, @ModelAttribute AdvertiseDTO advDto, Model model,
			HttpSession session) {
		model.addAttribute("advId", advDto.getId());
		return "room/addRoom";
	}

	@RequestMapping(value = "/toBookingManagement")
	public String toBookingManagement(@ModelAttribute AdvertiseDTO advDto, Model model, HttpSession session) {
		UsersDTO user = (UsersDTO) session.getAttribute("userSession");
		if (user != null) {
			List<BookDTO> bookingListBeforeCheckIn = bookService.selectBookingBeforeCheckIn(user.getId(), new Date());
			List<BookDTO> bookingListAfterCheckIn = bookService.selectBookingAfterCheckIn(user.getId(), new Date());
			model.addAttribute("bookingListBeforeCheckIn", bookingListBeforeCheckIn);
			model.addAttribute("bookingListAfterCheckIn", bookingListAfterCheckIn);
			return "book/bookingList";
		} else {
			return "user/userLoginView";
		}
	}

	@RequestMapping(value = "/toAdvManagement")
	public String toAdvManagement(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO) session.getAttribute("userSession");
		if (user != null) {
			List<AdvertiseDTO> advList = advService.selectAdvByUserId(user.getId());
			model.addAttribute("advList", advList);
			return "adv/advManagement";
		} else {
			return "user/userLoginView";
		}
	}

	/*-------------------------      Methods       -------------------------------- */
	@ResponseBody
	@RequestMapping(value = "searchAdv", method = RequestMethod.POST)
	public Map<String, Object> searchAdv(HttpServletRequest request, @ModelAttribute("bookDto") BookDTO bookDto,
			Model model) throws Exception {
		// RequestContext requestContext = new RequestContext(request);
		String res = "success";
		List<AdvertiseDTO> advList = advService.selectAdv(bookDto, request);
//		model.addAttribute("advList", advList);

		if (advList.size() == 0 || advList == null) {
			res = "failed";
		}
		this.setListJson(res, advList, advList.size());
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "searchRoom", method = RequestMethod.POST)
	public Map<String, Object> searchRoom(HttpServletRequest request, @ModelAttribute("bookDto") BookDTO bookDto,
			Model model) throws Exception {
		// RequestContext requestContext = new RequestContext(request);
		String res = "success";
//		Map<String, String> result = new HashMap<String, String>();;
		RoomDTO room = new RoomDTO();
		AdvertiseDTO adv = new AdvertiseDTO();
		adv.setId(bookDto.getId());
		room.setAdv(adv);
		bookDto.setRoom(room);
		// int total = userService.countUser(userDTO);
		List<RoomDTO> roomList = roomService.selectAvailableRoom(bookDto, request);
//		List<UserActivityDTO> userActList = userService.searchUserActivity(userDTO);
		if (roomList.size() == 0 || roomList == null) {
			res = "failed";
		}
		this.setListJson(res, roomList, roomList.size());
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "hostAdvertisment", method = RequestMethod.POST)
	public Map<String, Object> postAdvertisment(HttpServletRequest request,
			@ModelAttribute("advDto") AdvertiseDTO advDto, HttpSession session) throws IOException {

		String res = "success";
		UsersDTO userUi = (UsersDTO) session.getAttribute("userSession");
		if (userUi != null) {
			advDto.setUserId(userUi.getId());
			Integer id = advService.addAdv(advDto);
			if (id > 0) {
				this.setTitleJson(res, "Your adv has been successfully added", advDto.getId().toString());
			} else {
				this.setTitleJson("failed", "Fail to host advertisement", "Failure");
			}
		} else {
			this.setTitleJson("failed", "Please Login first", "Failure");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "hostAdvertismentWithPhoto", method = RequestMethod.POST)
	public Map<String, Object> hostAdvertismentWithPhoto(HttpServletRequest request,
			@ModelAttribute("advDto") AdvertiseDTO advDto, HttpSession session,
			@RequestParam("photo") List<MultipartFile> photo) throws IOException {

		String res = "success";
		UsersDTO userUi = (UsersDTO) session.getAttribute("userSession");
		if (userUi != null) {
			advDto.setUserId(userUi.getId());
			Integer id = advService.addAdv(advDto);
			if (id > 0) {
//				String realUploadPath=request.getServletContext().getRealPath("/")+"WEB-INF/photo/"+advDto.getId()+"/";				
//				String b=this.getClass().getClassLoader().getResource(".").getPath();
				String pathval = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/" + photoDir
						+ advDto.getId() + "/";
//				String currentDir = photoDir+advDto.getId()+"/";
				savePhoto(pathval, photo);
				this.setTitleJson(res, "Your adv has been successfully added", advDto.getId().toString());
			} else {
				this.setTitleJson("failed", "Fail to host advertisement", "Failure");
			}
		} else {
			this.setTitleJson("failed", "Please Login first", "Failure");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAdv")
	public Map<String, Object> deleteAdv(@RequestParam(required = false) Integer id) throws IOException {
//		UsersDTO user = (UsersDTO) session.getAttribute("userSession");
		int result = advService.removeAdv(id);
		String res = "success";
		if (result > 0) {
			this.setTitleJson(res, "Your adv has been successfully deleted", "Success");
		} else {
			this.setTitleJson("failed", "Fail to delete this advertisement", "Failure");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/isAddrExist", method = RequestMethod.POST)
	public Map<String, Object> isAddrExist(@ModelAttribute("advDto") AdvertiseDTO advDto) {

		AdvertiseDTO checkAddr = new AdvertiseDTO();
		checkAddr = advService.checkAddrExist(advDto.getAddress());
		if (checkAddr != null) {
			this.setIsExistJson("yes");
		} else {
			this.setIsExistJson("no");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/addRoom", method = RequestMethod.POST)
	public Map<String, Object> addRoom(HttpServletRequest request, @ModelAttribute("roomDto") RoomDTO roomDto,
			HttpSession session) throws IOException {

		String res = "success";
		int id = roomService.addRoom(roomDto);
		if (id > 0) {
			this.setTitleJson(res, "Your rooms has been successfully added", "Success");
		} else {
			this.setTitleJson("failed", "Fail to add room", "Failure");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/addRoomWithPhoto", method = RequestMethod.POST)
	public Map<String, Object> addRoomWithPhoto(HttpServletRequest request, @ModelAttribute("roomDto") RoomDTO roomDto,
			HttpSession session, @RequestParam("photo") List<MultipartFile> photo) throws IOException {

		String res = "success";
		int id = roomService.addRoom(roomDto);
		if (id > 0) {
			String pathval = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/" + photoDir
					+ roomDto.getAdvId() + "/" + roomDto.getId() + "/";

//			String currentDir = "D:/9900Photo/"+roomDto.getAdvId()+"/"+roomDto.getId()+"/";
			savePhoto(pathval, photo);
			this.setTitleJson(res, "Your rooms has been successfully added", "Success");
		} else {
			this.setTitleJson("failed", "Fail to add room", "Failure");
		}
		return json;
	}
//	@ResponseBody
//	@RequestMapping(value = "deleteRoom")
//	public String delRoom(HttpServletRequest request, HttpSession session, @ModelAttribute UsersDTO user,
//			@ModelAttribute("advDto") AdvertiseDTO advDto, @ModelAttribute("roomDto") RoomDTO roomDto)
//			throws IOException {
//		user = (UsersDTO) session.getAttribute("userSession");
//		advDto = advService.selectAdvByUId(user);
//		int id = roomService.removeRoom(advDto);
//		if (id > 0) {
//			return "Success";
//		} else {
//			return "Fail";
//		}
//	}

	@ResponseBody
	@RequestMapping(value = "/bookRoom", method = RequestMethod.POST)
	public Map<String, Object> bookRoom(@ModelAttribute BookDTO bookDto, HttpSession session) {
		UsersDTO user = (UsersDTO) session.getAttribute("userSession");
		if (user != null) {
			bookDto.setUserId(user.getId());
			int id = bookService.insertBooking(bookDto);
			if (id > 0) {
				this.setTitleJson("success", "Your adv has been successfully added", "Success");
			} else {
				this.setTitleJson("fail", "Fail to book this room", "Fail");
			}
		} else {
			this.setTitleJson("fail", "Please Login first", "Fail");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "postComment")
	public Map<String, Object> postComment(ReviewDTO review) throws IOException {
		List<ReviewDTO> checkResult = reviewService.selectByBookId(review);
		if (checkResult.size() == 0) {
			int result = reviewService.insertComment(review);
			if (result > 0) {
				this.setTitleJson("success", "Your comment and your rating have been posted sucessfully", "Success");
			} else {
				this.setTitleJson("fail", "Fail to post this comment", "Fail");
			}
		} else {
			this.setTitleJson("fail", "You have posted a comment", "Fail");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "cancelBooking")
	public Map<String, Object> cancelBooking(@RequestParam(required = false) Integer id) throws IOException {
		int result = bookService.deleteBooking(id);
		if (result > 0) {
			this.setTitleJson("success", "Your booking has been deleted sucessfully", "Success");
		} else {
			this.setTitleJson("fail", "Fail to delete this booking", "Fail");
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "updateRmNum")
	public void updateRmNum(@RequestParam(required = false) Integer advId,
			@RequestParam(required = false) Integer roomI, @RequestParam(required = false) Integer capacity)
			throws IOException {
		advService.updateRmNum(advId, roomI, capacity);
	}

	public Boolean savePhoto(String directory, List<MultipartFile> photos) {
		File dir = new File(directory);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		for (MultipartFile photo : photos) {
			String filePath = directory + photo.getOriginalFilename();
			File file = new File(filePath);
			try {
				photo.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}

}
