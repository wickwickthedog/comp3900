package com.h2cg.accommodation.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.UsersDTO;

public interface IAdvertiseService {
	List<AdvertiseDTO> selectAdv(BookDTO bookDto, HttpServletRequest request);

	List<AdvertiseDTO> selectAdvByAddress(BookDTO bookDto, HttpServletRequest request);

	AdvertiseDTO selectAdvById(AdvertiseDTO advDto);

	int addAdv(AdvertiseDTO advDto);

	AdvertiseDTO checkAddrExist(String addr);

	int removeAdv(Integer id);

//	AdvertiseDTO selectAdvByUId(UsersDTO userDto);
	List<AdvertiseDTO> selectAdvByUserId(Integer id);

	int updateRmNum(Integer advId, Integer bedroom, Integer capacity);
}
