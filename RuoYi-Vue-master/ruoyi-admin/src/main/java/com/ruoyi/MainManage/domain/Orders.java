package com.ruoyi.MainManage.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单处理对象 orders
 * 
 * @author CaiYang
 * @date 2024-03-01
 */
public class Orders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单id */
    private Long orderId;

    /** 物料编号 */
    @Excel(name = "物料编号")
    private Long componentId;

    /** 订单所属站点编号 */
    @Excel(name = "订单所属站点编号")
    private Long stationId;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private Long orderStatus;

    /** 订单创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "订单创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 物料数量 */
    @Excel(name = "物料数量")
    private Long number;

    /** 分配车辆编号 */
    @Excel(name = "分配车辆编号")
    private Long carId;

    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }
    public void setComponentId(Long componentId) 
    {
        this.componentId = componentId;
    }

    public Long getComponentId() 
    {
        return componentId;
    }
    public void setStationId(Long stationId) 
    {
        this.stationId = stationId;
    }

    public Long getStationId() 
    {
        return stationId;
    }
    public void setOrderStatus(Long orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public Long getOrderStatus() 
    {
        return orderStatus;
    }
    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public Date getCreateTime()
    {
        return createTime;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setCarId(Long carId) 
    {
        this.carId = carId;
    }

    public Long getCarId() 
    {
        return carId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderId", getOrderId())
            .append("componentId", getComponentId())
            .append("stationId", getStationId())
            .append("orderStatus", getOrderStatus())
            .append("createTime", getCreateTime())
            .append("number", getNumber())
            .append("carId", getCarId())
            .toString();
    }
}
