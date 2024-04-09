package com.villege.modules.controller.sys;

import com.villege.common.annotation.SysLog;
import com.villege.common.utils.PageUtils;
import com.villege.common.utils.R;
import com.villege.common.validator.Assert;
import com.villege.common.validator.ValidatorUtils;
import com.villege.entity.sys.*;
import com.villege.modules.base.AbstractController;
import com.villege.service.sys.AgentInfoService;
import com.villege.shiro.ShiroUtils;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;

@RestController
@RequestMapping("/sys/agent")
public class AgentInfoController extends AbstractController {
    @Autowired
    private AgentInfoService agentInfoService;
    @Value("${upload.absPath}")
    String absPath;
    @Value("${upload.excel}")
    String excel;

    @PostMapping("/list")
    @RequiresPermissions("sys:agent:list")
    public R list(@RequestBody Map<String, Object> params) {
        if(getUser().getUserType()==2){
            return R.error("对不起，单位管理员没有权限。");
        }
        PageUtils pageList = agentInfoService.getPageList(params);
        return R.ok().put("data", pageList);
    }
    @PostMapping("/save")
    @RequiresPermissions("sys:agent:save")
    public R saveOrUpdate(@RequestBody AgentInfoEntity agent){
        ValidatorUtils.validateEntity(agent);
        agentInfoService.saveOrUpdate(agent);

        return R.ok();
    }
    @ApiOperation("单位信息")
    @GetMapping("/myInfo")
    public R myInfo() {
        AgentInfoEntity agent = agentInfoService.getEntityById(getUser().getAgentId());
        Assert.isNull(agent, "系统中没有该单位");
        return R.ok().put("data", agent);
    }
    @ApiOperation("获取单位信息")
    @GetMapping("/info/{agentId}")
    @RequiresPermissions("sys:agent:info")
    public R info(@PathVariable("agentId") Long agentId) {
        AgentInfoEntity agent = agentInfoService.getEntityById(agentId);
        Assert.isNull(agent, "系统中没有该单位");
        return R.ok().put("data", agent);
    }
    @SysLog("添加单位")
    @PostMapping("/add")
    @ApiOperation("添加单位")
    @RequiresPermissions("sys:agent:add")
    public R add(@RequestBody AgentInfoEntity entity,MultipartFile file1) {
        ValidatorUtils.validateEntity(entity);
        entity.setRegisterTime(new Date());
        SysUserEntity user = ShiroUtils.getUser();
        entity.setManagerName(user.getUsername());
        try {
            agentInfoService.save(entity);
        }catch(Exception e) {
            return R.error("存在重复的单位编号");
        }
        return R.ok();
    }


    @SysLog("编辑单位")
    @PutMapping("/edit")
    @ApiOperation("编辑单位")
    @RequiresPermissions("sys:agent:info")
    public R edit(@RequestBody AgentInfoEntity entity) {
        ValidatorUtils.validateEntity(entity);
        AgentInfoEntity agent = agentInfoService.getEntityById(entity.getAgentId());
        if(entity.getAgentIcon()==null || entity.getAgentIcon().equals("")){
            entity.setAgentIcon(agent.getAgentIcon());
        }
        entity.setRegisterTime(agent.getRegisterTime());
        entity.setManagerName(ShiroUtils.getUser().getUsername());
        agentInfoService.updateById(entity);
        return R.ok();
    }
    @SysLog("修改单位信息")
    @PutMapping("/editMyInfo")
    @ApiOperation("编辑单位")
    public R editMyInfo(@RequestBody AgentInfoEntity entity) {
        agentInfoService.editMyInfo(entity);
        return R.ok();
    }

    @SysLog("删除单位")
    @DeleteMapping("/del")
    @ApiOperation("删除单位")
    @RequiresPermissions("sys:agent:del")
    public R del(@RequestBody Long[] ids) {

        if (ArrayUtils.contains(ids, getAgentId())) {
            return R.error("当前单位不能删除");
        }
        agentInfoService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }
    @PostMapping("/exportExcel")
    @RequiresPermissions("sys:agent:list")
    //导出试卷
    public R expInit(@RequestBody Map<String, Object> params) throws Exception{

        List<AgentInfoEntity> agentList = agentInfoService.getExcelList(params);
        String path=excel;
        path=new com.villege.utils.ExportToExcel().ExpAgent(agentList,path, 3);
        return R.ok().put("data",path);
    }
}
