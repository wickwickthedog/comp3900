package com.h2cg.accommodation.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.RoomDTO;

public interface IRoomService {
	List<RoomDTO> selectAvailableRoom(BookDTO DTO,HttpServletRequest request);

	int addRoom(RoomDTO roomDto);
	
	List<RoomDTO> selectRoomById(AdvertiseDTO advDto);
	
	int removeRoom(AdvertiseDTO advDto);
}
