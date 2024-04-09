package com.example.housetorentrearend.service;




import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.housetorentrearend.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleService extends IService<Role> {
    public List<Role> findRoleByUserId(Integer id);

    public Page<Role> list(@Param("params") Map params);

    public Map listPermission(int id);

    public void updatePermission(int id,int[] quanXian);
}
