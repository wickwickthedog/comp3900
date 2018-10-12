package com.h2cg.accommodation.dao;

import com.h2cg.accommodation.dto.MessageDTO;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageDAO {
    long countByDTO(MessageDTO DTO);

    int deleteByDTO(MessageDTO DTO);

    int insert(MessageDTO record);

    int insertSelective(MessageDTO record);

    List<MessageDTO> selectByDTO(MessageDTO DTO);

    int updateByDTOSelective(@Param("DTO") MessageDTO DTO);

    int updateByDTO(@Param("DTO") MessageDTO DTO);
}