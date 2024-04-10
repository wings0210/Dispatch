package com.ruoyi.MainManage.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class MixOrders {
    /** 订单id */
    private Long orderId;

    /** 物料编号 */
    @Excel(name = "物料名称")
    private String componentName;

    /** 订单所属站点编号 */
    @Excel(name = "订单所属站点名称")
    private String stationName;

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
    @Excel(name = "分配车辆名称")
    private String carName;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getComponentName() {
        return componentName;
    }

    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public Long getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Long orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public MixOrders(Long orderId, String componentName, String stationName, Long orderStatus, Date createTime, Long number, String carName) {

        this.orderId = orderId;
        this.componentName = componentName;
        this.stationName = stationName;
        this.orderStatus = orderStatus;
        this.createTime = createTime;
        this.number = number;
        this.carName = carName;
    }

    @Override
    public String toString() {
        return "MixOrder{" +
                "orderId=" + orderId +
                ", componentName='" + componentName + '\'' +
                ", stationName='" + stationName + '\'' +
                ", orderStatus=" + orderStatus +
                ", createTime=" + createTime +
                ", number=" + number +
                ", carName='" + carName + '\'' +
                '}';
    }
}
