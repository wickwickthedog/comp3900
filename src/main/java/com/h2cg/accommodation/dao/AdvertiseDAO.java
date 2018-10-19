package com.h2cg.accommodation.dao;

import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.UsersDTO;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertiseDAO {
//    long countByDTO(AdvertiseDTO DTO);
//
//	int deleteByDTO(AdvertiseDTO DTO);
//
//	int insert(AdvertiseDTO record);
//
	int insertSelective(AdvertiseDTO record);
//
//	List<AdvertiseDTO> selectByDTO(AdvertiseDTO DTO);
//
//	int updateByDTOSelective(@Param("DTO") AdvertiseDTO DTO);
//
//	int updateByDTO( @Param("DTO") AdvertiseDTO DTO);

	List<AdvertiseDTO> selectAdv(BookDTO bookDto);

	List<AdvertiseDTO> selectAdvByAddress(BookDTO bookDto);

	AdvertiseDTO selectAdvById(AdvertiseDTO advDto);

	int insert(AdvertiseDTO record);

	AdvertiseDTO selectByAddr(@Param("address") String addr);

	int deleteById(Integer id);

	List<AdvertiseDTO> selectAdvByUserId(Integer id);

	int updateRmNum(@Param("advId") Integer advId, @Param("bedroom") Integer bedroom,
			@Param("capacity") Integer capacity);

}