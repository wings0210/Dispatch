package com.ruoyi.other_manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 线路信息对象 route_info
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public class RouteInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 点集id */
    private Long pointId;

    /** 外键id */
    @Excel(name = "外键id")
    private Long routeId;

    /** 点经度 */
    @Excel(name = "点经度")
    private Long lon;

    /** 点纬度 */
    @Excel(name = "点纬度")
    private Long lat;

    public void setPointId(Long pointId) 
    {
        this.pointId = pointId;
    }

    public Long getPointId() 
    {
        return pointId;
    }
    public void setRouteId(Long routeId) 
    {
        this.routeId = routeId;
    }

    public Long getRouteId() 
    {
        return routeId;
    }
    public void setLon(Long lon) 
    {
        this.lon = lon;
    }

    public Long getLon() 
    {
        return lon;
    }
    public void setLat(Long lat) 
    {
        this.lat = lat;
    }

    public Long getLat() 
    {
        return lat;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("pointId", getPointId())
            .append("routeId", getRouteId())
            .append("lon", getLon())
            .append("lat", getLat())
            .toString();
    }
}
