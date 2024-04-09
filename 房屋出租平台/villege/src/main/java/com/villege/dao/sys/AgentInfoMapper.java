package com.villege.dao.sys;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.villege.entity.sys.AgentInfoEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface AgentInfoMapper extends BaseMapper<AgentInfoEntity> {

    @Select({
            "<script>",
            "select * from agentinfo WHERE 1 = 1",
            "<if test=\" null != params.agentId and params.agentId != 0\">",
            "AND agentId = #{params.agentId}",
            "</if>",
            "ORDER BY agentId asc",
            "</script>"
    })
    List<AgentInfoEntity> getPageList(Page pages,@Param("params") Map<String, Object> params);

    @Select({
            "<script>",
            "select * from agentinfo WHERE 1 = 1",
            "<if test=\" null != params.agentId and params.agentId != 0\">",
            "AND agentId = #{params.agentId}",
            "</if>",
            "ORDER BY agentId asc",
            "</script>"
    })
    List<AgentInfoEntity> getExcelList(@Param("params") Map<String, Object> params);


    @Select("select * from agentinfo where agentId = ${agentId}")
    AgentInfoEntity getEntityById(long agentId);

    @Select("select * from agentinfo where state=1 order by agentName")
    List<AgentInfoEntity> getList();

    @Update("update agentinfo set remainMoney=remainMoney-#{agent.remainMoney} where agentId=#{agent.agentId}")
    void updateRemainMoney(@Param("agent") AgentInfoEntity agent);

    @Update("update agentinfo set agentIcon=#{agent.agentIcon},aboutUs=#{agent.aboutUs},mobile=#{agent.mobile},contact=#{agent.contact} where agentId=#{agent.agentId}")
    void editMyInfo(@Param("agent") AgentInfoEntity agent);

}
