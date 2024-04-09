package com.example.housetorentrearend.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.housetorentrearend.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface RoleMapper extends BaseMapper<Role> {
    List<Role> findRoleByUserId(@Param("userId") Integer userId);
}
