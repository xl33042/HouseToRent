package com.example.housetorentrearend.dao.backstage;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.housetorentrearend.entity.RolePermission;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface RolePermissionMapper extends BaseMapper<RolePermission> {
}
