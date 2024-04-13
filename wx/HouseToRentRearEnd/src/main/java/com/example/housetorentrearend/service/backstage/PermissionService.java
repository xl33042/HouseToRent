package com.example.housetorentrearend.service.backstage;

import java.util.List;

public interface PermissionService {
    public List<String> findByRoleId(List<Integer> roleIds);
}
