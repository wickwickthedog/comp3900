package com.h2cg.accommodation.dao;

import com.h2cg.accommodation.dto.ReviewDTO;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewDAO {
//    long countByDTO(ReviewDTO DTO);

//    int deleteByDTO(ReviewDTO DTO);

    int insert(ReviewDTO record);

    int insertSelective(ReviewDTO record);

    List<ReviewDTO> selectByBookId(ReviewDTO DTO);
    
    List<ReviewDTO> selectByAdvId(Integer advId);

//    int updateByDTOSelective(@Param("DTO") ReviewDTO DTO);

//    int updateByDTO(@Param("DTO") ReviewDTO DTO);
}