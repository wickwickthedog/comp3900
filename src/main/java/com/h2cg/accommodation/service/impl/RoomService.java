package com.h2cg.accommodation.service.impl;


import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.h2cg.accommodation.dao.RoomDAO;
import com.h2cg.accommodation.dto.AdvertiseDTO;
import com.h2cg.accommodation.dto.BookDTO;
import com.h2cg.accommodation.dto.RoomDTO;
//import com.ass2.dto.UserActivityDTO;
import com.h2cg.accommodation.service.IRoomService;
import com.h2cg.accommodation.utils.DateUtils;
import com.h2cg.accommodation.utils.PhotoUtil;

@Transactional
@Service(value = "roomService")
public class RoomService implements IRoomService{
	
	@Autowired
	private RoomDAO roomDao;

	@Override
	public List<RoomDTO> selectAvailableRoom(BookDTO DTO,HttpServletRequest request) {
		// TODO Auto-generated method stub
		if (DTO.getStayBeginStr() != null && DTO.getStayBeginStr() != "") {
			try {
				DTO.setStayBegin(DateUtils.DateString2Date(DTO.getStayBeginStr()));
				DTO.setStayEnd(DateUtils.DateString2Date(DTO.getStayEndStr()));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<RoomDTO> roomList = roomDao.selectAvailableRoom(DTO);
		String photoDir = "photo/"+ DTO.getId() + "/" ;
		String pathval = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/";
		for(RoomDTO room:roomList) {
			room.setPicList(PhotoUtil.getPhotoPath(pathval + photoDir + room.getId(),photoDir + room.getId()+ "/"));
		}
		return roomList;
	}
	
	@Override
	public int addRoom(RoomDTO roomDto) {
		// TODO Auto-generated method stub
		return roomDao.insert(roomDto);
	}

	@Override
	public List<RoomDTO> selectRoomById(AdvertiseDTO advDto) {
		// TODO Auto-generated method stub
		return roomDao.selectRoomById(advDto);
	}

	@Override
	public int removeRoom(AdvertiseDTO advDto) {
		// TODO Auto-generated method stub
		return roomDao.deleteById(advDto);
	}
	
}
