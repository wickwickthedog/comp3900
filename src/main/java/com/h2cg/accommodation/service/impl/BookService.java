package com.h2cg.accommodation.service.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.h2cg.accommodation.dao.AdvertiseDAO;
import com.h2cg.accommodation.dao.BookDAO;
import com.h2cg.accommodation.dao.UsersDAO;
import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
//import com.ass2.dto.UserActivityDTO;
import com.h2cg.accommodation.dto.UsersDTO;
import com.h2cg.accommodation.service.IAdvertiseService;
import com.h2cg.accommodation.service.IBookService;
import com.h2cg.accommodation.service.IUserService;
import com.h2cg.accommodation.utils.DateUtils;
import com.h2cg.accommodation.utils.SendEmail;

@Transactional
@Service(value = "bookService")
public class BookService implements IBookService {

	@Autowired
	private BookDAO bookDao;

	@Override
	public List<BookDTO> selectHousemate(BookDTO bookDto) {
		// TODO Auto-generated method stub
		List<BookDTO> housemateList = bookDao.selectHousemate(bookDto);
		for (BookDTO housemate : housemateList) {
			housemate.setStayBeginStr(DateUtils.getDateString(housemate.getStayBegin()));
			housemate.setStayEndStr(DateUtils.getDateString(housemate.getStayEnd()));
		}
		return housemateList;
	}

	@Override
	public int insertBooking(BookDTO bookDto) {
		// TODO Auto-generated method stub
		bookDto.setBooktime(new Date());
		try {
			bookDto.setStayBegin(DateUtils.DateString2Date(bookDto.getStayBeginStr()));
			bookDto.setStayEnd(DateUtils.DateString2Date(bookDto.getStayEndStr()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookDao.insertSelective(bookDto);
	}

	@Override
	public List<BookDTO> selectBookingBeforeCheckIn(Integer userId, Date today) {
		// TODO Auto-generated method stub
		List<BookDTO> bookingList = bookDao.selectBookingBeforeCheckIn(userId, today);

		for (BookDTO housemate : bookingList) {
			housemate.setStayBeginStr(DateUtils.getDateString(housemate.getStayBegin()));
			housemate.setStayEndStr(DateUtils.getDateString(housemate.getStayEnd()));
		}
		return bookingList;
	}

	@Override
	public List<BookDTO> selectBookingAfterCheckIn(Integer userId, Date today) {
		// TODO Auto-generated method stub
		List<BookDTO> bookingList = bookDao.selectBookingAfterCheckIn(userId, today);
		for (BookDTO housemate : bookingList) {
			housemate.setStayBeginStr(DateUtils.getDateString(housemate.getStayBegin()));
			housemate.setStayEndStr(DateUtils.getDateString(housemate.getStayEnd()));
		}
		return bookingList;
	}

	@Override
	public int deleteBooking(Integer id) {
		// TODO Auto-generated method stub
		return bookDao.deleteBooking(id);
	}

}
