package com.example.wechatsmallprogram.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.example.wechatsmallprogram.entity.PersonInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface PersonInfoMapper extends BaseMapper<PersonInfoVO> {
//    int judgeUsers(@Param("mobile") String mobile);
//
//    PersonInfoVO fandUsers(@Param("mobile") String mobile,@Param("password") String password);
}
