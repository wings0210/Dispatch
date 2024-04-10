package com.ruoyi.MainManage.mapper;

import java.util.List;

import com.ruoyi.MainManage.domain.MixOrders;
import com.ruoyi.MainManage.domain.Orders;
import com.ruoyi.other_manage.domain.Car;
import com.ruoyi.other_manage.domain.Component;
import com.ruoyi.other_manage.domain.Station;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单处理Mapper接口
 * 
 * @author CaiYang
 * @date 2024-03-01
 */
@Mapper
public interface OrdersMapper 
{
    /**
     * 查询订单处理
     * 
     * @param orderId 订单处理主键
     * @return 订单处理
     */
    public Orders selectOrdersByOrderId(Long orderId);

    /**
     * 查询订单处理列表
     * 
     * @param orders 订单处理
     * @return 订单处理集合
     */
    public List<Orders> selectOrdersList(Orders orders);

    /**
     * 新增订单处理
     * 
     * @param orders 订单处理
     * @return 结果
     */
    public int insertOrders(Orders orders);

    /**
     * 修改订单处理
     * 
     * @param orders 订单处理
     * @return 结果
     */
    public int updateOrders(Orders orders);

    /**
     * 删除订单处理
     * 
     * @param orderId 订单处理主键
     * @return 结果
     */
    public int deleteOrdersByOrderId(Long orderId);

    /**
     * 批量删除订单处理
     * 
     * @param orderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrdersByOrderIds(Long[] orderIds);


    public List<Station> selectStation();

    public List<Component> selectComponent();

    public List<Car> selectCar();


    /*public List<Orders> selectErrorOrders();*/

    public List<MixOrders> selectReadyList();

    /*public List<Orders> selectScreenWarn();*/

    public List<MixOrders> padTransportingList(Orders orders);

    public List<MixOrders> padReadyList(Orders orders);


    /**
     * 实验
     */
    public List<MixOrders> selectWarnList();



}

