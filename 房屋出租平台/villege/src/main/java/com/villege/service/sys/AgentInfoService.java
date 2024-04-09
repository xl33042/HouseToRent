package com.villege.service.sys;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.villege.common.utils.PageUtils;
import com.villege.entity.sys.AgentInfoEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AgentInfoService extends IService<AgentInfoEntity> {
    PageUtils getPageList(Map<String, Object> params);

    AgentInfoEntity getEntityById(long agentId);

    List<AgentInfoEntity> getList();

    @Override
    boolean saveOrUpdate(AgentInfoEntity entity);

    void updateRemainMoney(AgentInfoEntity agent);

    void editMyInfo(AgentInfoEntity agent);

    List<AgentInfoEntity> getExcelList(Map<String, Object> params);
}
