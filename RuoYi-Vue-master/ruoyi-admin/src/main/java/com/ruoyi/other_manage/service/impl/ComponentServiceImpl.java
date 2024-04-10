package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.ComponentMapper;
import com.ruoyi.other_manage.domain.Component;
import com.ruoyi.other_manage.service.IComponentService;

/**
 * 物料管理Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-03-02
 */
@Service
public class ComponentServiceImpl implements IComponentService 
{
    @Autowired
    private ComponentMapper componentMapper;

    /**
     * 查询物料管理
     * 
     * @param componentId 物料管理主键
     * @return 物料管理
     */
    @Override
    public Component selectComponentByComponentId(Long componentId)
    {
        return componentMapper.selectComponentByComponentId(componentId);
    }

    /**
     * 查询物料管理列表
     * 
     * @param component 物料管理
     * @return 物料管理
     */
    @Override
    public List<Component> selectComponentList(Component component)
    {
        return componentMapper.selectComponentList(component);
    }

    /**
     * 新增物料管理
     * 
     * @param component 物料管理
     * @return 结果
     */
    @Override
    public int insertComponent(Component component)
    {
        return componentMapper.insertComponent(component);
    }

    /**
     * 修改物料管理
     * 
     * @param component 物料管理
     * @return 结果
     */
    @Override
    public int updateComponent(Component component)
    {
        return componentMapper.updateComponent(component);
    }

    /**
     * 批量删除物料管理
     * 
     * @param componentIds 需要删除的物料管理主键
     * @return 结果
     */
    @Override
    public int deleteComponentByComponentIds(Long[] componentIds)
    {
        return componentMapper.deleteComponentByComponentIds(componentIds);
    }

    /**
     * 删除物料管理信息
     * 
     * @param componentId 物料管理主键
     * @return 结果
     */
    @Override
    public int deleteComponentByComponentId(Long componentId)
    {
        return componentMapper.deleteComponentByComponentId(componentId);
    }
}
