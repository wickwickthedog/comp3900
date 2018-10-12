package com.h2cg.accommodation.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.h2cg.accommodation.dto.ReviewDTO;


public interface IReviewService {
    List<ReviewDTO> selectByBookId(ReviewDTO DTO);
    List<ReviewDTO> selectByAdvId(Integer advId);

    int insertComment(ReviewDTO review);
}
