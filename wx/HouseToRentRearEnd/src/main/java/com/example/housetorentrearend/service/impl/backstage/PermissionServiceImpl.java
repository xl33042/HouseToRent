package com.example.housetorentrearend.service.impl.backstage;


import com.example.housetorentrearend.dao.backstage.PermissionMapper;
import com.example.housetorentrearend.service.backstage.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<String> findByRoleId(List<Integer> roleIds) {
        return permissionMapper.findByRoleId(roleIds);
    }
}
