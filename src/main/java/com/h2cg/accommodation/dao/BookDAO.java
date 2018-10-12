package com.h2cg.accommodation.dao;

import com.h2cg.accommodation.dto.BookDTO;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookDAO {
//    long countByDTO(BookDTO DTO);
//
//    int deleteByDTO(BookDTO DTO);
//
//    int insert(BookDTO record);
//
    int insertSelective(BookDTO record);
//
//    List<BookDTO> selectByDTO(BookDTO DTO);
//
//    int updateByDTOSelective(@Param("DTO") BookDTO DTO);
//
//    int updateByDTO(@Param("DTO") BookDTO DTO);
	
	List<BookDTO> selectHousemate(BookDTO bookDto);
	List<BookDTO> selectBookingBeforeCheckIn(@Param("userId") Integer userId,@Param("today") Date today);
	List<BookDTO> selectBookingAfterCheckIn(@Param("userId") Integer userId,@Param("today") Date today);

    int deleteBooking(Integer id);
}