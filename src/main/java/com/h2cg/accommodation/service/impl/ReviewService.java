package com.h2cg.accommodation.service.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.h2cg.accommodation.dao.AdvertiseDAO;
import com.h2cg.accommodation.dao.BookDAO;
import com.h2cg.accommodation.dao.ReviewDAO;
import com.h2cg.accommodation.dao.UsersDAO;
import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.ReviewDTO;
//import com.ass2.dto.UserActivityDTO;
import com.h2cg.accommodation.dto.UsersDTO;
import com.h2cg.accommodation.service.IAdvertiseService;
import com.h2cg.accommodation.service.IBookService;
import com.h2cg.accommodation.service.IReviewService;
import com.h2cg.accommodation.service.IUserService;
import com.h2cg.accommodation.utils.DateUtils;
import com.h2cg.accommodation.utils.SendEmail;

@Transactional
@Service(value = "reviewService")
public class ReviewService implements IReviewService {

	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public int insertComment(ReviewDTO review) {
		// TODO Auto-generated method stub
		review.setTime(new Date());

		return reviewDao.insertSelective(review);
	}

	@Override
	public List<ReviewDTO> selectByBookId(ReviewDTO DTO) {
		// TODO Auto-generated method stub
		return reviewDao.selectByBookId(DTO);
	}

	@Override
	public List<ReviewDTO> selectByAdvId(Integer advId) {
		// TODO Auto-generated method stub
		return reviewDao.selectByAdvId(advId);
	}

	

}
