package com.ruoyi.other_manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 物料管理对象 component
 * 
 * @author CaiYang
 * @date 2024-03-02
 */
public class Component extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 物料零件名称 */
    @Excel(name = "物料零件名称")
    private String componentName;

    /** 物料零件编号 */
    private Long componentId;

    /** 物料零件类型 */
    @Excel(name = "物料零件类型")
    private Long componentType;

    /** 物料零件图片 */
    @Excel(name = "物料零件图片")
    private String view;

    /** 零件重量 */
    @Excel(name = "零件重量")
    private Long weight;

    /** 零件长度 */
    @Excel(name = "零件长度")
    private Long length;

    /** 零件宽度 */
    @Excel(name = "零件宽度")
    private Long wide;

    /** 零件高度 */
    @Excel(name = "零件高度")
    private Long tall;

    public void setComponentName(String componentName) 
    {
        this.componentName = componentName;
    }

    public String getComponentName() 
    {
        return componentName;
    }
    public void setComponentId(Long componentId) 
    {
        this.componentId = componentId;
    }

    public Long getComponentId() 
    {
        return componentId;
    }
    public void setComponentType(Long componentType) 
    {
        this.componentType = componentType;
    }

    public Long getComponentType() 
    {
        return componentType;
    }
    public void setView(String view) 
    {
        this.view = view;
    }

    public String getView() 
    {
        return view;
    }
    public void setWeight(Long weight) 
    {
        this.weight = weight;
    }

    public Long getWeight() 
    {
        return weight;
    }
    public void setLength(Long length) 
    {
        this.length = length;
    }

    public Long getLength() 
    {
        return length;
    }
    public void setWide(Long wide) 
    {
        this.wide = wide;
    }

    public Long getWide() 
    {
        return wide;
    }
    public void setTall(Long tall) 
    {
        this.tall = tall;
    }

    public Long getTall() 
    {
        return tall;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("componentName", getComponentName())
            .append("componentId", getComponentId())
            .append("componentType", getComponentType())
            .append("view", getView())
            .append("weight", getWeight())
            .append("length", getLength())
            .append("wide", getWide())
            .append("tall", getTall())
            .toString();
    }
}
