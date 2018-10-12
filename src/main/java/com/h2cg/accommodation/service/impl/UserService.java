package com.h2cg.accommodation.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.h2cg.accommodation.dao.UsersDAO;
//import com.ass2.dto.UserActivityDTO;
import com.h2cg.accommodation.dto.UsersDTO;
import com.h2cg.accommodation.service.IUserService;
import com.h2cg.accommodation.utils.SendEmail;

@Transactional
@Service(value = "userService")
public class UserService implements IUserService{

	@Autowired
	private UsersDAO usersDao;

	@Override
	public List<UsersDTO> searchUserByIdOrName(UsersDTO usersDto) {
		// TODO Auto-generated method stub
		return usersDao.selectByIdOrName(usersDto);
	}

//	@Override
//	public List<UserActivityDTO> searchUserActivity(UsersDTO usersDto) {
//		// TODO Auto-generated method stub
//		return usersDao.selectUserActivity(usersDto);
//	}

	@Override
	public int countUser(UsersDTO UsersDTO) {
		// TODO Auto-generated method stub
		return usersDao.countUser(UsersDTO);
	}

	@Override
	public int updateUser(UsersDTO usersDto) {
		// TODO Auto-generated method stub
		return usersDao.updateByPrimaryKeySelective(usersDto);
	}

	@Override
	public UsersDTO loginCheck(UsersDTO usersDto) {
		// TODO Auto-generated method stub
		return usersDao.selectByNameAndPassword(usersDto.getUserName(), usersDto.getPwd());
	}

	@Override
	public int addUser(UsersDTO usersDto) {
		// TODO Auto-generated method stub
		return usersDao.insert(usersDto);
	}

	@Override
	public void processregister(int id, String email) {
		// TODO Auto-generated method stub
        ///邮件的内容  
        StringBuffer sb=new StringBuffer("Please activate your account of H2CG Accommodation as soon as possible.</br>");  
        sb.append("<a href=\"http://localhost:8080/ass2/activateUser?id=");  
        sb.append(id);   
        sb.append("\">http://localhost:8080/ass2/activateUser?id=");   
        sb.append(id);  
        sb.append("</a></br>");
        sb.append("Kind regards</br>");
          
        //发送邮件  
        SendEmail.send(email, sb.toString());  
        System.out.println("发送邮件");  
	
	}
	@Override
	public UsersDTO checkUserExist(String name) {
		// TODO Auto-generated method stub
		return usersDao.selectByName(name);
	}
}
