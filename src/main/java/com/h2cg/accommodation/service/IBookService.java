package com.h2cg.accommodation.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.h2cg.accommodation.dto.BookDTO;

public interface IBookService {
	List<BookDTO> selectHousemate(BookDTO DTO);
	List<BookDTO> selectBookingBeforeCheckIn(@Param("userId") Integer userId,@Param("today") Date today);
	List<BookDTO> selectBookingAfterCheckIn(@Param("userId") Integer userId,@Param("today") Date today);
    int insertBooking(BookDTO record);
    int deleteBooking(Integer id);
}
