package com.h2cg.accommodation.dao;

import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.RoomDTO;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomDAO {
	
	List<RoomDTO> selectAvailableRoom(BookDTO DTO);
	
	int insert(RoomDTO record);
	
	List<RoomDTO> selectRoomById(AdvertiseDTO advDto);
	
	int deleteById(AdvertiseDTO advDto);
}