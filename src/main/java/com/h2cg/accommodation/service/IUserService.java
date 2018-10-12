package com.h2cg.accommodation.service;

import java.util.List;

//import com.h2cg.accommodation.UserActivityDTO;
import com.h2cg.accommodation.dto.UsersDTO;

public interface IUserService {
	public List<UsersDTO> searchUserByIdOrName(UsersDTO UsersDTO);

//	public List<UserActivityDTO> searchUserActivity(UsersDTO UsersDTO);

	public int countUser(UsersDTO UsersDTO);

	public int updateUser(UsersDTO UsersDTO);

	public UsersDTO loginCheck(UsersDTO UsersDTO);

	public int addUser(UsersDTO UsersDTO);

	public void processregister(int id, String email);

	public UsersDTO checkUserExist(String name);

}
