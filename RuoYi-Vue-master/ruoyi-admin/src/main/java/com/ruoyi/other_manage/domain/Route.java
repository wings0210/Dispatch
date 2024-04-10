package com.ruoyi.other_manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 线路对象 route
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public class Route extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 线路id */
    private Long routeId;

    /** 线路名称 */
    @Excel(name = "线路名称")
    private String routeName;

    /** 中心点经度 */
    @Excel(name = "中心点经度")
    private Long centerLong;

    /** 中心点纬度 */
    @Excel(name = "中心点纬度")
    private Long centerLat;

    public void setRouteId(Long routeId) 
    {
        this.routeId = routeId;
    }

    public Long getRouteId() 
    {
        return routeId;
    }
    public void setRouteName(String routeName) 
    {
        this.routeName = routeName;
    }

    public String getRouteName() 
    {
        return routeName;
    }
    public void setCenterLong(Long centerLong) 
    {
        this.centerLong = centerLong;
    }

    public Long getCenterLong() 
    {
        return centerLong;
    }
    public void setCenterLat(Long centerLat) 
    {
        this.centerLat = centerLat;
    }

    public Long getCenterLat() 
    {
        return centerLat;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("routeId", getRouteId())
            .append("routeName", getRouteName())
            .append("centerLong", getCenterLong())
            .append("centerLat", getCenterLat())
            .toString();
    }
}
