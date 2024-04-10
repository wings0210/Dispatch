package com.ruoyi.other_manage.service;

import java.util.List;
import com.ruoyi.other_manage.domain.Component;

/**
 * 物料管理Service接口
 * 
 * @author CaiYang
 * @date 2024-03-02
 */
public interface IComponentService 
{
    /**
     * 查询物料管理
     * 
     * @param componentId 物料管理主键
     * @return 物料管理
     */
    public Component selectComponentByComponentId(Long componentId);

    /**
     * 查询物料管理列表
     * 
     * @param component 物料管理
     * @return 物料管理集合
     */
    public List<Component> selectComponentList(Component component);

    /**
     * 新增物料管理
     * 
     * @param component 物料管理
     * @return 结果
     */
    public int insertComponent(Component component);

    /**
     * 修改物料管理
     * 
     * @param component 物料管理
     * @return 结果
     */
    public int updateComponent(Component component);

    /**
     * 批量删除物料管理
     * 
     * @param componentIds 需要删除的物料管理主键集合
     * @return 结果
     */
    public int deleteComponentByComponentIds(Long[] componentIds);

    /**
     * 删除物料管理信息
     * 
     * @param componentId 物料管理主键
     * @return 结果
     */
    public int deleteComponentByComponentId(Long componentId);
}
