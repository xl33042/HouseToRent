package com.example.housetorentrearend.dao.backstage;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.example.housetorentrearend.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository

public interface PermissionMapper extends BaseMapper<Permission> {
    List<String> findByRoleId(@Param("roleIds") List<Integer> roleIds);

    List<Permission> rolePermission(@Param("id") int id);

}
