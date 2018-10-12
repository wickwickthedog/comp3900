package com.h2cg.accommodation.dao;

//import com.h2cg.accommodation.dto.UserActivityDTO;
import com.h2cg.accommodation.dto.UsersDTO;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository(value="usersDao")
public interface UsersDAO {
    int deleteByPrimaryKey(Integer id);

    int insert(UsersDTO record);
    
    int countUser(UsersDTO record);

    int insertSelective(UsersDTO record);
    
    UsersDTO selectByName(@Param("userName")String userName);

    UsersDTO selectByNameAndPassword(@Param("userName")String userName, @Param("pwd")String pwd);
    
    List<UsersDTO> selectByIdOrName(UsersDTO record);
    
//    List<UserActivityDTO> selectUserActivity(UsersDTO record);

    int updateByPrimaryKeySelective(UsersDTO record);

    int updateByPrimaryKey(UsersDTO record);
}