package com.villege.service.sys.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.villege.common.constant.Constant;
import com.villege.common.utils.PageUtils;
import com.villege.dao.sys.AgentInfoMapper;
import com.villege.entity.sys.AgentInfoEntity;
import com.villege.service.sys.AgentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("agentInfoService")
public class AgentInfoServiceImpl extends ServiceImpl<AgentInfoMapper, AgentInfoEntity> implements AgentInfoService {
    @Autowired
    private AgentInfoMapper agentInfoMapper;
    @Override
    public PageUtils getPageList(Map<String, Object> params) {
        long page = Long.parseLong(String.valueOf(params.get(Constant.PAGE)));
        long limit = Long.parseLong(String.valueOf(params.get(Constant.LIMIT)));
        Page<AgentInfoEntity> pages = new Page<>();
        pages.setSize(limit);
        pages.setCurrent(page);
        List<AgentInfoEntity> pageList = agentInfoMapper.getPageList(pages,params);
        pages.setRecords(pageList);
        return new PageUtils(pages);
    }

    @Override
    public List<AgentInfoEntity> getExcelList(Map<String, Object> params){
        return agentInfoMapper.getExcelList(params);
    }

    @Override
    public AgentInfoEntity getEntityById(long agentId) {
        return agentInfoMapper.getEntityById(agentId);
    }

    @Override
    public List<AgentInfoEntity> getList() {

        return agentInfoMapper.getList();
    }
    @Override
    public void updateRemainMoney(AgentInfoEntity agent){
        agentInfoMapper.updateRemainMoney(agent);
    }
    @Override
    public void editMyInfo(AgentInfoEntity agent){
        agentInfoMapper.editMyInfo(agent);
    }

}
