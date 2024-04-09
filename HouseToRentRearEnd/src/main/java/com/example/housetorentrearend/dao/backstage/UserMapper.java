package com.example.housetorentrearend.dao.backstage;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.housetorentrearend.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface UserMapper extends BaseMapper<User> {
    User findByAccount(@Param("account") String account);

    List<User> userList(IPage<User> userIPage, @Param("map")Map map);


}
