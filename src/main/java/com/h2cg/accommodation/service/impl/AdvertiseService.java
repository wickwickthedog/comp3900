package com.h2cg.accommodation.service.impl;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.h2cg.accommodation.dao.AdvertiseDAO;
import com.h2cg.accommodation.dao.UsersDAO;
import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
//import com.ass2.dto.UserActivityDTO;
import com.h2cg.accommodation.dto.UsersDTO;
import com.h2cg.accommodation.service.IAdvertiseService;
import com.h2cg.accommodation.service.IUserService;
import com.h2cg.accommodation.utils.DateUtils;
import com.h2cg.accommodation.utils.PhotoUtil;
import com.h2cg.accommodation.utils.SendEmail;

@Transactional
@Service(value = "advService")
public class AdvertiseService implements IAdvertiseService{

	@Autowired
	private AdvertiseDAO advertiseDao;

	@Override
	public List<AdvertiseDTO> selectAdv(BookDTO bookDto,HttpServletRequest request) {
		// TODO Auto-generated method stub
		if (bookDto.getStayBeginStr() != null && bookDto.getStayBeginStr() != "") {
			try {
				bookDto.setStayBegin(DateUtils.DateString2Date(bookDto.getStayBeginStr()));
				bookDto.setStayEnd(DateUtils.DateString2Date(bookDto.getStayEndStr()));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<AdvertiseDTO> advList =advertiseDao.selectAdv(bookDto);
		String pathval = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/";
		
		for(AdvertiseDTO adv:advList) {
			String photoDir = "photo/"+ adv.getId() + "/" ;
			ArrayList<String> picList = PhotoUtil.getPhotoPath(pathval + photoDir,photoDir);
			if(picList.size()>0) {
				adv.setPicPath(picList.remove(0));
			}

		}
		return advList;
	}

	@Override
	public AdvertiseDTO selectAdvById(AdvertiseDTO advDto) {
		// TODO Auto-generated method stub
		return advertiseDao.selectAdvById(advDto);
	}
	

	@Override
	public int addAdv(AdvertiseDTO advDto) {
		// TODO Auto-generated method stub
		advDto.setTime(new Date());

		return advertiseDao.insertSelective(advDto);
	}

	@Override
	public AdvertiseDTO checkAddrExist(String addr) {
		// TODO Auto-generated method stub
		return advertiseDao.selectByAddr(addr);
	}

	@Override
	public int removeAdv(Integer id) {
		// TODO Auto-generated method stub
		return advertiseDao.deleteById(id);
	}

//	@Override
//	public AdvertiseDTO selectAdvByUId(UsersDTO userDto) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<AdvertiseDTO> selectAdvByUserId(Integer id) {
		// TODO Auto-generated method stub
		return advertiseDao.selectAdvByUserId(id);
	}

	@Override
	public int updateRmNum(Integer advId,Integer bedroom, Integer capacity) {
		// TODO Auto-generated method stub
		return advertiseDao.updateRmNum(advId,bedroom, capacity);
	}

//	@Override
//	public AdvertiseDTO selectAdvByUId(UsersDTO userDto) {
//		// TODO Auto-generated method stub
//		return advertiseDao.selectAdvByUId(userDto);
//	}
	
}
