package com.ruoyi.other_manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 站点详细信息对象 station_info
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public class StationInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long infoId;

    /** 关联主表的外键 */
    @Excel(name = "关联主表的外键")
    private String stationName;

    /** 站点经度 */
    @Excel(name = "站点经度")
    private double lon;

    /** 站点纬度 */
    @Excel(name = "站点纬度")
    private double lat;

    /** 站点方向角度 */
    @Excel(name = "站点方向角度")
    private double azi;

    /** 关联线路外键 */
    @Excel(name = "关联线路外键")
    private String belongRouteName;

    public void setInfoId(Long infoId) 
    {
        this.infoId = infoId;
    }

    public Long getInfoId() 
    {
        return infoId;
    }
    public void setStationName(String stationName) 
    {
        this.stationName = stationName;
    }

    public String getStationName() 
    {
        return stationName;
    }
    public void setLon(double lon)
    {
        this.lon = lon;
    }

    public double getLon()
    {
        return lon;
    }
    public void setLat(double lat)
    {
        this.lat = lat;
    }

    public double getLat()
    {
        return lat;
    }
    public void setAzi(double azi)
    {
        this.azi = azi;
    }

    public double getAzi()
    {
        return azi;
    }
    public void setBelongRouteName(String belongRouteName) 
    {
        this.belongRouteName = belongRouteName;
    }

    public String getBelongRouteName() 
    {
        return belongRouteName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("infoId", getInfoId())
            .append("stationName", getStationName())
            .append("lon", getLon())
            .append("lat", getLat())
            .append("azi", getAzi())
            .append("belongRouteName", getBelongRouteName())
            .toString();
    }
}
