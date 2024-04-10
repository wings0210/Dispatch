package com.ruoyi.other_manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车辆信息对象 car
 * 
 * @author CaiYang
 * @date 2024-03-22
 */
public class Car extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 车辆id */
    private Long carId;

    /** 车辆类型 */
    @Excel(name = "车辆类型")
    private String carType;

    /** 车辆描述 */
    @Excel(name = "车辆描述")
    private String carDetail;

    /** 车辆编号名称 */
    @Excel(name = "车辆编号名称")
    private String carName;

    /** 车辆使用状态 */
    @Excel(name = "车辆使用状态")
    private Long carStatus;

    /** 车辆所属线路 */
    @Excel(name = "车辆所属线路")
    private String carRouteName;

    public void setCarId(Long carId) 
    {
        this.carId = carId;
    }

    public Long getCarId() 
    {
        return carId;
    }
    public void setCarType(String carType) 
    {
        this.carType = carType;
    }

    public String getCarType() 
    {
        return carType;
    }
    public void setCarDetail(String carDetail) 
    {
        this.carDetail = carDetail;
    }

    public String getCarDetail() 
    {
        return carDetail;
    }
    public void setCarName(String carName) 
    {
        this.carName = carName;
    }

    public String getCarName() 
    {
        return carName;
    }
    public void setCarStatus(Long carStatus) 
    {
        this.carStatus = carStatus;
    }

    public Long getCarStatus() 
    {
        return carStatus;
    }
    public void setCarRouteName(String carRouteName) 
    {
        this.carRouteName = carRouteName;
    }

    public String getCarRouteName() 
    {
        return carRouteName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("carId", getCarId())
            .append("carType", getCarType())
            .append("carDetail", getCarDetail())
            .append("carName", getCarName())
            .append("carStatus", getCarStatus())
            .append("carRouteName", getCarRouteName())
            .toString();
    }
}
