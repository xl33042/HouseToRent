package com.example.housetorentrearend.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.housetorentrearend.dao.PermissionMapper;
import com.example.housetorentrearend.dao.RoleMapper;
import com.example.housetorentrearend.dao.RolePermissionMapper;
import com.example.housetorentrearend.entity.Role;
import com.example.housetorentrearend.entity.RolePermission;
import com.example.housetorentrearend.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public List<Role> findRoleByUserId(Integer id) {
        return roleMapper.findRoleByUserId(id);
    }

    @Override
    public Page<Role> list(Map params) {
        Page<Role> page = new Page<>(Integer.parseInt(params.get("current").toString()), 3);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        if (params.get("roleName") != null) {
            queryWrapper.like("roleName", params.get("roleName").toString());
        }
        page = roleMapper.selectPage(page, queryWrapper);
        return page;
    }

    @Override
    public Map listPermission(int id) {
        Map map = new HashMap();
        map.put("roleName", roleMapper.selectById(id).getRoleName());
        map.put("rolePermission", permissionMapper.rolePermission(id));
        map.put("suoYouPermission",permissionMapper.selectList(null));
        return map;
    }

    @Override
    public void updatePermission(int id, int[] quanXian) {
        QueryWrapper<RolePermission> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_id", id);
        rolePermissionMapper.delete(queryWrapper);
        for (int i : quanXian) {
            RolePermission rolePermission = new RolePermission();
            rolePermission.setRoleId(id);
            rolePermission.setPermissionId(i);
            rolePermissionMapper.insert(rolePermission);
        }
    }


}
